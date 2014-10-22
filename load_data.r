#load data into workspace and set workspace

#####################
#setting envioronment
library(ggplot2)
library(data.table)
setwd("~/Documents/programmierung/Social Data Mining All")


#####################
#loading data in
dat <- read.csv('13July_19xxxx.csv',sep='\t')
#dat <- fread('13July_19xxxx.csv',sep='\t')

#save data in file to load it fster
saveRDS(dat, file="data.Rda")
dat <- readRDS(file="data.Rda")

