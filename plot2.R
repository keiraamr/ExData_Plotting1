#read file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


#subset les donnees avec les dates concernés
data_1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")


#convert date in date Classe
data_1$Date <- as.Date(data_1$Date, "%d/%m/%y")


# printing in scientific notation

data_1$Global_active_power <- as.numeric(data_1$Global_active_power)


#create new var paste date and time
date_time <- paste(data_1$Date, data_1$Time)
data_1$Date_time = as.POSIXct(date_time)

png("plot2.png", width=480, height=480)

# faire LE GRAPHE
plot(data_1$Date_time , data_1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")



dev.off()