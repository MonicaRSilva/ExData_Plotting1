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

#Plot 2
windows.options(width=480,height=480)
plot(table$dtime,table$Global_active_power,type="l",main="",ylab="Global Active Power (killowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()