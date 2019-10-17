#reshape----
library(reshape2)

(rollno=1:30)
(gender = sample(c('M','F'), size =30, replace = T))
(sub1=rnorm(30,mean=50,sd=10))
(sub2 = runif(30, min=50, max=90))
(sub3 = rnorm(30,65,12))

exam = data.frame(rollno, gender,  sub1, sub2, sub3)
head(exam)

# Without using delpoyer functionality
exam[1:5, -1] # Showing the rows and colums of exam data frame
#colMeans(exam[, -1])
#rowSums(exam[,-1])
#rowMeans(exam[,-1])

colMeans(exam[, -c(1,2)])
rowSums(exam[,-c(1,2)])
rowMeans(exam[,-c(1,2)])

dim(exam)
exam %>% mutate(totalMarks = sub1 + sub2 + sub3) %>% head()
?melt
#error
longdata = melt(exam, id.vars = ('rollno' ,'gender'), variable.name = 'subject', value.name = 'marks')
head(longdata)
dim(longdata)

longdata %>% group_by(subject) %>% summarise(mean(marks), max(marks), min(marks), sd(marks))

widedata = dcast(longdata, rollno ~ subject)
head(widedata)
head(exam)

# Using deployer
summarise(exam, mean(sub1),mean(sub2),mean(sub3))

#



#missing values----

v1 = c(1,2,3,5)
is.na(v1)

v2 = c(1, NA,3,NA)
is.na(v2)

sum(is.na(v2))

install.packages("VIM")
library(VIM)

data(sleep)
?sleep
sleep

dim(sleep) # finding no of rows
str(sleep)
summary(sleep)

is.na(sleep)

sum(is.na(sleep))

rowSums(is.na(sleep))
head(sleep)

df = sleep
df$missing = rowSums(is.na(df))
head(df)
colSums(is.na(sleep))

v4 = c(1,5,NA,6,NA)
is.na(v4)
v4[is.na(v4)]
mean(v4, na.rm =T)

# missing value replacement
v4[is.na(v4)] = mean(v4,na.rm=T)
v4

v4[is.na(v4)] = min(v4, na.rm=T)
v4

sleep
#Tell which rows have missing values
complete.cases(sleep)
sum(complete.cases(sleep))

sleep[complete.cases(sleep),]

sleep[,]

