##read data into R
setwd("~/Documents/coursera/Exploratory data anlysis/homework/course project 1")
files<-file("./household_power_consumption.txt")
data<-read.table(text=grep("^[1,2]/2/2007",readLines(files),value=TRUE),sep=";",na.strings="?")
cnames<-readLines(files,1)
cnames<-strsplit(cnames,";",fixed=TRUE)
names(data)<-cnames[[1]]

##Plot 4
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5,lwd = 0.5,bty="n")
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()
