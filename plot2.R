plot2 <- function() {
  mydata <- read.table("household_power_consumption.txt", sep=";", header=T) 
  head(mydata)
  mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y");
  relData <- subset(mydata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
  relData$Global_active_power <- as.integer(relData$Global_active_power)
  relData$datetime <- as.POSIXct(paste(relData$Date, relData$Time), format="%Y-%m-%d %H:%M:%S")
  plotGraph(relData);
}

plotGraph <- function(relData) {
  png('rplot2.jpg')
  plot(relData$datetime, relData$Global_active_power, type='l', ylab = "Global Active Power (kilowatts)")
  dev.off()
}
