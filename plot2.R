hpcdata<-read.csv2("household_power_consumption.txt")

hpcdatatime<-strptime(paste(hpcdata[,1],hpcdata[,2]),"%d/%m/%Y %H:%M:%S")
hpcdata[,1]<-as.Date(hpcdata[,1],"%d/%m/%Y")
hpcdata[,3]<-as.numeric(as.character(hpcdata[,3]))
hpcdata[,4]<-as.numeric(as.character(hpcdata[,4]))
hpcdata[,5]<-as.numeric(as.character(hpcdata[,5]))
hpcdata[,6]<-as.numeric(as.character(hpcdata[,6]))
hpcdata[,7]<-as.numeric(as.character(hpcdata[,7]))
hpcdata[,8]<-as.numeric(as.character(hpcdata[,8]))
hpcdata[,9]<-as.numeric(as.character(hpcdata[,9]))
hpcdata2<-cbind(hpcdata,hpcdatatime)

date1<-as.Date("2007/02/01","%Y/%m/%d")
date2<-as.Date("2007/02/02","%Y/%m/%d")
hpcdata3<-hpcdata2[hpcdata2[,1]==date1 | hpcdata2[,1]==date2 ,]

with(hpcdata3, plot(hpcdatatime, Global_active_power, 
                    main=" ", 
                    xlab = " ", ylab = "Global Active Power (kilowatts)",
                    type="l"))

dev.copy(png,file="plot2.png")
dev.off()