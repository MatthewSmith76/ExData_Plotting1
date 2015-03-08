## Plot4.R - Reproduce Plot 4 in Programming Assignemnt 1 - Exporatory Data Analysis
# The fourth plot (aka \figures\unnamed-chunk-6.png) has 4 subplots.
# I found that the calling 
# png(), plots(), etc, dev.off() 
# got the siZes correct, as opposed to the dev.print() version which stuffed up
# the legend :-(
plot4 <- function(){
  
  fileName <- "household_power_consumption.txt"
  require("data.table")
  dt <- fread(fileName, na.strings = "?")
  setkey(dt,Date)
  dtSub <- dt[c("1/2/2007", "2/2/2007")]
  class(dtSub$Sub_metering_1) <- "numeric"
  class(dtSub$Sub_metering_2) <- "numeric"
  class(dtSub$Sub_metering_3) <- "numeric"
  
  
  t <- strptime(paste(dtSub$Date, dtSub$Time), format = "%d/%m/%Y %H:%M:%S")
  
  # write to PNG
  png(file = "plot4.png", width = 480, height = 480) 
  par(mfrow = c(2, 2))
  
  # subplot 1,1
  yLabStr <- "Global Active Power (kilowatts)"
  plot(t, dtSub$Global_active_power, type = "l", ylab = yLabStr, xlab = "")
  
  # subplot 1,2
  yLabStr <- "Voltage"
  plot(t, dtSub$Voltage, type = "l", ylab = yLabStr, xlab = "datetime")  
  
  # Subplot 2,1
  yLabStr <- "Energy sub metering"
  plot(t,  dtSub$Sub_metering_1, type = "l", ylab = yLabStr, xlab = "")
  lines(t, dtSub$Sub_metering_2, col = "red")
  lines(t, dtSub$Sub_metering_3, col = "blue")
  
  legNames   <- c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3")
  colorNames <- c("black", "red", "blue")
  legend("topright", legend = legNames, lty = 1, col = colorNames, bty = "n")
  
  # subplot 2,2
  with(dtSub,  plot(t, Global_reactive_power, type = "l", xlab = "datetime"))
  
  # write to PNG
  dev.off()
  
  
}