setwd("./downloads/Coursera")

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

data <- subset(df, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

data[,3:9] <- sapply(data[,3:9], as.numeric)


png(file="plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data, {
  plot(Datetime, Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Datetime, Voltage, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Datetime, Sub_metering_1, type="l", 
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty = 1, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Datetime, Global_reactive_power, type="l", 
       ylab="Global_reactive_power (kilowatts)",xlab="datetime")
})

dev.off()