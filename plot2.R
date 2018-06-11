#read data
options(stringsAsFactors = FALSE)
data <- read.csv("../household_power_consumption.txt", sep = ";")
#select data by date
days <- seq(as.Date("2007-02-01"), as.Date("2007-02-02"), "days")
mydata <- data[as.Date(data$Date, "%d/%m/%Y") %in% days,]
#draw and save plot
Sys.setlocale("LC_ALL", "en_GB.UTF-8") #to have days label in english
plot(strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S"), as.double(mydata$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,'plot2.png', width = 480, height = 480, units = "px")
dev.off()