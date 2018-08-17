library(data.table)
dat <- fread("consumption.txt", sep = ";",header = TRUE,
             colClasses = rep("character",9))
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat[dat == "?"] <- NA
dat$Date <- as.Date(dat$Date , format = "%d/%m/%Y")
dat <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date <= as.Date("2007-02-02"),]
dat$combined <- as.POSIXct(strptime(paste(dat$Date, dat$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S"))
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(dat,
     plot(combined,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering"))
with(dat,
     points(combined,
            type = "l",
            Sub_metering_2,
            col = "red")
)
with(dat,
     points(combined,
            type = "l",
            Sub_metering_3,
            col = "blue")
)
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off()
