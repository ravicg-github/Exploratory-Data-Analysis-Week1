setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Assignment")

# Get full data
EPC_Data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".",na.strings="?")
EPC_Data$Date <- as.Date(EPC_Data$Date, format="%d/%m/%Y")
EPC_subset_Data <- subset(EPC_Data, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPC_Data)
## Converting dates 
EPC_datetime <- paste(as.Date(EPC_subset_Data$Date), EPC_subset_Data$Time) 
EPC_subset_Data$Datetime <- as.POSIXct(EPC_datetime) 

## Plot 4 

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(EPC_subset_Data, { 
     plot(Global_active_power~Datetime, type="l",  
          ylab="Global Active Power (kilowatts)", xlab="") 
     plot(Voltage~Datetime, type="l",  
          ylab="Voltage (volt)", xlab="") 
     plot(Sub_metering_1~Datetime, type="l",  
          ylab="Global Active Power (kilowatts)", xlab="") 
     lines(Sub_metering_2~Datetime,col='Red') 
     lines(Sub_metering_3~Datetime,col='Blue') 
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",cex=.3, pt.cex=cex, 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
     plot(Global_reactive_power~Datetime, type="l",  
          ylab="Global Rective Power (kilowatts)",xlab="") 
 }) 

## Saving to file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 