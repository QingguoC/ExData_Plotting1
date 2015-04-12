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
png(file = "plot1.png")
#generate plot1
hist(TwoDateData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" ,
     xlim = c(0,6),
     axes = FALSE,
     col = "red")
axis(side = 1, at = c(0,2,4,6))
axis(side = 2, at = seq(0, 1200,by = 200), labels = seq(0, 1200,by = 200) )
#device off
dev.off()
