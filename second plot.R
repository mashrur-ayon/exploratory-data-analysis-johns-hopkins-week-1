library("data.table")


#Read the data
powercon <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
powercon[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Fixing Time
powercon[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filtering date
powercon <- powercon[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Second Plot
plot(x = powercon[, dateTime]
     , y = powercon[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()