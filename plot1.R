#Plot 1
png(filename='plot1.png',width=480,height=480,units='px')
hist(power.data$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
x<-dev.off()