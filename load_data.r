#load data into workspace and set workspace

#####################
#setting environment
library(bit64)
library(data.table)
setwd("~/Documents/Coxi/WS1415/Social Data Mining/Data/Clean")
#setwd("~/Documents/programmierung/Social Data Mining All")

#####################
#loading data in

#build in R Routines for reading CSV
#dat <- read.csv('13July_19xxxx.csv',sep='\t')
#dat <- read.csv('13July_19xxxx_with_semi2.csv',sep=';')

#Using fRead because it is much faster
#1. Reading CSV file
#2. save data in Rda file to compress it and load it faster

#2014_07_13_PART
dat_small <- fread('~/Coxi/WS1415/Social Data Mining/Data/Clean/13July_19xxxx.csv',header=F,sep=';')
saveRDS(dat, file="~Coxi/WS1415/Social Data Mining/Data/Rda/13July_xxxx.Rda")

#2014_07_12
dat_twelve <- fread('~/Coxi/WS1415/Social Data Mining/Data/Clean/numeric_20140712.csv',header=F,sep=';')
saveRDS(dat_twelve, file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140712.Rda")

#2014_07_13
dat_thirteen <- fread('~/Coxi/WS1415/Social Data Mining/Data/Clean/numeric_20140713.csv',header=F,sep=';')
saveRDS(dat_thirteen, file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140713.Rda")

#2014_07_14
dat_fourteen <- fread('~/Coxi/WS1415/Social Data Mining/Data/Clean/numeric_20140714.csv',header=F,sep=';')
saveRDS(dat_fourteen, file="~/Coxi/WS1415/Social Data Mining/Data/Rda/numeric_20140714_1.Rda")


#dat <- readRDS(file="data.Rda")

