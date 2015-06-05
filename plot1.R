dates <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dates<-subset(dates,Date=="1/2/2007" | Date=="2/2/2007")
dateTime<-as.data.frame(paste(as.Date(dates$Date,format="%d/%m/%Y"),dates$Time))
aaa<-cbind(dateTime,dates)
my_data<-aaa[,c(1,4:10)]
colnames(my_data)[1] <- "dateTime"
remove(aaa,dates,dateTime)
#plot #1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
hist(as.numeric(as.character(my_data$Global_active_power)),xlab="Global Active Power (kilowatts)", col="red",main="Global Active Power")
dev.off()