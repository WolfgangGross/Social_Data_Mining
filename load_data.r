#load data into workspace and set workspace

#####################
#setting envioronment
library(ggplot2)
library(data.table)
library(bit64)
setwd("~/Documents/programmierung/Social Data Mining All")


#####################
#loading data in
dat <- read.csv('13July_19xxxx.csv',sep='\t')
dat <- read.csv('13July_19xxxx_with_semi2.csv',sep=';')
#faster
dat <- fread('13July_19xxxx_with_semi2.csv',sep=';')

#save data in file to load it fster
saveRDS(dat, file="data.Rda")
dat <- readRDS(file="data.Rda")

