#reading table
table <- read.table("household_power_consumption.txt",sep=";",na.strings=c("?"),skip=66637,nrows=2880)
#naming columns
coln <- read.table("household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
colnames(table) <- as.character(coln)

#Plot 1
X11.options(width=480,height=480)
hist(table$Global_active_power, main="Global Active Power",xlab= "Global Active Power (killowatts)", col="red")
dev.copy(png,file="plot1.png")
dev.off()
