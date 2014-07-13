## Author: Akshaya Srivastava
## TODO: Create plot 3 that matches instructor's plot 3

## NOTE: This code assumes raw dataset has been downloaded and unzipped, is in 
## the current directory and hasn't been renamed

## reading in all data upto dates specified (Feburary 1 and 2, 2007)
raw <- read.table(file = "household_power_consumption.txt",
                  nrows=69516, sep=";")

## removing prior dates to get workable data
dataset<-tail(raw, n=2879)

## getting weekdays to use in plot (x-axis)
timestamp <- paste(dataset[,1],dataset[,2])
dateTime <- strptime(timestamp, format="%d/%m/%Y %H:%M:%S")

## extracting Global Active Power data and converting to numeric (y-axis)
data<-dataset[,3]
global_active_power <- as.numeric(levels(data))[data]
global_active_power <- global_active_power[!is.na(global_active_power)]

## extracting submetering 1 and converting to numeric
data1<-dataset[,7]
sm1 <- as.numeric(levels(data1))[data1]
sm1 <- sm1[!is.na(sm1)]

## extracting submetering 2 and converting to numeric
data2<-dataset[,8]
sm2 <- as.numeric(levels(data2))[data2]
sm2 <- sm2[!is.na(sm2)]

## extracting submetering 3 and converting to numeric
data3<-dataset[,9]
sm3 <- as.numeric(levels(data3))[data3]
sm3 <- sm3[!is.na(sm3)]

## creating plot and saving to png
png(file="plots/plot3.png",width=480,height=480)
plot(dateTime,sm1,xlab="",ylab="Energy Sub Metering", type="l", col="black")
lines(dateTime,sm2,col="red")
lines(dateTime,sm3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()
