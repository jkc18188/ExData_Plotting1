# reconstruct histogram for course project using global active power for the data
# Date: 4.12.19

# clear variables
rm(list=ls())

# load libraries
library(dplyr)

# read txt file
raw<-data.table::fread('household_power_consumption.txt',header = TRUE,
                       na.strings = "?")

# convert to date
raw$Date <- as.Date(raw$Date, "%d/%m/%Y")

# filter required dates
new<-filter(raw,raw$Date=="2007-02-01"|raw$Date=="2007-02-02")

# change margins and construct plot
par(mar=c(6,6,5,4))
hist(new$Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# produce png file and save in directory
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()


