# Лабораторна робота № 5. Отримання та очистка даних.


setwd("C:\\users\\dumen\\Documents\\UCI HAR Dataset")
install.packages("dplyr") 
library(dplyr)

# dataframe with descriptive column names
labels_ <- read.table('features.txt', colClasses = "character")[,2]


## 4.	Відповідно присвоює змінним у наборі даних описові імена.

# assign descriptive labels(done simultaneously with reading dataset)
x.train <- read.table('train/X_train.txt', col.names = labels_, check.names = F)
y.train <- read.table('train/y_train.txt', col.names = c('activity'))
subject.train <- read.table('train/subject_train.txt', col.names = c('subject'))

x.test <- read.table('test/X_test.txt', col.names = labels_, check.names = F)
y.test <- read.table('test/y_test.txt', col.names = c('activity'))
subject.test <- read.table('test/subject_test.txt', col.names = c('subject'))

activity.labels <- read.table('activity_labels.txt', col.names = c('n','text'))


## 1.	Об’єднує навчальний та тестовий набори, щоб створити один набір даних.

data <- cbind(rbind(x.train, x.test),
              rbind(y.train, y.test), 
              rbind(subject.train, subject.test))


## 2.	Витягує лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.

data2 <- data[, !duplicated(colnames(data))]
data3 <- select(data2,  matches("mean\\(\\)|std\\(\\)|subject|activity"))

## 3.	Використовує описові назви діяльностей (activity) для найменування діяльностей у наборі даних.

data4 <- within(data3, activity <- factor(activity, labels = activity.labels[,2]))

## 5.	З набору даних з кроку 4 створити другий незалежний акуратний набір даних (tidy dataset) із середнім значенням для кожної змінної для кожної діяльності та кожного суб’єкту (subject).

# simplified dataframe with aggregate statistics(mean of mean and mean of sd)
data5 <- aggregate(x = data4[, -c(67,68)], 
                   by = list(data4[,'subject'], data4[, 'activity']),
                   FUN = mean)

write.csv(data5, "tidy_dataset.csv", row.names=F)
