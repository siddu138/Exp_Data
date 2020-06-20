#Construction of PNG Plot4 for House hold energy consumption

datafile <- "./household_power_consumption.txt"
power_data <- read.table(datafile, header=TRUE, sep=";")

subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subset_data$Global_active_power)
GlobalReactivePower <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
SubMetering1 <- as.numeric(subset_data$Sub_metering_1)
SubMetering2 <- as.numeric(subset_data$Sub_metering_2)
SubMetering3 <- as.numeric(subset_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy SubMetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()