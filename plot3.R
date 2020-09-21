##############################################
#Exploratory Data Analysis
#Course Project 1
###############################################

#Remove previous data files in the environment
rm(list=ls( )) 

#Load Packages
library(data.table)
library(ggplot2)

#############################################
# Plot 3
#############################################

#Set working directory
setwd("/Documents/ExploratoryDataAnalysis_CourseProject1/")

#Reading and subsetting the data

rawdata<-read.table("household_power_consumption.txt",skip=1,sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data<-subset(rawdata,Date=="1/2/2007" | Date =="2/2/2007")


#Transform the time variables from characters into objects

data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Time<-strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#Plot

png("plot3.png", width=480, height=480)
with(data, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", main="Energy sub-metering"))
with(data, lines(Time, as.numeric(Sub_metering_1)))
with(data, lines(Time, as.numeric(Sub_metering_2), col="red"))
with(data, lines(Time, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metereing_1","Sub_metereing_2","Sub_metering_3"))
dev.off()
