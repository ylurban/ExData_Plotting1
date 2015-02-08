## Set up working directory.
setwd("~/Desktop/CourseEra_Data Science/Exploratory Data Analysis/Course Project 1")

## Read text file in R. "HPC" is short for Household Power Consumption.
HPC_data<-read.table("household_power_consumption.txt",sep=";",header=T,nrow=2075259,check.names=F,na.strings="?",comment.char="",quote='\"')
HPC_data$Date <- as.Date(HPC_data$Date, format="%d/%m/%Y")

## Subset data from the dates 2007-02-01 and 2007-02-02.
dataPower<-subset(HPC_data,subset=(Date >="2007-02-01"& Date<="2007-02-02"))

## Convert the Date and Time variables to Date/Time classes.
datetime<-paste(as.Date(dataPower$Date),dataPower$Time)
dataPower$Datetime<- as.POSIXct(datetime)

## Select variable Global active power.
globalActivePower<-as.numeric(dataPower$Global_active_power)
subMetering1<-as.numeric(dataPower$Sub_metering_1)
subMetering2<-as.numeric(dataPower$Sub_metering_2)
subMetering3<-as.numeric(dataPower$Sub_metering_3)

## Define png format and dimension
png("plot3.png",width=480, height=480)

## Plot and set up legend and graphic
plot(dataPower$Datetime,subMetering1,type="l",ylab="Energy Submetering",xlab="")
lines(dataPower$Datetime,subMetering2,type="l",col="red")
lines(dataPower$Datetime,subMetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty=1,col=c("black","red","blue"))

## PNG image has been saved in working directry named as "plot2.png".
dev.off()