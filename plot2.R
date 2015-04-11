# Initialize environment for parsing in US formats (I am in Brazil)
Sys.setlocale("LC_TIME", "English")  

# Read, filter and parse the data
csv <- read.csv('household_power_consumption.txt', sep=";", dec=".")
work <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
work$DateTime <- as.POSIXct(paste(work$Date, work$Time), format="%d/%m/%Y %H:%M:%S")
work$Global_active_power = as.numeric(as.character(work$Global_active_power))

# Do Plot 2
plot(
  work$DateTime, 
  work$Global_active_power, 
  type="l",
  ylab="Global Active Power (kilowatts)",
  xlab="")

# Generate the png file
dev.copy(png, file="plot2.png")
dev.off()
