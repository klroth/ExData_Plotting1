## This R code downloads the Project 1 data and creates a png file containing a line graph of
## sub metering values by time for the three types of sub metering for 2007-02-01 and 2007-02-02 




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

## Create Plot 3 ##
png(filename="plot3.png",width=480,height=480)
plot(subdata$DateTime,subdata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(subdata$DateTime,subdata$Sub_metering_2,col="red")
lines(subdata$DateTime,subdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()