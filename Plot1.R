#Reading, naming and subsetting power consumption data
> adata <- read.table("household_power_consumption.txt",skip=1,sep=";")
> names(adata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
> needed <- subset(adata,adata$Date=="1/2/2007" | adata$Date =="2/2/2007")
#calling the basic plot function
> hist(as.numeric(as.character(needed$Global_active_power)), main = "Global Active Power", col = "red", ylab = "Frequancy", xlab = "Global Active Power (Kilowatts)")
# annotating graph
> title(main="Global Active Power")
## Saving to file
png("plot1.png", width=480, height=480)
dev.off()