if (!existsFunction("getDataNeeded")) {
  source("get_data.R")
}
if (!exists("hpc_df")) {
  hpc_df <- getDataNeeded("../data/household_power_consumption.txt")
}

png(filename = "plot3.png")

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
  "topright", lwd = 2, col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

dev.off()