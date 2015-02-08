## Set up working directory.
setwd("~/Desktop/CourseEra_Data Science/Exploratory Data Analysis/Course Project 1")

## Read text file in R. "HPC" is short for Household Power Consumption.
HPC_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
HPC_data$Date <- as.Date(HPC_data$Date, format="%d/%m/%Y")

## Subset data from the dates 2007-02-01 and 2007-02-02.
dataPower<-subset(HPC_data,subset=(Date >="2007-02-01"& Date<="2007-02-02"))

## Convert the Date and Time variables to Date/Time classes.
datetime<-paste(as.Date(dataPower$Date),dataPower$Time)
dataPower$Datetime<- as.POSIXct(datetime)

## str(date)
globalActivePower<-as.numeric(dataPower$Global_active_power)
globalReactivePower<-as.numeric(dataPower$Global_reactive_power)
voltage<-as.numeric(dataPower$Voltage)
subMetering1<-as.numeric(dataPower$Sub_metering_1)
subMetering2<-as.numeric(dataPower$Sub_metering_2)
subMetering3<-as.numeric(dataPower$Sub_metering_3)

## Define png format and dimension
png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2))

## Plot 
plot(dataPower$Datetime, globalActivePower,type="l",xlab=" ",ylab="Global Active Power(kilowatts)")

plot(dataPower$Datetime,voltage,type="l",xlab=" ",ylab="Voltage")

plot(dataPower$Datetime,subMetering1,type="l",ylab="Energy Submetering",xlab=" ")
lines(dataPower$Datetime,subMetering2,type="l",col="red")
lines(dataPower$Datetime,subMetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2.5,lty=1,col=c("black","red","blue"))

plot(dataPower$Datetime,globalReactivePower,type="l",xlab=" ",ylab="Global_reactive_power")
## PNG image Plot1.png has been saved in working directry.
dev.off()