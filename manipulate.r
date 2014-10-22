#####################
#count for each time the number of posts
count = c()
#remove the doubles form dat$Timestamp; get unique
times <- unique(dat$Timestamp)
#tabel gets number of elements
count  <- data.frame(table(dat$Timestamp))

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
ggplot(df,aes(x=timeReal,y=count)) + geom_line()