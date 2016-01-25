#the following codes will plot 'Plot 01 - Global Active Power'

#directory assigned
setwd("D:/My Documents/Coursera/Data Science/4. Explanatory Data Analysis/Week_01/Project_01")
#a fraction is extracted from the Big Dataset which contains the interested time period
df <- read.table("exData/household_power_consumption.txt", header = FALSE, sep = ";", nrows = 10000, skip = 60000, na.strings = "?", stringsAsFactors = FALSE)
#header is assigned
names(df) <- names(read.table("exData/household_power_consumption.txt", header = TRUE, sep = ";", nrows = 5))

#character converted into Date & Time
df$contTime <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
#interested dataset is extracted
DataNeeded <- subset(df, contTime >= "2007-02-01 00:00:00" & contTime <= "2007-02-02 23:59:00")

#plot - histogram
hist(DataNeeded$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "Plots/plot1.png", width = 480, height = 480) ## Copy the plot to a PNG file
dev.off() #close the PNG device
