if (!existsFunction("getDataNeeded")) {
  source("get_data.R")
}
if (!exists("hpc_df")) {
  hpc_df <- getDataNeeded("../data/household_power_consumption.txt")
}

png(filename = "plot1.png")

gap_v <- hpc_df$Global_active_power
hist(
  x = gap_v,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)
dev.off()