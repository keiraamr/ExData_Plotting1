#read File
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


#subset les donnees avec les dates concernés
data_1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")


#convert Time & date in classes
data_1$Date <- as.Date(data_1$Date, "%m/%d/%y")
data_1$Time <- strptime(data_1$Time, "%H:%M:%S")

#printing in scientific notation
data_1$Global_active_power <- as.numeric(data_1$Global_active_power)

png("plot1.png", width=480, height=480)

# plot Hist
hist(data_1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")


dev.off()