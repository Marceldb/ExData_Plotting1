## read data
datitot <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

### extract 1/2/2007-2/2/2007 
subdati <- datitot[datitot$Date %in% c("1/2/2007","2/2/2007") ,]

### graphic
hist(as.numeric(subdati$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

### save
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()