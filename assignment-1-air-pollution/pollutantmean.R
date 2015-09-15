directory <- list.files()
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    a <- list.files(directory,full.names = TRUE)
    data <- as.numeric()
    for (i in id) {
        data <- c(data, read.csv(a[i]) [, pollutant])
    }
    mean(data, na.rm = TRUE)
 }