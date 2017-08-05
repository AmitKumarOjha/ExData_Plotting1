plot1 <- function() {
  
library(lubridate)
library(dplyr)
  
#Loading the Lcally Saved File "Household Power Consumption"
myCompleteFile <- read.csv(file = "C:/Users/Amit/Desktop/R_Submissions/EDA/exdata_data_household_power_consumption/household_power_consumption.txt", sep= ";")

#Conversting the Date Column to Date Format
myCompleteFile$Date <- dmy(myCompleteFile$Date)
  
# Saving the subset of myCompleteFile with Date range from Feb 01, 2007 to Feb 02, 2007
mydata <- subset(myCompleteFile, myCompleteFile$Date >= as.Date("2007-02-01") & myCompleteFile$Date <= as.Date("2007-02-02"))
  
#print(str(mydata))  

#Opening png device
png(filename = "C:/Users/Amit/Desktop/R_Submissions/EDA/exdata_data_household_power_consumption/plot1.png")

#Creating and saving plot1 which is Histogram of variable Global Active Power
Global_Active_Power <- as.numeric(as.character(mydata$Global_active_power))
Global_Active_Power <- Global_Active_Power/1000
hist(Global_Active_Power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "Red")

#Closing the GR Device
dev.off()  

} 