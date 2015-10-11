dt <- read.table("./household_power_consumption.txt",header=T,sep=";")
#head(dt)
dt_filter <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
#head(dt_filter)

power_dt<- as.numeric(dt_filter$Global_active_power)
png("plot1.png",width=480,height=480)
hist(power_dt,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
