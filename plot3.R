setwd("C:/Users/johnarmistead/Data Sci Coursera/Class4")
df <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, dec=".", header=TRUE)
subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdf$Global_active_power)
GRP <- as.numeric(subdf$Global_reactive_power)
submeter1 <- as.numeric(subdf$Sub_metering_1)
submeter2 <- as.numeric(subdf$Sub_metering_2)
submeter3 <- as.numeric(subdf$Sub_metering_3)

plot3 <- plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright"
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=c(1,1)
       , bty="n"
       , cex=.5
       , col=c("black", "red", "blue"))png("plot3.png", width=480, height=480)