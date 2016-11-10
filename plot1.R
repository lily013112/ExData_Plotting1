##read data into R
setwd("~/Documents/coursera/Exploratory data anlysis/homework/course project 1")
files<-file("./household_power_consumption.txt")
data<-read.table(text=grep("^[1,2]/2/2007",readLines(files),value=TRUE),sep=";",na.strings="?")
cnames<-readLines(files,1)
cnames<-strsplit(cnames,";",fixed=TRUE)
names(data)<-cnames[[1]]

##Plot 1
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()