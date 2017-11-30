HPC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") 
##getting data

DinQ <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),]
##getting dates in Question


hist(as.numeric(DinQ$Global_active_power), col="red", main = "Global Active Power", xlab = "GlobalActive Power (kilowatts)", ylab = "Frequency")
