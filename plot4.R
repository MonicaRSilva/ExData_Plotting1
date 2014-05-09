# Changing system locale to English so it can show the right names for week days
Sys.setlocale("LC_TIME", "English")

#reading table
table <- read.table("household_power_consumption.txt",sep=";",na.strings=c("?"),skip=66637,nrows=2880)
#naming columns
coln <- read.table("household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
colnames(table) <- as.character(coln)

#adding a new column and converting to Date time
table$dtime <- paste(table$Date,table$Time)
table$dtime <- strptime(table$dtime, format="%d/%m/%Y %H:%M:%S")

#Plot 4
windows.options(width=480,height=480)
par(mfcol=c(2,2))
plot(table$dtime,table$Global_active_power,type="l",main="",ylab="Global Active Power",xlab="")
plot(table$dtime,table$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(table$dtime,table$Sub_metering_1)
lines(table$dtime,table$Sub_metering_1, col = "black")
lines(table$dtime,table$Sub_metering_2, col = "red")
lines(table$dtime,table$Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black","red","blue"),cex=1,bty="n")
plot(table$dtime, table$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(table$dtime,table$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()