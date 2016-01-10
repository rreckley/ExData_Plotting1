# plot4.r
#Include dplyr package.
library(dplyr)
# Set working directory for data.
setwd("C:/Users/Roderic N. Reckley/Documents/coursera/DataScience/exploratorydata/project1")
# Read raw data file. 
rawdata <- read.table('./household_power_consumption.txt',sep=';', header=TRUE, stringsAsFactors=FALSE)
# Subset the data for the specified timeframe.
powerdata <- filter(rawdata, Date =='1/2/2007'| Date =='2/2/2007')
# convert columns 3-9 of powerdata frame to numeric values.
powerdata[,3] <- as.numeric(powerdata[,3])
powerdata[,4] <- as.numeric(powerdata[,4])
powerdata[,5] <- as.numeric(powerdata[,5])
powerdata[,7] <- as.numeric(powerdata[,7])
powerdata[,8] <- as.numeric(powerdata[,8])
powerdata[,9] <- as.numeric(powerdata[,9])
# Convert Date.
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
# Create datetime vector from Date and Time. 
datetime <- paste(powerdata$Date, powerdata$Time)
# Add DateTime to existing dataframe powerdata.
powerdata$DateTime <- as.POSIXct(datetime)
# Define graphic device.
png("plot4.png", width=480, height=480)
# Partition graphic device into 4 equal size devices.
par(mfcol = c(2,2))
# Genereate plot for top left device.
with(powerdata, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power', xlab=''))
# Generate plot bottom left device.
with(powerdata, plot(DateTime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab=''))
with(subset(powerdata), lines(DateTime, Sub_metering_2, col='red'))
with(subset(powerdata), lines(DateTime, Sub_metering_3, col='blue'))
legend('topright', lwd=1, col=c('black', 'red', 'blue'), legend= c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
#Generate plot for top right device. 
with(powerdata, plot(DateTime, Voltage, type='l', ylab='Voltage', xlab='datetime'))
#Generate plot for bottom right device.
with(powerdata, plot(DateTime, Global_reactive_power, type='l', xlab='datetime'))
#Relase graphic device.
dev.off()




