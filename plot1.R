data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datasubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

date_time <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(date_time)

hist(datasubset$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     main="Global Active Power", 
     col="orangered2")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
