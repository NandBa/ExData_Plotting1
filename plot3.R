data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 na.strings = "?")

data<-subset(data,(Date=="1/2/2007"|Date=="2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time=format(strptime(data$Time,format="%H:%M:%S"),"%H:%M:%S")
data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")


png(file="plot3.png",width = 480,height = 480)
plot(data$DateTime,data$Sub_metering_1, 
     type = "l",ylab = "Energy sub metering", xlab = "",lwd=2.5)
lines(data$DateTime,data$Sub_metering_2,type="l",col="red", lwd=2.5)
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue", lwd=2.5)
legend("topright", c("Sub_metering_1", "Sub_metering_2",
                     "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"),inset=0)
dev.off()