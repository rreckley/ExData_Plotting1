# plot2.r
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
png("plot2.png", width=480, height=480)
# Generate plot 
with(powerdata, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (Kilowatts)', xlab=''))
# Relase graphic device
dev.off()



