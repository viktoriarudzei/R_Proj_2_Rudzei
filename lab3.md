# Лабораторна робота № 3. Зчитування даних з WEB.

В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100	фільмами	2017	року	виходу	за	посиланням «http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature».	Необхідно створити data.frame «movies» з наступними даними: номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). Для виконання лабораторної рекомендується використати бібліотеку «rvest». CSS селектори для зчитування необхідних даних: rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». Для зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення зчитаних html даних в текст - html_text.  Рекомендується  перетворити  rank_data  та  runtime_data  з  тексту в числові	значення.	При	формуванні	дата	фрейму	функцією	data.frame рекомендується використати параметр «stringsAsFactors = FALSE».

```{R}
install.packages("rvest") 
library(rvest)
install.packages("stringr") 
library(stringr)
imdb<-read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")
rank <- html_nodes(imdb, '.text-primary')
rank_data<-as.integer (html_text(rank, trim = TRUE))
title <- html_nodes(imdb, '.lister-item-header a')
title_data <-  html_text(title, trim = TRUE)
runtime <- html_nodes(imdb, '.text-muted .runtime')
runtime_ <- str_remove(html_text(runtime, trim = TRUE), 'min')
runtime_data <- as.integer(runtime_)
Sys.setlocale(locale = "Ukrainian")
movies<-data.frame(rank_data, title_data, runtime_data, stringsAsFactors = FALSE)
movies
    rank_data                               title_data runtime_data
1           1  Зоряні війни: Епізод 8 - Останні Джедаї          152
2           2               Джуманджі: Поклик джунглів          119
3           3                            Тор: Рагнарок          130
4           4                                     Воно          135
5           5             Той, хто біжить по лезу 2049          164
6           6                     Найвеличнiший шоумен          105
7           7                        Пострiл в безодню          121
8           8                     Call Me by Your Name          132
9           9                       A Christmas Prince           92
10         10                      Вартові Галактики 2          136
11         11                     Дуже поганi матусi 2          104
12         12               Король Артур: Легенда меча          126
13         13                      Лiга справедливостi          120
14         14                                   Пастка          104
15         15                          Логан: Росомаха          137
16         16                       Анна й Апокалiпсис           93
17         17                               Форма води          123
18         18                                На драйві          113
19         19                                     Коко          105
20         20             Вбивство в Схiдному експресi          114
21         21                     Красуня i Чудовисько          129
22         22                  Kingsman: Золоте кiльце          141
23         23                                  Дюнкерк          106
24         24          Людина-павук: Повернення додому          133
25         25                           Секретне досьє          116
26         26                      Рятувальники Малiбу          116
27         27                           Чужий: Заповiт          122
28         28                                     Диво          113
29         29       Три білборди під Еббінґом, Міссурі          115
30         30                  Тебе нiколи тут не було           89
31         31                               Ледi Бьорд           94
32         32                               Диво-Жiнка          141
33         33                               Гарнi часи          101
34         34                               Джон Уiк 2          122
35         35            Баррi Сiл: Король контрабанди          115
36         36                          Усi грошi свiту          132
37         37                           The Babysitter           85
38         38 Пірати Карибського моря: Помста Салазара          129
39         39                                  Я, Тоня          119
40         40         Калiфорнiйський дорожнiй патруль          100
41         41           Валерiан i мiсто тисячi планет          137
42         42                                Гра Моллi          140
43         43                          Pitch Perfect 3           93
44         44             Трансформери: Останнiй лицар          154
45         45                                    Мати!          121
46         46               Christmas in the Heartland          112
47         47                           Sweet Virginia           93
48         48                          The Current War          102
49         49                                Зменшення          135
50         50              П'ятдесят вiдтiнкiв темряви          118
51         51                              The Snowman          119
52         52                             Вітряна ріка          107
53         53                           Привид у бронi          107
54         54                     Щасливий день смертi           96
55         55                            Three Christs          117
56         56                             Удача Лохана          118
57         57                      Конг: Острiв черепа          118
58         58                             Гра Джералда          103
59         59                                     Окча          120
60         60                        Хто в домi тато 2          100
61         61                           Примарна нитка          130
62         62                     Тiлоохоронець кiлера          118
63         63                Saban's Могутнi рейнджери          124
64         64                        Рiздвяна спадщина          104
65         65                            Та сама зiрка           86
66         66                                 Форсаж 8          136
67         67                               Темнi часи          125
68         68                                  Яскравi          117
69         69                             Горе-творець          104
70         70                                    Мумiя          110
71         71                         Атомна Блондинка          115
72         72                                Time Trap           87
73         73                   Історії сім'ї Майровіц          112
74         74                               Темна вежа           95
75         75                       xXx: Реактивiзацiя          107
76         76                    Вiйна за планету мавп          140
77         77                Вбивство священного оленя          121
78         78              Людина, яка винайшла Рiздво          104
79         79                     Американський убивця          112
80         80                           Only the Brave          134
81         81                     Воно приходить уночi           91
82         82                        1+1: Нова iсторiя          126
83         83                               Сiм сестер          123
84         84                                 Геошторм          109
85         85                                   Вороги          134
86         86                                  Метелик          133
87         87                           Смерть Сталiна          107
88         88                                  Тачки 3          102
89         89                        God's Own Country          104
90         90                            Гора мiж нами          112
91         91                               Обдарована          101
92         92                         Проект 'Флорида'          111
93         93                                Iноземець          113
94         94                   Brawl in Cell Block 99          132
95         95                                    Життя          104
96         96                                   Ритуал           94
97         97                  Розваги дорослих дiвчат          101
98         98                               Субурбiкон          105
99         99                        Кохання - хвороба          120
100       100                                     1922          102
```
## 1.	Виведіть перші 6 назв фільмів дата фрейму.

```{R}
top6 <- head(movies$title_data, 6)
top6
[1] "Зоряні війни: Епізод 8 - Останні Джедаї" "Джуманджі: Поклик джунглів"              "Тор: Рагнарок"                          
[4] "Воно"                                    "Той, хто біжить по лезу 2049"            "Найвеличнiший шоумен"     
```

## 2.	Виведіть всі назви фільмів с тривалістю більше 120 хв.
```{R}
longfilms <- subset(movies$title_data, runtime_data > 120)
longfilms
[1] "Зоряні війни: Епізод 8 - Останні Джедаї"  "Тор: Рагнарок"                            "Воно"                                    
 [4] "Той, хто біжить по лезу 2049"             "Пострiл в безодню"                        "Call Me by Your Name"                    
 [7] "Вартові Галактики 2"                      "Король Артур: Легенда меча"               "Логан: Росомаха"                         
[10] "Форма води"                               "Красуня i Чудовисько"                     "Kingsman: Золоте кiльце"                 
[13] "Людина-павук: Повернення додому"          "Чужий: Заповiт"                           "Диво-Жiнка"                              
[16] "Джон Уiк 2"                               "Усi грошi свiту"                          "Пірати Карибського моря: Помста Салазара"
[19] "Валерiан i мiсто тисячi планет"           "Гра Моллi"                                "Трансформери: Останнiй лицар"            
[22] "Мати!"                                    "Зменшення"                                "Примарна нитка"                          
[25] "Saban's Могутнi рейнджери"                "Форсаж 8"                                 "Темнi часи"                              
[28] "Вiйна за планету мавп"                    "Вбивство священного оленя"                "Only the Brave"                          
[31] "1+1: Нова iсторiя"                        "Сiм сестер"                               "Вороги"                                  
[34] "Метелик"                                  "Brawl in Cell Block 99"                  
```

## 3.	Скільки фільмів мають тривалість менше 100 хв.
```{R}
shortfilms <- length(subset(movies$title_data, runtime_data < 100))
shortfilms 
[1] 13
```
