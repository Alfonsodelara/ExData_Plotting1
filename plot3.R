setwd("C:/Dropbox/Colorado State University/Classes/Coursera/4 - Exploratory Data Analysis with R/Week 1")
house=read.table("household_power_consumption.txt",header=T, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")
house$Date= as.Date(house$Date,"%d/%m/%Y")

dates=as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
house= subset(house, Date %in% dates)
house$DateTime= paste(house$Date,house$Time)
house$DateTime= strptime(house$DateTime, "%Y-%m-%d %H:%M:%S")

plot(x=(house$DateTime),y=house$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=(house$DateTime),y=house$Sub_metering_2, col="red")
lines(x=(house$DateTime),y=house$Sub_metering_3, col="blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.55)

dev.copy(png,file="plot3.png")
dev.off()
