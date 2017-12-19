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
png(filename="plot2.png",width=480, height= 480)

## making a line plot using type=l withthe plot function
plot(a1$Global_active_power, a1$dtime, type="l", main = "Global Active Power",ylab = "Global Active Power(kw)",xlab="")
dev.off()