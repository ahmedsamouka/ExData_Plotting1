# Reading, naming and subsetting power consumption data
> adata <- read.table("household_power_consumption.txt",skip=1,sep=";")
> names(adata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
> needed$Date <- as.Date(needed$Date, format = "%d/%m/%Y")
> needed$Time <- strptime(needed$Time, format="%H:%M:%S")
> needed[1:1440,"Time"] <- format(needed[1:1440,"Time"],"2007-02-01 %H:%M:%S")
> needed[1441:2880,"Time"] <- format(needed[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
# calling the basic plot functions
> plot(needed$Time,needed$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
> with(needed,lines(Times,as.numeric(as.character(Sub_metering_1))))
> with(needed,lines(Time,as.numeric(as.character(Sub_metering_1))))
> with(needed,lines(Time,as.numeric(as.character(Sub_metering_2)), col = "red"))
> with(needed,lines(Time,as.numeric(as.character(Sub_metering_3)), col = "blue"))
> legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# annotating graph
> title(main="Energy sub-metering")
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()