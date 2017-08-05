plot4 <- function() {
  
  library(lubridate)
  library(dplyr)
  
  #Loading the Lcally Saved File "Household Power Consumption"
  myCompleteFile <- read.csv(file = "C:/Users/Amit/Desktop/R_Submissions/EDA/exdata_data_household_power_consumption/household_power_consumption.txt", sep= ";")
  
  #Conversting the Date Column to Date Format
  myCompleteFile$Date <- dmy(myCompleteFile$Date)
  
  # Saving the subset of myCompleteFile with Date range from Feb 01, 2007 to Feb 02, 2007
  mydata <- subset(myCompleteFile, myCompleteFile$Date >= as.Date("2007-02-01") & myCompleteFile$Date <= as.Date("2007-02-02"))
  
  start_x <- 1
  End_x <- length(mydata$Date)
  Mid_x <- 0
  
  for(i in seq_along(mydata$Date)){
    
    if(mydata$Date[i] == mydata$Date[1])  
    {next}
    Mid_x <- i
    break
  }
  
  #Opening png device
  png(filename = "C:/Users/Amit/Desktop/R_Submissions/EDA/exdata_data_household_power_consumption/plot4.png")
  
  par(mfrow = c(2,2))
  #Creating and saving 1st Plot which is which is Lineplot of variable Global Active Power
  
  Global_Active_Power <- as.numeric(as.character(mydata$Global_active_power))
  Global_Active_Power <- Global_Active_Power/1000
  plot(Global_Active_Power, type = "l", axes = FALSE, frame.plot = TRUE)
  axis(2)
  axis(1, at = c(start_x, Mid_x, End_x), labels = c("Thu", "Fri", "Sat"))
  
  #Creating and saving 2nd Plot which is which is Lineplot of variable voltage
  
  Voltage <- as.numeric(as.character(mydata$Voltage))
  plot(Voltage, type = "l", axes = FALSE, frame.plot = TRUE)
  axis(2)
  axis(1, at = c(start_x, Mid_x, End_x), labels = c("Thu", "Fri", "Sat"))
  
  #Creating and saving 3nd Plot which is which is Lineplot of variables Sub Metering1, Sub Metering2 & Sub Metering3
  
  Sub_Metering1 <- as.numeric(as.character(mydata$Sub_metering_1))
  Sub_Metering2 <- as.numeric(as.character(mydata$Sub_metering_2))
  plot(Sub_Metering1, type = "l", axes = FALSE, frame.plot = TRUE)
  axis(2)
  axis(1, at = c(start_x, Mid_x, End_x), labels = c("Thu", "Fri", "Sat"))
  lines(Sub_Metering2, type = "l", col = "red")
  lines(mydata$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = c(2,2,2), col = c("black", "red", "blue"), legend = c("Sub Metering1", "Sub Metering2", "Sub Metering3"))
  
  
  #Creating and saving 4th Plot which is which is Lineplot of variable Global Reactive Power 
  Global_Reactive_Power <- as.numeric(as.character(mydata$Global_reactive_power))
  plot(Global_Reactive_Power, type = "l", axes = FALSE, frame.plot = TRUE)
  axis(2)
  axis(1, at = c(start_x, Mid_x, End_x), labels = c("Thu", "Fri", "Sat"))
  
  #Closing the GR Device
  dev.off()  
  
} 