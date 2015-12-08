
library(dplyr)

rm(list=ls())
power.df.raw <- read.table('household_power_consumption.txt', header=T, sep=";", stringsAsFactors=F, dec=".")

power.df <- filter(power.df.raw, Date == '1/2/2007' | Date == '2/2/2007' )


power.df$Global_active_power <- as.numeric(power.df$Global_active_power)

time <- strptime(paste(power.df$Date, power.df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

power.df$Sub_metering_1 <- as.numeric(power.df$Sub_metering_1)
power.df$Sub_metering_2 <- as.numeric(power.df$Sub_metering_2)
power.df$Sub_metering_3 <- as.numeric(power.df$Sub_metering_3)

png("plot3.png", width=480, height=480, bg = "transparent")

plot(time, power.df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(time, power.df$Sub_metering_2, type="l", col="red")
lines(time, power.df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()