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

par(mfrow=c(2,2))

with(hpcdata3, plot(hpcdatatime, Global_active_power, 
                    main=" ", 
                    xlab = " ", ylab = "Global Active Power",
                    type="l"))

with(hpcdata3, plot(hpcdatatime, Voltage, 
                    main=" ", 
                    xlab = "datetime", 
                    type="l"))

with(hpcdata3, {plot(hpcdatatime, Sub_metering_1, 
                     main=" ", col="black", 
                     xlab = " ", ylab = "Energy sub metering",
                     type="l");
  lines(hpcdatatime, Sub_metering_2, 
        main=" ", col="red", 
        xlab = " ", ylab = "Energy sub metering",
        type="l");
  lines(hpcdatatime, Sub_metering_3, 
        main=" ", col="blue", 
        xlab = " ", ylab = "Energy sub metering",
        type="l");
  legend("topright" , 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red", "blue"), bty='n',lty=1, cex=0.3)})


with(hpcdata3, plot(hpcdatatime, Global_reactive_power, 
                    main=" ", 
                    xlab = "datetime", 
                    type="l"))

dev.copy(png,file="plot4.png")
dev.off()
