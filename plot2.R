dt <- read.table("./household_power_consumption.txt",header=T,sep=";")
#head(dt)
dt_filter <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
#head(dt_filter)

###paste(dt_filter$Date, dt_filter$Time, sep=" ")


dtime <- strptime(paste(dt_filter$Date, dt_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(dtime, dt_filter$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
