# read data from local file 
hpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
# Convert date and time
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#extract relevant data for plotting
data <- hpc[(hpc$Date == "2007-02-01") |(hpc$Date == "2007-02-02"),]
data$Global_active_power <- as.numeric(data$Global_active_power)

#create histogram and copy to png file
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts")
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()