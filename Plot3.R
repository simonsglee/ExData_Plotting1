# Exploratory Data Analysis Week 1 Assignment Plot 3
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

# plot sub metering 1, 2, and 3
png("plot3.png")
with(power_sub, plot(datetime, Sub_metering_1, type = "l", col = "black",
                     ylab = "Energy sub metering", xlab = ""))
with(power_sub, lines(datetime, Sub_metering_2, col = "red"))
with(power_sub, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = names(power_sub[,7:9]), lty=c(1,1), 
       col = c("black", "red", "blue"))
dev.off()
