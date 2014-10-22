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