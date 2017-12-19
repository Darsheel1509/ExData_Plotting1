## first we need to convert the data into a proper format so that other functions can be applied
a<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##conversion to proper date format in R
a$Date<-as.Date(a$Date, format = "%d/%m/%Y")

## subsetting for 2 dates

a1<-subset(a,Date>=as.date("2007-2-1") & Date <=as.date("2007-2-2"))

## intializing png graphic device and setting dimensions and filename
png(filename="plot1.png",width=480, height= 480)

## hist function for plotting global active power and turning graphic device off
hist(a1$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power(kw)",ylab = "frequency")
dev.off()