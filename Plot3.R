#############################################################################
#
#         Plot 3 - Week 1 Assignment for Course 4: Exploratory Data Analysis
#
#         Submited by: Preeti Mehta
#
#############################################################################

#First create the working directory and unzip and download data file into it
#Then set the working directory in R

setwd("C:/Users/Preeti/Data Science Course/Course4Week1Assgt")

# Read in the column names and save to a vector
data_header <- names(read.table("household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))

# Read in the required subset of the data 
household_power_data <- read.table("household_power_consumption.txt",sep = ";",col.names = data_header, skip = 66637, nrow = 2880, stringsAsFactors = FALSE)
colnames(household_power_data) <- data_header
#Convert date and time columns from factors to date and time formats in R 

# Got the below expression from Week 1 Forum on Coursera
household_power_data$datetime <- strptime(paste(household_power_data$Date, household_power_data$Time), format = "%d/%m/%Y %H:%M:%S")

# Generate plot3 by first setting up plot3.png and then creating the plot
png("plot3.png", width=480, height=480)

plot(household_power_data$datetime, household_power_data$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", ylim=c(0,max(household_power_data$Sub_metering_1, household_power_data$Sub_metering_2, household_power_data$Sub_metering_3)))

lines(household_power_data$datetime, household_power_data$Sub_metering_2, type = "l", col = "red")
lines(household_power_data$datetime, household_power_data$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close Png file

dev.off()





