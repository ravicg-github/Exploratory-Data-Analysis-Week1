setwd("C:/Projects_2016/Data Science/JOHNS HOPKINS UNIVERSITY/MachineLearningRepo/4. Exploratory Data Analysis/Assignment")
EPC_Data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec=".",na.strings="?")
EPC_Data$Date <- as.Date(EPC_Data$Date, format="%d/%m/%Y")
EPC_subset_Data <- subset(EPC_Data, (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(EPC_Data)
## Converting dates 
EPC_datetime <- paste(as.Date(EPC_subset_Data$Date), EPC_subset_Data$Time) 
EPC_subset_Data$Datetime <- as.POSIXct(EPC_datetime) 

## plot 1
hist(EPC_subset_Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
