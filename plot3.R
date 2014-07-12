plot3 <- function(){
    
    #read and extract data
    data <- read.table("household_power_consumption.txt", sep = ";")
    names(data) <- sapply(data[1,], as.character)
    data["Date"] <- as.Date(data[,1], format = "%d/%m/%Y")
    data <- data[data["Date"]=="2007-02-01" | data["Date"]=="2007-02-02",]
    data <- data[complete.cases(data),]
    time <- strptime(paste(data[,"Date"],data[,"Time"]),format = "%Y-%m-%d %H:%M:%S")
    data<-data.frame(time,data)
    data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
    data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
    data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
    #now the variable data stores all the data we need
    #start plotting
    library(datasets)
    with(data,plot(data$time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",main=""))
    legend("topright", lwd = 1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    with(data,lines(data$time,data$Sub_metering_3,col="blue",type="l"))
    with(data,lines(data$time,data$Sub_metering_2,col="red",type="l"))
    dev.copy(png, file = "plot3.png")
    dev.off()
}