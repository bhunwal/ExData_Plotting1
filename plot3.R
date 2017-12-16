plot3 <- function() {
    filename <- "household_power_consumption.zip"
  ## Download and unzip the dataset:
  if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename, method="curl")
  }  
  if (!file.exists("household_power_consumption.txt")) { 
    unzip(filename) 
  }
  
  mydata <- read.table("household_power_consumption.txt", sep=";", header=T) 
  head(mydata)
  mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y");
  relData <- subset(mydata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
  relData$Global_active_power <- as.integer(relData$Global_active_power)
  relData$datetime <- as.POSIXct(paste(relData$Date, relData$Time), format="%Y-%m-%d %H:%M:%S")
  plotGraph(relData);
}

plotGraph <- function(relData) {
  png('rplot3.jpg')
  plot(relData$datetime, relData$Sub_metering_1, type='l', ylab = "Energy sub metering")
  lines(relData$datetime, relData$Sub_metering_2, lwd=2, col="red")
  lines(relData$datetime, relData$Sub_metering_3, lwd=2, col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(1,1), col=c("black", "red","blue"))
  dev.off()
}
