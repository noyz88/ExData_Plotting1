Sys.setlocale("LC_TIME", "en_US.UTF-8")
png("plot2.png")
#read first row to get column names
household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt",nrows = 1)
names<- names(household_power_consumption)
household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt", sep=";",skip = 66636,nrows = 2881,stringsAsFactors = FALSE)
colnames(household_power_consumption)<- names
household_power_consumption["Timestamp"]<-paste(household_power_consumption[,"Date"],household_power_consumption[,"Time"])
household_power_consumption["Timestamp"]<- lapply(household_power_consumption["Timestamp"],strptime,format="%d/%m/%Y %H:%M:%S")
cleanedData<-apply(household_power_consumption[,3:9],2,as.double)
cleanedData<- data.frame(cleanedData)
cleanedData["Timestamp"]<- household_power_consumption["Timestamp"]
plot(cleanedData$Timestamp,cleanedData$Global_active_power,type = "l",ylab="Global Active Power(kilowatts)",xlab = "")
dev.off()
#plot(notMissingData$Timestamp,notMissingData$Global_active_power,ylab="Global Active Power(kilowatts)",type="l")

#axis.POSIXct(1,at =notMissingData["Timestamp"])

