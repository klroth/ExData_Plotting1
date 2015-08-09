## This R code downloads the Project 1 data and creates a png file containing a histogram of Global Active Power for 2007-02-01 and 2007-02-02 ##


## Get the Data ##

# read data from url
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="libcurl")
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";",stringsAsFactors=FALSE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
unlink(temp)

# subset by dates
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Merge and convert Date/Time
subdata$DateTime<-paste(subdata$Date,subdata$Time,sep=" ")
subdata$DateTime<-strptime(subdata$DateTime,format="%d/%m/%Y %H:%M:%S")

## Create Plot 1 ##
# a histogram of Global Active Power
png(filename="plot1.png",width=480,height=480)
hist(subdata$Global_active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()