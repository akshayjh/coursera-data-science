directory <- list.files()
corr <- function(directory, threshold = 0) {
    a <- list.files(directory, full.names = TRUE)
    dat <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(a)) {
        b <- read.csv(a[i])
        csum <- sum((!is.na(b$sulfate)) & (!is.na(b$nitrate)))
        if (csum > threshold) {
            tmp <- b[which(!is.na(b$sulfate)), ]
            g <- tmp[which(!is.na(tmp$nitrate)), ]
            dat <- c(dat, cor(g$sulfate,g$nitrate))
        }
    }
    
    dat
}