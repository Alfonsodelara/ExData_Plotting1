setwd("C:/Dropbox/Colorado State University/Classes/Coursera/4 - Exploratory Data Analysis with R/Week 1")
house=read.table("household_power_consumption.txt",header=T, sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")
house$Date= as.Date(house$Date,"%d/%m/%Y")

dates=as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d")
house= subset(house, Date %in% dates)

hist(house$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.copy(png,file="plot1.png")
dev.off()


