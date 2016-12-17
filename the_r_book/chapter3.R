(x <- scan())

wd <- getwd()
dir()
setwd("/tmp")
dir()
setwd(wd)
dir()

data <- read.table(file.choose(), header = TRUE)
