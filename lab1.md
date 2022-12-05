# Лабораторна робота № 1. Завантаження та зчитування даних.

## 1. За допомогою download.file() завантажте любий excel файл з порталу http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.

```{R}
install.packages("xlsx") 
library(xlsx) 
install.packages("readxl") 
library(readxl)
install.packages("XML") 
library(XML)
events_web<-"https://data.gov.ua/dataset/c164ab46-25e1-4590-b63d-6e3c0fc6a52c/resource/d09ec7be-ba95-43ca-9c3a-37d0afafa31c/download/events_of_science.xlsx"
events<-"C:/Users/user/Documents/events_of_science.xlsx"
download.file (events_web, events, mode = "wb")
table_events<-read_xlsx(events)
head(table_events, n=6)
# A tibble: 6 x 5
  identifier  Theme                                                  Venue                      `Date of holdin~ `The main issues to discuss`                                 
  <chr>       <chr>                                                  <chr>                      <chr>            <chr>                                                        
1 Ідентифіка~ Тема                                                   Місце проведення           Дата проведення  Основні питання для обговорення                              
2 1           Всеукраїнська науково-практична конференція молодих в~ Військовий інститут Київс~ 43556            Оприлюднення наукових робіт слухачів, курсантів Військового ~
3 2           Міжнародний форум із кризових комунікацій: “Комунікац~ Військовий інститут Київс~ 43586            Розгляд науково-практичних аспектів діяльності засобів масов~
4 3           ХV Міжнародна науково-практична конференція “Військов~ Військовий інститут Київс~ 43770            Обговорення стану та перспектив розвитку військової освіти і~
5 4           Науково-практична конференція курсантів “Взаємозв’язо~ Житомирській військовий і~ 43525            Обговорення результатів фундаментальних і прикладних наукови~
6 5           Всеукраїнська науково-практична конференція “Проблеми~ Житомирській військовий і~ 43739            Обговорення проблемних питань планування, організації та про~
```

## 2. За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та завантажте дані в R. Code book, що пояснює значення змінних знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 Необхідно знайти, скільки property мають value $1000000+
```{R}
housing_web<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
housing<-"C:/Users/user/Documents/housing.csv"
download.file (housing_web, housing)
table_housing<-read.csv(housing)
length(which(table_housing$VAL==24))
[1] 53
```

## 3.	Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?
```{R}
rest_web<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
rest<-xmlTreeParse(rest_web, useInternal = TRUE)
root_rest<-xmlRoot(rest)
zipcode<-xpathSApply(root_rest, "//zipcode", xmlValue)
length(which(zipcode==21231))
[1] 127
```
