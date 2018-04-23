#plot 3
png(filename='plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering2,col=lncol[2])
lines(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$SubMetering3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')
x<-dev.off()