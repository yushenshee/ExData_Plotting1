data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datasubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

date_time <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(date_time)

par(mfrow=c(2,2))
with(datasubset, {
  plot(datasubset$Global_active_power~datasubset$Datetime, 
       type="l", 
       xlab="",
       ylab="Global Active Power")
  plot(datasubset$Voltage~datasubset$Datetime, 
       type="l", 
       xlab="datetime",
       ylab="Voltage")
  plot(datasubset$Sub_metering_1~datasubset$Datetime, 
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", lty=1, lwd=2, bty="n",
         col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datasubset$Global_reactive_power~datasubset$Datetime, 
       type="l", 
       xlab="datetime",
       ylab="Global_rective_power")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
