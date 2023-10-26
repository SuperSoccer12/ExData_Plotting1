setwd("./downloads/Coursera")

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

data <- subset(df, subset=(Date >= "2007-02-01" & Date < "2007-02-03"))

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

data[,3:9] <- sapply(data[,3:9], as.numeric)

png(file="plot2.png")
plot(data$Datetime, data$Global_active_power, type = 'l', xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()