# Exploratory Data Analysis Week 1 Assignment Plot 1
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

# Plot histogram into file
png("plot1.png")
hist(power_sub$Global_active_power, main = "Global Active Power", col = "Red",
     xlab = "Global Active Power (kilowatts)")
dev.off()
