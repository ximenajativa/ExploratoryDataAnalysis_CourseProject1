###############################################
#Exploratory Data Analysis
#Course Project 1
###############################################

#Remove previous data files in the environment
rm(list=ls( )) 

#Load Packages
library(data.table)
library(ggplot2)

#############################################
# Plot 1
#############################################

#Set working directory
setwd("/Documents/ExploratoryDataAnalysis_CourseProject1/")

#Reading and subsetting the data

rawdata<-read.table("household_power_consumption.txt",skip=1,sep=";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data<-subset(rawdata,Date=="1/2/2007" | Date =="2/2/2007")

#Plot

png("plot1.png", width=480, height=480)
with(data,hist(as.numeric(Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)"))
dev.off()
