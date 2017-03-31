
# Download and unzip the file:

dir.create("./Fhousehold_power_consumption")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urlzip, destfile = "./Fhousehold_power_consumption.zip" )
unzip("./Fhousehold_power_consumption.zip", exdir = "./Fhousehold_power_consumption" )

# ================================================================================================

# Load the data

housholdDT <- read.table("./Fhousehold_power_consumption/household_power_consumption.txt", sep =";", header = T, na.strings = "?", stringsAsFactors = F)

# Subset the data for 2 days

housholdDT2 <- rbind(housholdDT[housholdDT$Date == "1/2/2007",], housholdDT[housholdDT$Date == "2/2/2007",])

# ================================================================================================

# Convert Date and Time and combine into one column

housholdDT2$DateTime <- paste(housholdDT2$Date, housholdDT2$Time)
housholdDT2$DateTime <- strptime(housholdDT2$DateTime, "%d/%m/%Y %H:%M:%S")

# ================================================================================================

# Plot 3

png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(housholdDT2$DateTime, housholdDT2$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(housholdDT2$DateTime, housholdDT2$Sub_metering_2, type = "l", col = "red")
lines(housholdDT2$DateTime, housholdDT2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),  col = c("black", "red", "blue"), lty = 1)
dev.off() 
