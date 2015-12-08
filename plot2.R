
library(dplyr)

rm(list=ls())
power.df.raw <- read.table('household_power_consumption.txt', header=T, sep=";", stringsAsFactors=F, dec=".")

power.df <- filter(power.df.raw, Date == '1/2/2007' | Date == '2/2/2007' )


power.df$Global_active_power <- as.numeric(power.df$Global_active_power)

time <- strptime(paste(power.df$Date, power.df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480, bg = "transparent")
plot(time, power.df$Global_active_power, type="l", xlab="", ylab='Global Active Power (kilowatts)')
dev.off()