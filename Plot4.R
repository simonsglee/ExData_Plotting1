# Exploratory Data Analysis Week 1 Assignment Plot 4
# Simon Lee

# Load data and subset data
power <- read.table("./power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
power_sub <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

# create a new datetime column and convert it to POSIXlt format
power_sub$datetime <- paste(power_sub$Date, power_sub$Time)
power_sub$datetime <- strptime(power_sub$datetime, format = "%e/%m/%Y %H:%M:%S")

# Convert character variables as numeric values
for(i in 3:8) {
        power_sub[,i] <- as.numeric(power_sub[,i])        
}

# Plot 4
png("plot4.png")
par(mfrow = c(2,2))
with(power_sub, plot(datetime, Global_active_power, type = "l", xlab = "",
                     ylab = "Global Active Power"))
with(power_sub, plot(datetime, Voltage, type = "l"))
with(power_sub, plot(datetime, Sub_metering_1, type = "l", col = "black",
                     ylab = "Energy sub metering"))
with(power_sub, lines(datetime, Sub_metering_2, col = "red"))
with(power_sub, lines(datetime, Sub_metering_3, type = "l", col = "blue", xlab = ""))
legend("topright", legend = names(power_sub[,7:9]), lty=c(1,1), bty = "n",
       col = c("black", "red", "blue"), cex = 0.7)
with(power_sub, plot(datetime, Global_reactive_power, type = "l"))
dev.off()

