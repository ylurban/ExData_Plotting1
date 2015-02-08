## Set up working directory.
setwd("~/Desktop/CourseEra_Data Science/Exploratory Data Analysis/Course Project 1")

## Read text file in R. "HPC" is short for Household Power Consumption.
HPC_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
HPC_data$Date <- as.Date(HPC_data$Date, format="%d/%m/%Y")

## Subset data from the dates 2007-02-01 and 2007-02-02.
data<-subset(HPC_data,subset=(Date >="2007-02-01"& Date<="2007-02-02"))

## Convert the Date and Time variables to Date/Time classes.
datetime<-paste(as.Date(data$Date),data$Time)

## Select variable Global active power.
globalActivePower<-as.numeric(data$Global_active_power)

## Define png format and dimension
png("plot1.png",width=480, height=480)

## Plot histgram
hist(globalActivePower,main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")

## PNG image has been saved in working directry named as "plot1.png".