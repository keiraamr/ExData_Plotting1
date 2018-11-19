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

png("plot4.png", width=480, height=480)

# plot the graphs
par(mfrow=c(2,2)) # To plot with more than one graph
with(data_1, {
       
         plot(Date_time , Global_active_power, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        
        plot(Date_time , Voltage, type="l",
             ylab="Voltage", xlab="datetime")             
        
        plot(Sub_metering_1~Date_time, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
        legend("topright", col=c("black","red","blue"),lty=1, lwd=2,legend = c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3"))
        
        plot(Date_time , Global_reactive_power, type="l",
             ylab="Global Reactive Power (kilowatts)", xlab="datetime")
        
})






dev.off()