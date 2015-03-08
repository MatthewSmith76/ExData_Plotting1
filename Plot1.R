## Plot1.R - Reproduce Plot 1 in Programming Assignemnt 1 - Exporatory Data Analysis
# The first plot (aka \figures\unnamed-chunk-2.png) is a histogram
plot1 <- function(){
  
  fileName <- "household_power_consumption.txt"
  require("data.table")
  dt <- fread(fileName, na.strings = "?")
  setkey(dt,Date)
  dtSub <- dt[c("1/2/2007", "2/2/2007")]
  class(dtSub$Global_active_power) <- "numeric"
  
  titStr  <- "Global Active Power"
  xLabStr <- paste(titStr," (kilowatts)")
  with(dtSub, hist(Global_active_power, col = "red", xlab = xLabStr, main = titStr))
  
  # write to PNG
  dev.print(png, file = "plot1.png", width = 480, height = 480)  
}