# Initialize environment for parsing in US formats (I am in Brazil)
Sys.setlocale("LC_TIME", "English")  

# Read, filter and parse the data
csv <- read.csv('household_power_consumption.txt', sep=";", dec=".")
work <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
work$Global_active_power = as.numeric(as.character(work$Global_active_power))

# Do Plot 1
par(mfrow = c(1,1))
hist(
  work$Global_active_power, 
  col="red", 
  main="Global Active Power", 
  xlab="Global Active Power (kilowatts)")

# Generate the png file
dev.copy(png, file="plot1.png")
dev.off()
