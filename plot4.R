#Exploratory Data Analysis Project 1
#Load txt into R
data<-read.table(file = "household_power_consumption.txt", 
                 sep = ";", 
                 header = TRUE,
                 na.strings="?",
                 stringsAsFactors=F,
                 colClass = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# Select two dates' data
TwoDate <-data[,1]=="1/2/2007"|data[,1]=="2/2/2007"
TwoDateData<-data[TwoDate,]
summary(TwoDateData)
#Generate new column as date time class based on column 1 and 2(date and time)
TwoDateData$DateTime <-strptime(paste(TwoDateData[,1],TwoDateData[,2]), "%d/%m/%Y %H:%M:%S")

#start PNG device
png(file = "plot4.png")
#generate plot4
par(mfrow = c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(TwoDateData$DateTime, TwoDateData$Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     ylim = c(0,6),
     yaxt = "n",
)
axis(side = 2, at = seq(0, 6,by = 2), labels = seq(0, 6,by = 2))

plot(TwoDateData$DateTime,TwoDateData$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     ylim = c(234,246))

plot(TwoDateData[,10], TwoDateData[,7],
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     ylim = c(0,40),
     yaxt = "n"
)
axis(side = 2, at = seq(0,30, by = 10), labels = seq(0,30, by = 10))
lines(TwoDateData[,10],TwoDateData[,8], col = "red")
lines(TwoDateData[,10],TwoDateData[,9], col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = par("lwd"),
       lty = 1,
       bty = "n",
       cex = 0.8)

plot(TwoDateData[,10], TwoDateData[,4],
     xlab = "datetime",
     ylab = "Global_reactive_power",
     ylim = c(0.0, 0.5),
     type = "l")
#device off
dev.off()
