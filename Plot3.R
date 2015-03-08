## Plot3.R - Reproduce Plot 3 in Programming Assignemnt 1 - Exporatory Data Analysis
# The first plot (aka \figures\unnamed-chunk-4.png) is a line-plot, with 3 lines
plot3 <- function(){
  
  fileName <- "household_power_consumption.txt"
  require("data.table")
  dt <- fread(fileName, na.strings = "?")
  setkey(dt,Date)
  dtSub <- dt[c("1/2/2007", "2/2/2007")]
  class(dtSub$Sub_metering_1) <- "numeric"
  class(dtSub$Sub_metering_2) <- "numeric"
  class(dtSub$Sub_metering_3) <- "numeric"
  
  # write to PNG
  png(file = "plot3.png", width = 480, height = 480) 
  
  t <- strptime(paste(dtSub$Date, dtSub$Time), format = "%d/%m/%Y %H:%M:%S")
  
  yLabStr <- "Energy sub metering"

  plot(t,  dtSub$Sub_metering_1, type = "l", ylab = yLabStr, xlab = "")
  lines(t, dtSub$Sub_metering_2, col = "red")
  lines(t, dtSub$Sub_metering_3, col = "blue")

  legNames   <- c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3")
  colorNames <- c("black", "red", "blue")
  legend("topright", legend = legNames, lty = 1, col = colorNames, bty = "n")
  
  # write to PNG
  dev.off() 
  
}