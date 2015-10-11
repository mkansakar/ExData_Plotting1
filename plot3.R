dt <- read.table("./household_power_consumption.txt",header=T,sep=";", stringsAsFactors=FALSE, dec=".")
#head(dt)
dt_filter <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
#head(dt_filter)


dtime <- strptime(paste(dt_filter$Date, dt_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub_m1 <- as.numeric(dt_filter$Sub_metering_1)
sub_m2 <- as.numeric(dt_filter$Sub_metering_2)
sub_m3 <- as.numeric(dt_filter$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dtime, sub_m1, type="l", ylab="Energy Sub metering", xlab="")
lines(dtime, sub_m2, type="l", col="red")
lines(dtime, sub_m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5,  col=c("yellow", "red", "blue"))
dev.off()
