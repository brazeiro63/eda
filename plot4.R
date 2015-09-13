if (!existsFunction("getDataNeeded")) {
  source("get_data.R")
}
if (!exists("hpc_df")) {
  hpc_df <- getDataNeeded("../data/household_power_consumption.txt")
}

png(filename = "plot4.png")

par(mfrow = c(2, 2), mar = c(5, 4, 2, 2))
with(
  hpc_df, plot(
    datetime,
    Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power"
  )
)


with(hpc_df, plot(datetime,
                  Voltage,
                  type = "l",
                  ylab = "Voltage"))

with(
  hpc_df, plot(
    x = datetime, y = Sub_metering_1, type = "l", xlab = "",
    ylab = "Energy sub metering"
  )
)
with(hpc_df, points(
  x = datetime, y = Sub_metering_2, type = "l", col = "red"
))
with(hpc_df, points(
  x = datetime, y = Sub_metering_3, type = "l", col = "blue"
))
legend(
  "topright", lwd = 1, col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  bty = "n"
)


with(hpc_df,
     plot(datetime,
          Global_reactive_power,
          lwd = 1,
          type = "l"))

dev.off()