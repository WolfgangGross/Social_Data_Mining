#before loading data I added Header with multiple Con tent columns
#replacest every tab with a ;
#deleted every " to avoid big block of colided rows

#####################
#setting envioronment
library(ggplot2)
library(data.table)
setwd("~/Documents/programmierung/Social_Data_Mining")

#####################
#loading data in
dat <- read.csv('13July_19xxxx.csv',sep='\t')
#dat <- fread('13July_19xxxx.csv',sep='\t')
#save data in file to load it fster
saveRDS(dat, file="data.Rda")
dat <- readRDS(file="data.Rda")

#####################
#clean data from empty of non rea data
dat$Content[dat$Content == ''] <- NA
#loos last two columns C16 und C17
dat$C16 <- NULL
dat$C17 <- NULL

dat  <- na.omit(dat)
#put content back together and delete unused columns
dat$Content <- paste(dat$Content,dat$C1,dat$C2,dat$C3,dat$C4,dat$C5,dat$C6,dat$C7,dat$C8,dat$C9,dat$C10,dat$C11,dat$C12,dat$C13,dat$C14,dat$C15)
dat$C1 <- NULL;dat$C2 <- NULL;dat$C3 <- NULL;dat$C4 <- NULL;dat$C5 <- NULL;dat$C6 <- NULL;dat$C7 <- NULL;dat$C8 <- NULL;dat$C9 <- NULL;dat$C10 <- NULL;dat$C11 <- NULL;dat$C12 <- NULL;dat$C13 <- NULL;dat$C14 <- NULL;dat$C15 <- NULL
#####################
#count for each time the number of posts
count = c()
#remove the doubles form dat$Timestamp; get unique
times <- unique(dat$Timestamp)
for (i in times ){count <- append(count,sum(dat$Timestamp==i))}

#####################
#plot
#get times no as factors
#convert Time into real time format
timeReal <- strptime(as.character(times),format="%Y%m%d%H%M%S")

df <- data.frame(timeReal,count)
ggplot(df,aes(x=timeReal,y=count)) + geom_line()


###########
#Save changes to file
saveRDS(dat, file="data.Rda")


