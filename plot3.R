Sys.setlocale("LC_TIME", "en_US.UTF-8")
#read first row to get column names
png("plot3.png")
household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt",nrows = 1)
names<- names(household_power_consumption)
household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt", sep=";",skip = 66636,nrows = 2881,stringsAsFactors = FALSE)
colnames(household_power_consumption)<- names
household_power_consumption["Timestamp"]<-paste(household_power_consumption[,"Date"],household_power_consumption[,"Time"])
household_power_consumption["Timestamp"]<- lapply(household_power_consumption["Timestamp"],strptime,format="%d/%m/%Y %H:%M:%S")
cleanedData<-apply(household_power_consumption[,3:9],2,as.double)
cleanedData<- data.frame(cleanedData)
cleanedData["Timestamp"]<- household_power_consumption["Timestamp"]
plot(cleanedData$Timestamp,cleanedData$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
lines(cleanedData$Timestamp,cleanedData$Sub_metering_2,col="red")
lines(cleanedData$Timestamp,cleanedData$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"),cex = 0.75)
dev.off()

