#Load and prepare data
datos <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
datos$DateTime <- paste(datos$Date, datos$Time)
datos$DateTime <- strptime(datos$DateTime, format="%d/%m/%Y %H:%M:%S")
#datos <- datos[c(10,3,4,5,6,7,8,9)]
datos <- datos[datos$DateTime >= as.POSIXlt("2007-02-01 00:00:00") & datos$DateTime <= as.POSIXlt("2007-02-02 23:59:59"),]


#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Subplot 1
plot(datos$DateTime, datos$Global_active_power, ylab="Global Active Power", xlab="", type="l")

#subplot 2
plot(datos$DateTime, datos$Voltage, ylab="Voltage", xlab="datetime", type="l")

#Subplot 3
plot(datos$DateTime, datos$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(datos$DateTime, datos$Sub_metering_2, col="red")
lines(datos$DateTime, datos$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))

#Subplot 4
plot(datos$DateTime, datos$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
