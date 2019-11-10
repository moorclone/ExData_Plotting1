readData<-function()
{
      file   <- "household_power_consumption.txt"
      header <- read.table(file, header=TRUE, sep=";", nrows=1)
      data   <- read.table(file, header=FALSE, sep=";",stringsAsFactors = FALSE, skip=66637, nrows=2880, col.names=colnames(header))
      data$DateTime <- strptime(paste(data$Date,data$Time), format="%e/%m/%Y %H:%M:%S")
      data
}
data<-readData()

##Plot 4
dev.off()
par(mar=c(5,4,4,2), mfrow=c(2,2))
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

with(data, plot(DateTime, Voltage, type="l", ylab="Voltage",xlab="datetime"))

with(data, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(data, lines(DateTime, Sub_metering_1, col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),
       lty=1, bty = "n", y.intersp = 0.7)

with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.copy(png, file = "plot4.png", width = 504, height = 504)
dev.off()