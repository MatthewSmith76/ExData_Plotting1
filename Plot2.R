## Plot2.R - Reproduce Plot 2 in Programming Assignemnt 1 - Exporatory Data Analysis
# The first plot (aka \figures\unnamed-chunk-3.png) is a line-plot (plot of type line)
plot2 <- function(){
  
  fileName <- "household_power_consumption.txt"
  require("data.table")
  dt <- fread(fileName, na.strings = "?")
  setkey(dt,Date)
  dtSub <- dt[c("1/2/2007", "2/2/2007")]
  class(dtSub$Global_active_power) <- "numeric"
  
  
  t <- strptime(paste(dtSub$Date, dtSub$Time), format = "%d/%m/%Y %H:%M:%S");

  yLabStr <- "Global Active Power (kilowatts)"
  plot(t, dtSub$Global_active_power, type = "l", ylab = yLabStr, xlab = "")

  # write to PNG
  dev.print(png, file = "plot2.png", width = 480, height = 480)  
}