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
hist(as.double(mydata$Global_active_power), col = "red", main = "Global Acive Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png', width = 480, height = 480, units = "px")
dev.off()