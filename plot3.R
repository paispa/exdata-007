file<-"C:\\A511400\\datascience\\downloads\\exdata-data-household_power_consumption\\household_power_consumption.txt"
elec_data<-read.table(file, sep=";",header=TRUE,na.strings="?")
library(dplyr)
elecData<-tbl_df(elec_data)
new_elecData<-mutate(elecData,date=as.Date(Date,"%d/%m/%Y"),active_pwr=Global_active_power,reactive_pwr=Global_reactive_power,volt=Voltage,gintensity=Global_intensity,meter_1=Sub_metering_1,meter_2=Sub_metering_2,meter_3=Sub_metering_3)
rm(elec_data)
rm(elecData)
data<-select(filter(new_elecData,date=="2007-02-01" | date=="2007-02-02"),Time,active_pwr,reactive_pwr,volt,gintensity,meter_1,meter_2,meter_3,date,Date)
rm(new_elecData)

png("C:\\A511400\\Git-Hub\\datasciencecoursera\\exData-007\\plot3.png")
plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S"),data$meter_1,type="l",xlab="",ylab="Energy sub metering")
lines(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S"),data$meter_2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S"),data$meter_3,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"))
dev.off()
