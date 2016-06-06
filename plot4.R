### read data
datitot <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

### extract 1/2/2007-2/2/2007 
subdati <- datitot[datitot$Date %in% c("1/2/2007","2/2/2007") ,]
subMet1 <- as.numeric(subdati$Sub_metering_1)
subMet2 <- as.numeric(subdati$Sub_metering_2)
subMet3 <- as.numeric(subdati$Sub_metering_3)
datetime <- strptime(paste(subdati$Date, subdati$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subdati$Global_active_power)
globalReactivePower <- as.numeric(subdati$Global_reactive_power)
volt <- as.numeric(subdati$Voltage)

### save
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()