(x <- scan())

wd <- getwd()
dir()
setwd("/tmp")
dir()
setwd(wd)
dir()

data <- read.table(file.choose(), header = TRUE)
data <- read.table(file.choose(), header = TRUE, as.is = TRUE) #without converting to factors
#data <- read.table("http://web.site.ru/data.csv", header = TRUE) get data from web

data <- scan(file.choose(), skip = 1, what = as.list(c(character(1), numeric(1), numeric(1))))
str(data)

lines <- readLines("/tmp/r_data")
data <- strsplit(lines, " ")
unld <- unlist(data)[c(-1,-2)]
data <- matrix(unld, ncol=3, byrow=TRUE)
data <- as.data.frame(data)