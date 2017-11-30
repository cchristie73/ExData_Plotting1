HPC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") 
##getting data

DinQ <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]
##getting dates in Question


P_Date <- DinQ$Date
P_Time <- DinQ$Time

DnT <- as.POSIXct(paste(P_Date, P_Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(DinQ$Global_active_power)
##getting Time, Date, & Power data


plot(DnT, GAP, type = "l", xlab = "", ylab = "Global Active Power")