library(data.table)
dat <- fread("consumption.txt", sep = ";",header = TRUE,
            colClasses = rep("character",9))
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat[dat == "?"] <- NA
dat$Date <- as.Date(dat$Date , format = "%d/%m/%Y")
dat <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date <= as.Date("2007-02-02"),]
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off() 
