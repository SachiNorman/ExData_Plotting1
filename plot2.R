filename <- "household_power_consumption.txt"
df <- read.table(filename,
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", "numeric"),
                 na="?")
# convert datetime variables to Date/Time class
df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
df <- subset(df, Date %in% dates)

png(filename='plot2.png',height=400,width=400)

plot(df$Time,df$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     col="black")

dev.off()
        

        
