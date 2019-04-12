# reconstruct line plot for course project using global 
# active power and dates for the data
# Date: 

# clear variables
rm(list=ls())

# load libraries
library(dplyr)

# read txt file
raw<-data.table::fread('household_power_consumption.txt',header = TRUE,
                       na.strings = "?")

# convert to date
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")

# filter required dates and add new column with date and time
new<-filter(raw,raw$Date=="2007-02-01"|raw$Date=="2007-02-02")
new$DateTime<-as.POSIXct(paste(new$Date, new$Time), format="%Y-%m-%d %H:%M:%S")

# change margins and construct plot
par(mar=c(6,6,5,4))
plot(new$DateTime,new$Sub_metering_1,type = "l",
     ylab = "Energy sub metering",xlab = "")
lines(new$DateTime,new$Sub_metering_2,col="red")
lines(new$DateTime,new$Sub_metering_3,col="blue")

# add legend
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# produce png file and save in directory
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()