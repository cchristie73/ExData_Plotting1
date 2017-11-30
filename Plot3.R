HPC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") 
##getting data

DinQ <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]
##getting dates in Question


P_Date <- DinQ$Date
P_Time <- DinQ$Time

DnT <- as.POSIXct(paste(P_Date, P_Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

GAP <- as.numeric(DinQ$Global_active_power)
##getting Time, Dgetate, & Power data

Sub_Meter1 <- as.numeric(DinQ$Sub_metering_1)
Sub_Meter2 <- as.numeric(DinQ$Sub_metering_2)
Sub_Meter3 <- as.numeric(DinQ$Sub_metering_3)

##getting Sub_Meter data



plot(DnT, Sub_Meter1, type = "l", xlab = "",  ylab = "Energy sub metering")
lines(DnT, Sub_Meter2, type = "l", col = "red")
lines(DnT, Sub_Meter3, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col=c("black", "red", "blue"))
