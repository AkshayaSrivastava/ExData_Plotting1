## Author: Akshaya Srivastava
## TODO: Create plot 1 that matches instructor's plot 1

## NOTE: This code assumes raw dataset has been downloaded and unzipped, is in 
## the current directory and hasn't been renamed

## reading in all data upto dates specified (Feburary 1 and 2, 2007)
raw <- read.table(file = "household_power_consumption.txt",
                  nrows=69516, sep=";")

## removing prior dates to get workable data
dataset<-tail(raw, n=2879)

## extracting Global Active Power data and converting to numeric
data<-dataset[,3]
global_active_power <- as.numeric(levels(data))[data]
global_active_power <- global_active_power[!is.na(global_active_power)]

## creating plot and saving to png
png(file="plots/plot1.png",width=480,height=480)
hist(global_active_power,xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off()
