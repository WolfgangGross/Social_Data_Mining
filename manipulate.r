#####################
#setting environment
library(ggplot2)
library(bit64)
library(data.table)
#setwd("~/Documents/Coxi/WS1415/Social Data Mining/Data/")
#setwd("~/Documents/programmierung/Social Data Mining All")

#####################
#loading & saving data
#small_13-July_file
#dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/13July_xxxx.Rda")

#2014-07-12
dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140712.Rda")

#2014-07-13
#dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140713.Rda")

#2014-07-14
#dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140714.Rda")

#####################
#count for each time the number of posts
count = c()
#remove the doubles form dat$Timestamp; get unique
times <- unique(dat$V3)
#table gets number of elements
count  <- data.frame(table(dat$V3))

#sum up per minute and per hour
sumMinute <- c()
for(i in 1:as.integer(length(count$Freq)/60)){sumMinute <- append(sumMinute,sum(count$Freq[(i*60-59):(i*60)]))}
sumHour <- c()
for(k in 1:(length(sumMinute)/60)){sumHour <- append(sumHour,sum(sumMinute[(k*60-59):(k*60)]))}

#####################
#plot
#convert Time into real time format
timeReal <- strptime(as.character(times),format="%Y%m%d%H%M%S")

df <- data.frame(timeReal,count$Freq)
ggplot(df,aes(x=timeReal,y=count$Freq)) + geom_line()
