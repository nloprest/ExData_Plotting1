hpcdata<-read.csv2("household_power_consumption.txt")

hpcdata[,1]<-as.Date(hpcdata[,1],"%d/%m/%Y")
hpcdata[,3]<-as.numeric(as.character(hpcdata[,3]))
hpcdata[,4]<-as.numeric(as.character(hpcdata[,4]))
hpcdata[,5]<-as.numeric(as.character(hpcdata[,5]))
hpcdata[,6]<-as.numeric(as.character(hpcdata[,6]))
hpcdata[,7]<-as.numeric(as.character(hpcdata[,7]))
hpcdata[,8]<-as.numeric(as.character(hpcdata[,8]))
hpcdata[,9]<-as.numeric(as.character(hpcdata[,9]))

date1<-as.Date("2007/02/01","%Y/%m/%d")
date2<-as.Date("2007/02/02","%Y/%m/%d")
hpcdata2<-hpcdata[hpcdata[,1]==date1 | hpcdata[,1]==date2 ,]

hist(hpcdata2$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", xlim=c(0,6), 
     xaxp=c(0,6,3))

dev.copy(png,file="plot1.png")
dev.off()