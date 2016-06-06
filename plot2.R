## read data
datitot <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

###  extract  1/2/2007-2/2/2 007  
subData <- datitot[datitot$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

###  plot 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

###  save
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()