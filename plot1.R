#read first row to get column names
household_power_consumption<-household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt",nrows = 1)
names<- names(household_power_consumption)
household_power_consumption <- read.csv2(header = TRUE,"household_power_consumption.txt", sep=";",skip = 66636,nrows = 2881)
colnames(household_power_consumption)<-names
## change the type of the time vriables
household_power_consumption["Date"]<- lapply(household_power_consumption["Date"],strptime,format="%d/%m/%Y")
household_power_consumption["Time"]<- lapply(household_power_consumption["Time"],strptime,format="%H:%M:%s")
##turn all factor variables into Numeric and consider just complete cases
factorColumns<-names(household_power_consumption)[4:length(names(household_power_consumption))-1]
cleanedData<-apply(household_power_consumption[factorColumns],2,as.double)
notMissingData<- cleanedData[complete.cases(cleanedData),]
png("plot1.png")
options(scipen = 5)
hist(notMissingData[,"Global_active_power"],breaks = 20,xlab = "Global active Power(kilowatts)",col = "red",main = "Global Active Power")
dev.off()


