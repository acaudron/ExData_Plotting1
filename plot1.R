#read data
options(stringsAsFactors = FALSE)
data <- read.csv("../household_power_consumption.txt", sep = ";")
#select data by date
days <- seq(as.Date("2007-02-01"), as.Date("2007-02-02"), "days")
mydata <- data[as.Date(data$Date, "%d/%m/%Y") %in% days,]
#draw and save plot
hist(as.double(mydata$Global_active_power), col = "red", main = "Global Acive Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png', width = 480, height = 480, units = "px")
dev.off()