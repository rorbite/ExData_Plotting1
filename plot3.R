# Initialize environment for parsing in US formats (I am in Brazil)
Sys.setlocale("LC_TIME", "English")  

# Read, filter and parse the data
csv <- read.csv('household_power_consumption.txt', sep=";", dec=".")
work <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
work$DateTime <- as.POSIXct(paste(work$Date, work$Time), format="%d/%m/%Y %H:%M:%S")
work$Sub_metering_1 = as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 = as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 = as.numeric(as.character(work$Sub_metering_3))

# Do Plot 3
plot(x=work$DateTime,  y=work$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(x=work$DateTime, y=work$Sub_metering_2, type="l", col="red")
lines(x=work$DateTime, y=work$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("BLACK", "RED", "BLUE"), lty=1, lwd=1)

# Generate the png file
dev.copy(png, file="plot3.png")
dev.off()
