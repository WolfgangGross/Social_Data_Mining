#####################
#setting environment
library(ggplot2)
library(bit64)
library(data.table)
#setwd("~/Documents/Coxi/WS1415/Social Data Mining/Data/")
setwd("~/Documents/programmierung/Social Data Mining All")

#####################
#loading & saving data
#small_13-July_file
#dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/13July_xxxx.Rda")

#2014-07-12
#dat <- readRDS(file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140712.Rda")


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
for(i in seq(1,length(count$Freq),60)){sumMinute <- append(sumMinute,sum(count$Freq[i:(i+60)]))}
sumHour <- c()
for(k in seq(1,length(count$Freq),3600)){sumHour <- append(sumHour,sum(count$Freq[k:(k+3600)]))}

#####################
#plot
#convert Time into real time format
realTime <- strptime(as.character(count$Var1),format="%Y%m%d%H%M%S")
Tweet.count <- count$Freq

df <- data.frame(realTime,Tweet.count)
ggplot(df,aes(x=realTime,y=Tweet.count)) + geom_line()

#plot tweets per minute
minuteTimestamps <- realTime[seq(1, length(realTime), 60)]
minutePlotDf <- data.frame(minuteTimestamps,sumMinute)
ggplot(minutePlotDf,aes(x=minuteTimestamps,y=sumMinute)) + geom_line()

#plot tweets per minute
hourTimestamps <- realTime[seq(1, length(realTime), 3600)]
hourPlotDf <- data.frame(hourTimestamps,sumHour)
ggplot(hourPlotDf,aes(x=hourTimestamps,y=sumHour)) + geom_line()
