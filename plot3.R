#read data
if(!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}
options(stringsAsFactors = FALSE)
data <- read.csv("household_power_consumption.txt", sep = ";")
#select data by date
days <- seq(as.Date("2007-02-01"), as.Date("2007-02-02"), "days")
mydata <- data[as.Date(data$Date, "%d/%m/%Y") %in% days,]
#draw and save plot
Sys.setlocale("LC_ALL", "en_GB.UTF-8") #to have days label in english
png('plot3.png', width = 480, height = 480, units = "px")
plot(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S"), as.double(mydata$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S"), as.double(mydata$Sub_metering_2), type = "l", col = "red")
lines(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S"), as.double(mydata$Sub_metering_3), type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()