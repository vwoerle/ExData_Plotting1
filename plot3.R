# Set Working Directory ####
setwd("~/R/Coursera_Exploratory Data Analysis")

# Unzip File ####
unzip("exdata_data_household_power_consumption.zip")

# Transform Factor into Numeric Values
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}

# Read File
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
# Subset
power_ss <- subset(power,Date=="1/2/2007" | Date=="2/2/2007")

# Combine Date and Time $ Bring into Format
DateTime <- paste0(power_ss$Date,"-",power_ss$Time)
power_ss$DateTime <- strptime(DateTime, format="%e/%m/%Y-%H:%M:%S")


# Create PNG Device
png(filename="plot3.png",width=480, height=480, units="px")
# 3 Plots in One Window
plot(power_ss$DateTime,as.numeric.factor(power_ss$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering")
lines(power_ss$DateTime,as.numeric.factor(power_ss$Sub_metering_1))
lines(power_ss$DateTime,as.numeric.factor(power_ss$Sub_metering_2),col="red")
lines(power_ss$DateTime,power_ss$Sub_metering_3,col="blue")
# Legend
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close Device
dev.off()