#read file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


#subset les donnees avec les dates concernés
data_1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#transform date columnin date class
data_1$Date <- as.Date(data_1$Date, "%d/%m/%y")


# printing in scientific notation
data_1$Global_active_power <- as.numeric(data_1$Global_active_power)

#create new var paste date and time
date_time <- paste(data_1$Date, data_1$Time)

data_1$Date_time = as.POSIXct(date_time)

png("plot3.png", width=480, height=480)

# plot the graph
with(data_1, {
        plot(Sub_metering_1~Date_time, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
})


# add legend

legend("topright", col=c("black","red","blue"),lty=1, lwd=2,legend = c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3") )

dev.off()