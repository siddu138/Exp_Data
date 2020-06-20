#Construction of PNG Plot3 for House hold energy consumption

datafile <- "./household_power_consumption.txt"
power_data <- read.table(datafile, header=TRUE, sep=";")

subset_data <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(subset_data$Global_active_power)
SubMetering1 <- as.numeric(subset_data$Sub_metering_1)
SubMetering2 <- as.numeric(subset_data$Sub_metering_2)
SubMetering3 <- as.numeric(subset_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()