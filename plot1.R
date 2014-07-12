plot1 <- function(){
    
    #read and extract data
    data <- read.table("household_power_consumption.txt", sep = ";")
    names(data) <- sapply(data[1,], as.character)
    data["Date"] <- as.Date(data[,1], format = "%d/%m/%Y")
    data <- data[data["Date"]=="2007-02-01" | data["Date"]=="2007-02-02",]
    data <- data[complete.cases(data),]
    
    #View(data)
    
    #now the variable data stores all the data we need
    #start plotting
    library(datasets)
    with(data,hist(as.numeric(as.character(data$Global_active_power)),main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
    dev.copy(png, file = "plot1.png")
    dev.off()
}
