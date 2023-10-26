setwd("./downloads/Coursera")

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

data <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

data[,3:9] <- sapply(data[,3:9], as.numeric)

png(file="plot1.png")
hist(data$Global_active_power, col = 'red', main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()