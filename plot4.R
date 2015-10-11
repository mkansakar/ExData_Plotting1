dt <- read.table("./household_power_consumption.txt",header=T,sep=";")
#head(dt)
dt_filter <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
#head(dt_filter)


dtime <- strptime(paste(dt_filter$Date, dt_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_m1 <- as.numeric(dt_filter$Sub_metering_1)
sub_m2 <- as.numeric(dt_filter$Sub_metering_2)
sub_m3 <- as.numeric(dt_filter$Sub_metering_3)

g_power <- as.numeric(dt_filter$Global_active_power)
r_power <- as.numeric(dt_filter$Global_reactive_power)
voltage <- as.numeric(dt_filter$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dtime, g_power, type="l", xlab="", ylab="Global Active Power")
plot(dtime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dtime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dtime, subMetering2, type="l", col="red")
lines(dtime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtime, r_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()