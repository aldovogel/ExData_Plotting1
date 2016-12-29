hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#only get dates 2007-02-01 and 2007-02-02
ds <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

#get dates
datetime <- strptime(paste(ds$Date, ds$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

#setup graphics device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#plot histogram
plot(datetime, as.numeric(ds$Global_active_power), type = "l", xlab="", ylab="Global Active Power (killowatts)" )

#turn off graphic device
dev.off()



