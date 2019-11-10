readData<-function()
{
      file   <- "household_power_consumption.txt"
      header <- read.table(file, header=TRUE, sep=";", nrows=1)
      data   <- read.table(file, header=FALSE, sep=";",stringsAsFactors = FALSE, skip=66637, nrows=2880, col.names=colnames(header))
      data$DateTime <- strptime(paste(data$Date,data$Time), format="%e/%m/%Y %H:%M:%S")
      data
}
data<-readData()

##Plot 1
par(mar=c(4,4,1,1), mfrow=c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

dev.copy(png, file = "plot2.png", width=504, height=504)
dev.off()