hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#only get dates 2007-02-01 and 2007-02-02
ds <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

#get dates
datetime <- strptime(paste(ds$Date, ds$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

#setup graphics device
png(filename = "plot4.png", width = 480, height = 480, units = "px")


par(mfrow = c(2,2))


with(ds,{
  plot(datetime, Global_active_power, type = "l", xlab="", ylab="Global Active Power (killowatts)" )
  
  plot(datetime, Voltage, type="l", ylab="Voltage")
  
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, col="orange")
  lines(datetime, Sub_metering_3, col="blue")

  legend("topright", legend=names(ds)[7:9], col=c("black","orange", "blue"), lty=1)

  plot(datetime, Global_reactive_power, type="l")
})


#turn off graphic device
dev.off()
