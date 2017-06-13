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

#Combine Date and Time $ Bring into right Format
DateTime <- paste0(power_ss$Date,"-",power_ss$Time)
power_ss$DateTime <- strptime(DateTime, format="%e/%m/%Y-%H:%M:%S")

# Create PNG Device
png(filename="plot2.png",width=480, height=480, units="px")
# Plot with lines without points
plot(power_ss$DateTime, as.numeric.factor(power_ss$Global_active_power),type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(power_ss$DateTime,as.numeric.factor(power_ss$Global_active_power))
# Close Device
dev.off()
