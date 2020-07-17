library("data.table")

setwd("~/Desktop/enter")

#Reads data

powercon <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# stopping from printing scientific notation
powercon[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Setting date type
powercon[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filtering the date. 
powercon <- powercon[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## The first plot
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()