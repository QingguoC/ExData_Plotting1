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
png(file = "plot3.png",bg = "transparent")
#generate plot3
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
       lwd = par("lwd"))
#device off
dev.off()
