## first we need to convert the data into a proper format so that other functions can be applied
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##conversion to proper date format in R
a$Date<-as.Date(a$Date, format = "%d/%m/%Y")

## subsetting for 2 dates

a1<-subset(a,Date>=as.date("2007-2-1") & Date <=as.date("2007-2-2"))

## Appending date and time column and making datetime column
dtime<-paste(a1$Date, a1$Time ,sep=" ")

##set thename of the vector
dtime<- setNames(dtime, "DateTime")

## append it to the a1 table
a1<- cbind(a1,dtime)

##conversion of dtime to posixct format
a1$dtime<-as.POSIXct(dtime)

## intializing png graphic device and setting dimensions and filename
png(filename="plot4.png",width=480, height= 480)

## using mfrow function to stack all the plots together
par(mfrow=c(2,2))
plot(a1$Global_active_power~a1$dtime, type="l",ylab = "Global Active Power(kw)",xlab="")

plot(a1$Voltage~a1$dtime,type="l", xlab="datetime",ylab="Voltage")

plot(a1$Sub_metering_1~a1$dtime, type="l",ylab = "Energy Sub_metering",xlab="")
lines(a1$Sub_metering_2~a1$dtime,col="red")
lines(a1$Sub_metering_3~a1$dtime, col="blue")
legend("topright", col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(1,1,1),bty="n")

plot(a1$Global_reactive_power~a1$dtime,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()