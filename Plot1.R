#############################################################################
#
#         Plot 1 - Week 1 Assignment for Course 4: Exploratory Data Analysis
#
#         Submitted by: Preeti Mehta
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

# Generate plot1 by first setting up plot1.png and then creating the histogram
png("plot1.png", width=480, height=480)
hist(household_power_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
# Close png file
dev.off()

