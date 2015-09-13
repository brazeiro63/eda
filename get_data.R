downloadSourceData <- function(url_origin = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                               local_folder = "../data",
                               local_file = "household_power_consumption.txt"){

  ## set the file name to store data
  temp_file <- paste(local_folder,"temp.zip",sep = "/")
  dest_file <- paste(local_folder, local_file,sep = "/")

  if (!dir.exists(local_folder)){dir.create(local_folder)}

  if (!file.exists(dest_file)){
    download.file(url = url_origin, destfile = temp_file)
    unzip(temp_file,exdir = local_folder)
    file.remove(temp_file)
  }
}

getDataNeeded <- function(local_file){
  # Download data
  downloadSourceData()

# read the head lines of the file
temp <- read.csv(local_file, sep= ";", nrows = 10)

# get column names
column_names<-names(temp)

# define number of lines to skip and read
start_time <- strptime(paste(temp$Date, temp$Time), "%d/%m/%Y %H:%M:%S")[1]
to_skip <- as.double(difftime("2007-02-01 00:00:00", start_time , units = "mins"))
to_read <- as.double(difftime("2007-02-02 23:59:00", "2007-01-31 23:59:00",
                             units = "mins"))

# read the lines of interest
temp_table <- read.table(local_file, sep = ";", na.strings = "?",
                         skip=to_skip +1, nrows = to_read)

# name the columns
names(temp_table) <- column_names

# create a variable to hold date and time in POSIX format
hpc_df <- temp_table %>%
  mutate(datetime = as.POSIXct(strptime(paste(Date, Time),"%e/%m/%Y %H:%M:%S")))

# return the data frame with relevant data
hpc_df
}
