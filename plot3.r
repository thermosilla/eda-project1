#Load and prepare data
datos <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
datos$DateTime <- paste(datos$Date, datos$Time)
datos$DateTime <- strptime(datos$DateTime, format="%d/%m/%Y %H:%M:%S")
#datos <- datos[c(10,3,4,5,6,7,8,9)]
datos <- datos[datos$DateTime >= as.POSIXlt("2007-02-01 00:00:00") & datos$DateTime <= as.POSIXlt("2007-02-02 23:59:59"),]

#Plot 3
png("plot3.png", width=480, height=480)
plot(datos$DateTime, datos$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(datos$DateTime, datos$Sub_metering_2, col="red")
lines(datos$DateTime, datos$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
