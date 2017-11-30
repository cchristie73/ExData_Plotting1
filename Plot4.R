HPC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") 
##getting data

DinQ <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007") ,]
##getting dates in Question


P_Date <- DinQ$Date
P_Time <- DinQ$Time

DnT <- as.POSIXct(paste(P_Date, P_Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

GRP <- as.numeric(DinQ$Global_reactive_power)
GAP <- as.numeric(DinQ$Global_active_power)
Voltage <- as.numeric(DinQ$Voltage)
##getting Time, Dgetate, & Power data

Sub_Meter1 <- as.numeric(DinQ$Sub_metering_1)
Sub_Meter2 <- as.numeric(DinQ$Sub_metering_2)
Sub_Meter3 <- as.numeric(DinQ$Sub_metering_3)

##getting Sub_Meter data


par(mfrow = c(2,2), mar= c(4,4,2,1), oma=c(0,0,2,0))

plot(DnT, GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(DnT, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


plot(DnT, Sub_Meter1, type = "l", xlab = "",  ylab = "Energy sub metering")
lines(DnT, Sub_Meter2, type = "l", col = "red")
lines(DnT, Sub_Meter3, type = "l", col = "blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lwd = .5, bty="n", col=c("black", "red", "blue"))

plot(DnT, GRP, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
