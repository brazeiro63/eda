if (!dir.exists("../data")){dir.create("../data")}
dest_zip <- "../data/household_power_consumption.zip"
dest_file <- "../data/household_power_consumption.txt"
url_origin <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists(dest_file)){
  download.file(url = url_origin, destfile = dest_zip)
  unzip(dest_zip,exdir = "../data")
  file.remove(dest_zip)
}
