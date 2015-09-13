with(fdm, plot(x = Date_Time, y = Sub_metering_1, type = "l", xlab = "", 
               ylab = "Energy sub metering"))
with(fdm, points(x = Date_Time, y = Sub_metering_2, type = "l", col = "red"))
with(fdm, points(x = Date_Time, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
               
