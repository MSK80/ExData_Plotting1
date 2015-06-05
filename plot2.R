dates <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dates<-subset(dates,Date=="1/2/2007" | Date=="2/2/2007")
dateTime<-as.data.frame(paste(as.Date(dates$Date,format="%d/%m/%Y"),dates$Time))
aaa<-cbind(dateTime,dates)
my_data<-aaa[,c(1,4:10)]
colnames(my_data)[1] <- "dateTime"
remove(aaa,dates,dateTime)
#plot #2
day<-as.data.frame(weekdays(as.Date(my_data$dateTime)))
my_data<-cbind(day,my_data)
colnames(my_data)[1] <- "day"
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot(as.numeric(as.character(my_data$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)", col="black",xlab="",xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
