setwd("C:/Users/johnarmistead/Data Sci Coursera/Class4")
df <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".", header=TRUE)
(2075259*9*8)/(2^20)
subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdf$Global_active_power)

plot1 <- with(subdf, hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
png("plot1.png", width=480, height=480)