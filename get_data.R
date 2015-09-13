temp <- read.csv(dest_file, sep= ";", nrows = 10)
cols<-names(temp)
init <- strptime(paste(temp$Date, temp$Time), "%d/%m/%Y %H:%M:%S")[1]
skiped <- as.double(difftime("2007-02-01 00:00:00", init , units = "mins"))
n_rows <- as.double(difftime("2007-02-02 23:59:00", "2007-01-31 23:59:00", 
                             units = "mins"))
fd <- read.table(dest_file, sep = ";", na.strings = "?", 
                 skip=skiped +1, nrows = n_rows)
names(fd) <- cols
fdm<- mutate(fd, Date_Time = as.POSIXct(strptime(paste(Date, Time), 
                                                 "%e/%m/%Y %H:%M:%S")))
