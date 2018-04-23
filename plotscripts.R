# required packages
library(data.table)
library(lubridate)


    # read the raw table and limit to 2 days
    colclass<-c('character','character',rep('numeric',7))
    power.data<-read.table('household_power_consumption.txt',header=TRUE,
                                  sep=';',na.strings='?',colClasses=colclass)
    power.data<-power.data[power.data$Date=='1/2/2007' | power.data$Date=='2/2/2007',]
    
    # clean up the variable names and convert date/time fields
    columnnames<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
            'SubMetering1','SubMetering2','SubMetering3')
    colnames(power.data)<-columnnames
    
 #   power.data[,1] = as.Date(power.data[,1],format = "%d/%m/%Y")
 #   power.data[,2] = as.POSIXct(power.data[,2],format="%H:%M:%S")
    
    #Plot 1
    png(filename='plot1.png',width=480,height=480,units='px')
    hist(power.data$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
    x<-dev.off()
    
    #Plot 2
   png(filename='plot2.png',width=480,height=480,units='px')
   plot(strptime(paste(power.data$Date,power.data$Time),"%d/%m/%Y %H:%M:%S"),power.data$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')
   x<-dev.off()
    
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
   