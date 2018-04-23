
#Plot 4
png(filename='plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering2,col=lncol[2])
lines(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering3,col=lncol[3])

# plot data on bottom right (2,2)
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
x<-dev.off()
