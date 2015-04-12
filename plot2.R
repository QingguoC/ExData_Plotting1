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
png(file = "plot2.png",bg = "transparent")
#generate plot2
plot(TwoDateData$DateTime, TwoDateData$Global_active_power, 
     type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     ylim = c(0,6),
     yaxt = "n",
)
axis(side = 2, at = seq(0, 6,by = 2), labels = seq(0, 6,by = 2))
#device off
dev.off()
