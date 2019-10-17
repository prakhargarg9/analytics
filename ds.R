#Data Structures in R

#vectors----
v1 = 10
v1 #show the value of variable
print(v1) #show the value of variable

v2 = 1:100 # Create vector with 100 values
v2

(v3 = c(1,6,4,10)) # Create & Print

v4 # Throw Error since the variable is not declared

v4 = seq(1,100,5)
v4

v5 = c('A','Prakhar','IIFT')
v5
class(v5) # It will show the data type of variable

class(v1)

v6 = 1:100000
(v7 =rnorm(100, mean = 60, sd=10))

mean(v7)

sd(v7)

v7

v7[1:10] # SHow first ten data

v7[seq(1,100,2)] # show alternate values

v7[v7 >50 ] # show values which satisfy conditions

v7[v7 > 70 | v7 <50]

mean(v7[v7 > 70 | v7 <50])

plot(v7)
hist(v7)

plot(density(v7))

hist(v7,breaks=10)

quantile(v7)

summary(v7)

quantile(v7, seq(0,1,0.1))
quantile(v7, seq(0,1,0.01))

sort(v7)

sort(v7, decreasing = TRUE)

#matrix----
(data = 24:1)
v12 = c(1,3,'A') # It converts number to character in this case
v12

v13 = 1:10
v13 +2
v13 ^ 2

v13/ sum(v13)
data
m1 = matrix(data)
m1

(m2 = matrix(data, nrow=4)) #Allocating no of rows
(m2 = matrix(data, nrow=4, byrow=T)) #Allocating values row wise
?matrix

m2[1,] # Print first row

m2[,1]

m2[,c(1,3)]

m2[c(2,4),c(2,4,5)]

rowSums(m2)
colSums(m2)

rowMeans(m2)
colMeans(m2)

m2

table(mtcars$cyl)
t1 = table(mtcars$cyl,mtcars$gear, dnn=c('cyl','gear'))
t1

margin.table(t1)
margin.table(t1,margin = 1) # FInding the no of cylinder from the table
margin.table(t1,margin = 2) # Finding the no of gear from the table

addmargins(t1)
t1

?addmargins
addmargins(t1, FUN=mean)
addmargins(t1, FUN=list(list(mean,sum,sd,var), list(mean,sum,sd,var)))

m2
sweep(m2,MARGIN = 1, STATS = 4, FUN = '+')
sweep(m2,MARGIN = 1, STATS = c(1,2,3,4), FUN = '*')

sweep(m2,MARGIN = 2, STATS = c(1,2,3,4,5,6), FUN = '*')

#dataFrame----

mtcars
data()
AirPassengers

class(mtcars)
head(mtcars,n=3)

tail(mtcars)
dim(mtcars) #dimensions of data frame mtcars

nrow(mtcars)
names(mtcars)
rownames(mtcars)
head(mtcars)
summary(mtcars)

#summarising / filter data from DF
mtcars[ mtcars$gear == 4,]
mtcars[ mtcars$gear == 4 & mtcars$mpg < 25, c('mpg','gear','cyl')]

mtcars
mtcars[order(mtcars$mpg), ]
head(mtcars)

mtcars[row.names(mtcars) == 'Mazda RX4',]

mtcars[c(1,3,4),c(1,5)]

#export to csv
mtcars
write.csv(mtcars,'prakhar.csv')
df1 = read.csv('prakhar.csv')

head(df1)
names(df1)

length(names(df1))
ncol(df1)

write.csv(mtcars,'prakhar1.csv',row.names=F)
df2 = read.csv('prakhar1.csv')
head(df2)

(carnames = paste('car',1:32,sep='-'))
df2$cars = carnames
head(df2)

#Create dataframe from scratch
#roll no, name, gender, marks, grade
(rollno = 1:30)
(name = paste('Student',1:30))
rep(c('M','F'),c(4,3))

set.seed(123)
(gender = sample(c('M','F'),size=30,replace=T))
table(gender)
prop.table(table(gender))

#Uniform distribution of values
(marks = runif(30, min=50,max=100))

x=c(-14.45,-14.67,14.45,14.67)
x
trunc(x)
round(x,1)
floor(x)
ceiling(x)
(grades = sample(c('A','B','C'),size=30,replace=T, prob =c(.3, .45, .25)))
table(grades)
prop.table(table(grades))

rollno ; name ; gender ; marks; grades

students = data.frame(rollno,name,gender,marks,grades)
head(students)
str(students)
summary(students)
students$name = as.character(students$name)
str(students)
summary(students)

students$grades = factor(students$grades, ordered=T)
students$grades

students$grades = factor(students$grades, ordered=T, levels=c('C','B','A'))
students$grades

table(students$grades)

barplot(table(students$grades), col = 1:3)
hist(students$marks)
range(students$marks)
hist(students$marks, breaks=c(0,70,90,100))

#Display students all Male and marks>70
students[students$gender=='M' & students$marks >70, ]

# Tomorrow we will start with packages
#install.packages(dplyr)
library(dplyr)

students %>% filter(gender == 'M' & marks >70) %>% arrange(marks) %>% head(n=3) %>% select(rollno,name)
