file<-"C:\\A511400\\datascience\\downloads\\exdata-data-household_power_consumption\\household_power_consumption.txt"
elec_data<-read.table(file, sep=";",header=TRUE,na.strings="?")
library(dplyr)
elecData<-tbl_df(elec_data)
new_elecData<-mutate(elecData,date=as.Date(Date,"%d/%m/%Y"),active_pwr=Global_active_power,reactive_pwr=Global_reactive_power,volt=Voltage,gintensity=Global_intensity,meter_1=Sub_metering_1,meter_2=Sub_metering_2,meter_3=Sub_metering_3)
rm(elec_data)
rm(elecData)
data<-select(filter(new_elecData,date=="2007-02-01" | date=="2007-02-02"),Time,active_pwr,reactive_pwr,volt,gintensity,meter_1,meter_2,meter_3,date,Date)
rm(new_elecData)

png("C:\\A511400\\Git-Hub\\datasciencecoursera\\exData-007\\plot2.png")
plot(strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S"),data$active_pwr,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
