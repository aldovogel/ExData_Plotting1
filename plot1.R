hpc <- read.table("../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#only get dates 2007-02-01 and 2007-02-02
ds <- subset(hpc, Date=="2/2/2007" | Date=="1/2/2007")

#setup graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#plot histogram
hist(x = as.numeric(ds$Global_active_power), main = "Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

#turn off graphic device
dev.off()


