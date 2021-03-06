plot2 <- function(){
    
    #read and extract data
    data <- read.table("household_power_consumption.txt", sep = ";")
    names(data) <- sapply(data[1,], as.character)
    data["Date"] <- as.Date(data[,1], format = "%d/%m/%Y")
    data <- data[data["Date"]=="2007-02-01" | data["Date"]=="2007-02-02",]
    data <- data[complete.cases(data),]
    time <- strptime(paste(data[,"Date"],data[,"Time"]),format = "%Y-%m-%d %H:%M:%S")
    data<-data.frame(time,data)
    #now the variable data stores all the data we need
    #start plotting
    library(datasets)
    with(data,plot(data$time,as.numeric(as.character(data$Global_active_power)),main = "", xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
    dev.copy(png, file = "plot2.png")
    dev.off()
}