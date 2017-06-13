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
# Create PNG Device
png(filename="plot1.png",width=480, height=480, units="px")
# Histogram
hist(as.numeric.factor(power_ss$Global_active_power),xlab = "Global Active Power (kilowatts)", col="red",main="Global Active Power")
# Close Device
dev.off()


#savePlot(filename="plot1.png",type="png")