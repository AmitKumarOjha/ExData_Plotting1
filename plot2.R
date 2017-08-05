plot2 <- function() {
  
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
  png(filename = "C:/Users/Amit/Desktop/R_Submissions/EDA/exdata_data_household_power_consumption/plot2.png")

  #Creating and saving plot2 which is Lineplot of variable Global Active Power

  Global_Active_Power <- as.numeric(as.character(mydata$Global_active_power))
  Global_Active_Power <- Global_Active_Power/1000
  plot(Global_Active_Power, type = "l", axes = FALSE, frame.plot = TRUE)
  axis(2)
  axis(1, at = c(start_x, Mid_x, End_x), labels = c("Thu", "Fri", "Sat"))
  #Closing the GR Device
  dev.off()  
  
} 