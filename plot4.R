# read data from local file 
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.string="?")
# Convert date and time
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#extract relevant data for plotting
data <- hpc[(hpc$Date == "2007-02-01") |(hpc$Date == "2007-02-02"),]
data$Global_active_power <- as.numeric(data$Global_active_power)

plot(data$Time, data$Global_active_power,type="l",col="Black", ylab="Global Active Power", xlab="")
plot(data$Time, data$Voltage,type="l",col="Black", ylab="Voltage", xlab="datetime")
with(data, plot(data$Time,Sub_metering_1, type="l", col="Black", xlab="", ylab="Energy sub metering"))
with(data, points(data$Time,Sub_metering_2, type="l", col="Red"))
with(data, points(data$Time,Sub_metering_3, type="l", col="Blue"))
legend("topright", col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, cex=0.5, box.lty=0, inset = .02)
plot(data$Time, data$Global_reactive_power,type="l",col="Black", xlab="datetime")
