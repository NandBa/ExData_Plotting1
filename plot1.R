#Reading Data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",
              na.strings = "?")

data<-subset(data,(Date=="1/2/2007"|Date=="2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time=format(strptime(data$Time,format="%H:%M:%S"),"%H:%M:%S")
data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")


#Plotting
png(file="plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col="red",
     xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
