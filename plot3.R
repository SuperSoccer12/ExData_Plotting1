setwd("./downloads/Coursera")

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

data <- subset(df, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

data[,3:9] <- sapply(data[,3:9], as.numeric)

png(file="plot3.png")
plot(data$Datetime, data$Sub_metering_1, type="l",
     ylab="Energy Sub Metering", xlab="")
lines(data$Datetime, data$Sub_metering_2,col='Red')
lines(data$Datetime, data$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty = 1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()