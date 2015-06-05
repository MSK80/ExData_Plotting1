dates <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dates<-subset(dates,Date=="1/2/2007" | Date=="2/2/2007")
dateTime<-as.data.frame(paste(as.Date(dates$Date,format="%d/%m/%Y"),dates$Time))
aaa<-cbind(dateTime,dates)
my_data<-aaa[,c(1,4:10)]
colnames(my_data)[1] <- "dateTime"
remove(aaa,dates,dateTime)
#plot #4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
par(mfrow=c(2,2))
plot(as.numeric(as.character(my_data$Global_active_power)),type="l",ylab="Global Active Power", col="black",xlab="",xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
plot(as.numeric(as.character(my_data$Voltage)),type="l",ylab="Voltage", col="black",xlab="datetime",xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
{
  plot(as.numeric(as.character(my_data$Sub_metering_1)),type="l", col="black",xlab="",xaxt="n",ylab="Energy sub metering",ylim=c(0,max(as.numeric(as.character(my_data$Sub_metering_1)))))
  par(new=T)
  plot(as.numeric(as.character(my_data$Sub_metering_2)),type="l", col="red",xlab="",xaxt="n",ylab="",ylim=c(0,max(as.numeric(as.character(my_data$Sub_metering_1)))))
  par(new=T)
  plot(as.numeric(as.character(my_data$Sub_metering_3)),type="l", col="blue",xlab="",xaxt="n",ylab="",ylim=c(0,max(as.numeric(as.character(my_data$Sub_metering_1)))))
  axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")  
}
plot(as.numeric(as.character(my_data$Global_reactive_power)),type="l",ylab="Global reactive power", col="black",xlab="datetime",xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
