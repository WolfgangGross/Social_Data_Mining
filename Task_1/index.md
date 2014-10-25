---
title       : Social Data Mining
subtitle    : Report
author      : Wolfgang Gross - Ramona Leenings
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---


## First Steps - Task 1

First we started with:

1. Looking at the Data
2. Decided to work with R
3. Find we need a prepreocessing we couln't do wiht R
4. Write a small programm reading and cleaning the raw dat in .NET Framework


---
## Data Cleaning

```
code here
```

---
## Data in R
Load and save Data

```r
dat_twelve <- fread('numeric_20140712.csv',header=F,sep=';')
saveRDS("numeric_20140712.Rda")
```



---

## Working on the Data

```r
count  <- data.frame(table(dat$V3))
count$Var1[1:5]
```

```
## [1] 20140712000000 20140712000001 20140712000002 20140712000003
## [5] 20140712000004
## 85765 Levels: 20140712000000 20140712000001 20140712000002 ... 20140712235959
```


```r
sumMinute <- c()
for(i in seq(1,length(count$Freq),60)){sumMinute <- append(sumMinute,sum(count$Freq[i:(i+60)]))}
sumHour <- c()
for(k in seq(1,length(count$Freq),3600)){sumHour <- append(sumHour,sum(count$Freq[k:(k+3600)]))}
realTime <- strptime(as.character(count$Var1),format="%Y%m%d%H%M%S")
Tweet.count <- count$Freq
```



---
## Plot the Data

```r
df <- data.frame(realTime,Tweet.count)
ggplot(df,aes(x=realTime,y=Tweet.count)) + geom_line()
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 

---
## Tweets per Second - Minute - Hour
Plot wiht different time resolutions

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png) ![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-2.png) ![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-3.png) 

