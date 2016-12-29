hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#only get dates 2007-02-01 and 2007-02-02
ds <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

#get dates
datetime <- strptime(paste(ds$Date, ds$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

#setup graphics device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#create plots and legend
plot(datetime, ds$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(datetime, ds$Sub_metering_2, col="orange")
lines(datetime, ds$Sub_metering_3, col="blue")

legendlabels <- names(ds)[7:9]

legend("topright", legend=legendlabels, col=c("black","orange", "blue"), lty=1)


#turn off graphic device
dev.off()
