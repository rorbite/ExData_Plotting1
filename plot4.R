# Initialize environment for parsing in US formats (I am in Brazil)
Sys.setlocale("LC_TIME", "English")  

# Read, filter and parse the data
csv <- read.csv('household_power_consumption.txt', sep=";", dec=".")
work <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
work$DateTime <- as.POSIXct(paste(work$Date, work$Time), format="%d/%m/%Y %H:%M:%S")
work$Global_active_power = as.numeric(as.character(work$Global_active_power))
work$Sub_metering_1 = as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 = as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 = as.numeric(as.character(work$Sub_metering_3))

# Do Plot 4
par(mfrow = c(2,2))
with(work,   
{
  plot(y=Global_active_power, x=DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(y=Voltage, DateTime, type="l", ylab="Voltage", xlab="datetime")
  
  plot(y=Sub_metering_1, x=DateTime, type="l", ylab="Energy sub metering", xlab="")
  lines(y=Sub_metering_2, x=DateTime, type="l",col="RED")
  lines(y=Sub_metering_3, x=DateTime, type="l",col="BLUE")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("BLACK", "RED", "BLUE"),  lty=1, lwd=2)
  
  plot(y=Global_reactive_power, DateTime, type="l",  xlab="datetime")  
})

# Generate the png file
dev.copy(png, file="plot4.png")
dev.off()
