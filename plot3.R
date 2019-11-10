readData<-function()
{
      file   <- "household_power_consumption.txt"
      header <- read.table(file, header=TRUE, sep=";", nrows=1)
      data   <- read.table(file, header=FALSE, sep=";",stringsAsFactors = FALSE, skip=66637, nrows=2880, col.names=colnames(header))
      data$DateTime <- strptime(paste(data$Date,data$Time), format="%e/%m/%Y %H:%M:%S")
      data
}
data<-readData()
Sys.setlocale("LC_TIME", "English") 
##Plot 3
par(mar=c(2,4,1,1), mfrow=c(1,1))
with(data, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering"))
with(data, lines(DateTime, Sub_metering_1, col="black"))
with(data, lines(DateTime, Sub_metering_2, col="red"))
with(data, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),
       lty=1, y.intersp = 0.7)

dev.copy(png, file = "plot3.png", width=504, height=504)
dev.off()