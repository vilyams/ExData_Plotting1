#Plot 2
png(filename='plot2.png',width=480,height=480,units='px')
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')
x<-dev.off()