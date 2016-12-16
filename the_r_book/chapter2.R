x <- sqrt(2)
identical(x^2, 2)
all.equal(x^2, 2)
rm(list = ls())

x <- c(1, 2, 3)
y <- c(1, 2, 3)
x %o% y
x %*% y
rm(list = ls())

x <- matrix(c(1, 2, 3, 4), nrow = 2)
y <- matrix(c(1, 2, 3, 4), ncol = 2)
x %o% y
x %*% y
rm(list = ls())

x <- c(NA, TRUE, FALSE)
names(x) <- c("NA", "TRUE", "FALSE")
outer(x, x, "&")
outer(x, x, "|")
rm(list = ls())

(t5 <- letters[1:5])
factor(1 + (t5 == "b") + (t5 == "c")*2 + (t5 == "d")*2)

seq(from=0, by=10, along= c(3,3,4,5))
seq(from=0, by=10, to=50)
seq(from=0, by=10, length=3)

rep(1:5, c(1,5,0,0,2))
rep(1:5, times=2)
rep(1:5, each=2)
rep(1:5, each=2, times=2)
rep(c("cats", "pig", "dog"), each=2, times=2)
rep(c(FALSE, NA), each=2, times=2)

gl(2,3,14, labels = c("F", "C"))
gl(5,1,20, labels = c("A", "B", "C", "D", "F"))
gl(5,1,20, labels = c("A", "B", "C", "D"))

which(rep(c(TRUE, FALSE), times=3, each=2))

x <- rnorm(100, mean = 70, sd=15)
mean(x)
sum(x < mean(x))
rm(list = ls())

x <- rnorm(10000000, 0, 100)
sum(rev(sort(x))[1:3])
which(x == max(x))
which.max(x)
which(x == pmax(x))

range(x)
median(x)
quantile(x)
fivenum(x)
var(x)
rank(x)
cummin(x)
table(x)
rm(list = ls())

dummy_data = data.frame(
  temp = rnorm(10000, 10, 50),
  weat = runif(10000,740, 790),
  month = sample(month.name, 10000, replace = TRUE),
  year = sample(2000:2016, 10000, replace = TRUE))
with(dummy_data, tapply(temp, month, mean))
with(dummy_data, tapply(temp, list(year, month), mean)[,1:6])
with(dummy_data, tapply(temp, year, mean, trim=0.1))

aggregate(temp ~ month, dummy_data, mean)
aggregate(temp ~ month + year, dummy_data, mean)
aggregate(temp + weat ~ month, dummy_data, mean)
aggregate(cbind(temp,weat) ~ month, dummy_data, mean)
aggregate(cbind(temp,weat) ~ month + year, dummy_data, mean)

aggregate(temp ~ month:year, dummy_data, mean)
aggregate(temp ~ month*year, dummy_data, mean)
rm(list=ls())

xv <- rnorm(10000, mean=100, sd=100)
closest <- function(x, value){
  x[which(abs(x-value) == min(abs(x-value)))]
}
closest(xv, 108)
rm(list = ls())

x <- data.frame(
  weight = sample(50:100, 50, replace = TRUE), 
  gender=sample(c("M", "F"), 50, replace = TRUE))
x$gender[order(x$weight)]
x
sort(x$weight)
x

duplicated(x$gender)
unique(x$gender)
mean( x$weight[!duplicated(x$gender)] )
rm(list=ls())

x <- rpois(1000, 0.7)
r_l_e <- rle(x)
max(r_l_e$lengths)
r_l_e$values[which(r_l_e$lengths == max(r_l_e$lengths))]
rm(list = ls())

setA <- c("a", "b", "c", "d")
setB <- c("c", "d", "e", "f")
intersect(setA, setB)
union(setA, setB)
setdiff(setA, setB)
setdiff(setB, setA)
setA %in% setB
setA %in% setA
setA[setA %in% setB]
rm(list = ls())


(v <- 1:24)
dim(v)
dim(v) <- c(3,4,2)
v
dim(v) <- c(2,3,4)
v
dim(v) <- c(24,1)
v
(v <- as.numeric(v))
m <- matrix(v, nrow = 6, byrow = TRUE)
matrix(v, nrow = 4)
matrix(v, nrow = 2, ncol = 3, byrow = TRUE)
m[,3]
m[3,]
m[3] #непонятная фигня
class(m)
attributes(m)
t(m)
rm(list = ls())

X <- matrix(rpois(20, 1.5), nrow = 4)
X
rownames(X) <- rownames(X, do.NULL = FALSE, prefix = "Trial.")
X
colnames(X) <- c("aspirin", "paracetamol", "nurofen", "hedex", "placebo")
X
dimnames(X) <- list(NULL,paste("drug.",1:5,sep=""))
X
rm(list = ls())

X <- matrix(rpois(20, 1.5), nrow = 4)
mean(X[,5])
var(X[1,])
colSums(X)
rowSums(X)
rowsum(X, c("A", "B", "B", "A"))
apply(X, 2, min)
apply(X, 1, max)
row(X)
col(X)
apply(X,2,sample)
apply(X,2,sample)

X <- cbind(X, apply(X, 1, sd))
X <- rbind(X, apply(X, 2, mean))
rownames(X) <- c(1:4, "mean")
colnames(X) <- c(1:5, "sd")
X[,"sd"]
X["mean",]
X[,"sd", drop=FALSE]
X["mean",,drop=FALSE]

X <- matrix(rpois(20, 3), nrow = 4)
X <- sweep(X, 2, apply(X, 2, mean), "-")
apply(X, 2, mean)
rm(list = ls())

(X <- matrix(1:24,nrow=4))
apply(X,1,sum)
apply(X,2,sum)
apply(X,1,sqrt)
apply(X,2,sqrt)
apply(X,1,sample)
apply(X,2,sample)
sapply(1:3,seq)

X <- matrix(rnorm(50, 25, 10), ncol = 5)
max.col(X)
max.col(-X)
table(max.col(X))
rm(list = ls())

(data <- array(1:24, 2:4))
dimnames(data)[[1]] <- list("male", "famale")
dimnames(data)[[2]] <- list("yang", "mid", "old")
dimnames(data)[[3]] <- list("A", "B", "C", "D")
dimnames(data)
data
aperm(data,c(2,3,1))
aperm(data,c(1,3,2))
aperm(data,c(3,2,1))

set.seed(100)
runif(5)
runif(5)
runif(5)
set.seed(100)
runif(5)
runif(5)
runif(5)

x <- seq(10)
sample(x)
sample(x, replace = TRUE)
sample(x, replace = TRUE, prob = rnorm(10, 100, 10))
sample(x, 5)
sample(x, 5, replace = TRUE)
sample(x, 5, replace = TRUE, prob = seq(1,10,1))
rm(list = ls())

#loops and repeats
fac1 <- function(x){
  cum <- 1
  for(i in 1:x){
    cum <- cum*i
  }
  return(cum)
}
sapply(1:5, fac1)

fac2 <- function(x){
  i <- 1
  cum <- 1
  while(i <= x){
    cum <- cum * i
    i <- i + 1
  }
  return(cum)
}
sapply(1:5, fac2)

fac3 <- function(x){
  i <- 1
  cum <- 1
  repeat{
    if(i > x){
      return(cum)
    }
    cum <- cum * i
    i <- i + 1
  }
}
sapply(1:5, fac3)

cumprod(1:5)
cumprod(0:5)

fac4 <- function(x){
  return(max(cumprod(1:x)))
}
sapply(1:5, fac4)
fac4(0)

sapply(1:5, factorial)

#binary representation of a number
binary <- function(x){
  string <- rep(0, times=32)
  i <- 0
  while(x>0){
    string[32 - i] <- x %% 2
    x <- x %/% 2
    i <- i+1
  }
  return(string[ match(1, string):32 ])
}
sapply(15:17, binary)

#fibonacci series
fibonacci <- function(n) {
  a <- 1
  b <- 0
  while(n>0){
    swap <- a
    a <- a+b
    b <- swap
    n <- n-1 
  }
  b 
}
sapply(1:10, fibonacci)

#loop avoidance
x <- rnorm(20)
ifelse(x<median(x), "small", "big")
ifelse(x<0, NA, x)

#the slowness of loops
x<- runif(10^6,0,1000)
system.time(max(x))

pt <- proc.time()
cmax <- x[1]
for (i in 2:10^6) {
  if(x[i]>cmax) cmax <- x[i] 
}
proc.time() - pt

#loops for producting time series
N <- numeric(20)
N[1] <- 0.6
lambda <- 2.8
for(t in 2:20) N[t] <- lambda * N[t-1] * (1 - N[t-1])
plot(N, type = "l")
rm(list = ls())

#lists and lapply
l <- list(first=1:10, second=c(TRUE, FALSE, TRUE, FALSE), third=c("o", "b"))
l[[1]]
l[[1]][8]
l[1][1]
l$first
lapply(l, length)
lapply(l, mean)
summary(l)
str(l)

#saving lists
data <- data.frame(
  A=sample(0:1, 10, replace = TRUE), 
  B=sample(0:1,10, replace = TRUE), 
  C=sample(0:1,10, replace = TRUE),
  D=sample(0:1,10, replace = TRUE))
rownames(data) <- 1:10
data
sletters <- sapply(1:10, function(i) colnames(data)[data[i,]>0])
snumbers <- sapply(1:4, function(j) rownames(data)[data[,j]>0])
sletters
snumbers
newframe <- stack(data)
newframe<-data.frame(newframe, rep(rownames(data),4))
colnames(newframe) <- c("value", "letter", "number")
newframe
write.table(newframe, file = "/tmp/rdataframe.txt", sep = " ")
rm(list = ls())

#strings and character vectors
a <- "cat"
b <- "dog"
length(a)
nchar(a)
d <- c(a, b)
length(d)
nchar(d)
print(d)
noquote(d)
is.factor(d)
is.character(d)
as.numeric(c("123", "124"))
LETTERS
letters
which(letters == "n")

paste("a", "b", "c", sep = "")
paste("a", "b", "c")
paste(" a ", " b ", " c ", sep = "")
paste(c("a", "b"), c("c", "d"), c("e", "f"), sep = " ")

phrase <- "the quick brown fox jumps over the lazy dog"
q <- character(20)
for (i in 1:20) q[i] <- substr(phrase,1,i)
q

nchar(phrase)
strsplit(phrase, "")
strsplit(phrase, " ")
strsplit(phrase, "the")
table(strsplit(phrase, ""))
paste(lapply(strsplit(phrase, ""), rev)[[1]], collapse = "")
nchar(strsplit(phrase,"the")[[1]] [2])

toupper(letters)
tolower(LETTERS)

a <- 1:50
b <- 40:70
res <- match(b, a)
variable <- ifelse(is.na(res), 0, res)
variable

random.string <- sapply(1:100, function(i) paste(sample(letters, 10, replace = TRUE), collapse=""))
grep("^a", random.string)
random.string[grep("^b", random.string)]
random.string[-grep("[a-w]$", random.string)]
random.string[grep("^.a", random.string)] # a at second position
random.string[grep("^.{5}a", random.string)] # a at sixth position
random.string[grep("^.{,5}a", random.string)] # a at 6th or less positions
random.string[grep("^.{5,}a", random.string)] # a at 6th or more positions
random.string[grep("^.{1,2}a", random.string)] # a at 2nd or 3rd positions
rm(list = ls())

text <- month.name
sub("a", "|a|", text)
gsub("a", "A", text)
gsub("[aA]", "|a|", text)

regexpr("o", text)
freq <- as.vector(unlist (lapply(gregexpr("o",text),length)))
present <- ifelse(regexpr("o",text)<0,0,1)
freq*present

charmatch("m", c("mean", "median", "mode"))
charmatch("med", c("mean", "median", "mode"))

stock <- c("car","van")
requests <- c("truck","suv","van","sports","carrr","waggon","car")
requests %in% stock
which(requests %in% stock)
sapply(requests, "%in%", stock)
which(sapply(requests, "%in%", stock))

text <- c("arm","leg","head", "foot","hand", "hindleg", "elbow")
grep("o{1}",text,value=TRUE)
grep("o{2}",text,value=TRUE)
grep("o{3}",text,value=TRUE)
grep("[[:alnum:]]{4, }",text,value=TRUE)
grep("[[:alnum:]]{5, }",text,value=TRUE)
grep("[[:alnum:]]{6, }",text,value=TRUE)
grep("[[:alnum:]]{7, }",text,value=TRUE)
rm(list = ls())

#dates and times
Sys.time()
as.numeric(Sys.time())
class(Sys.time())
unclass(Sys.time())
time.list <- as.POSIXlt(Sys.time())
unlist(time.list)

dates <- c("15/06/2014", "16/06/2014", "17/06/2014", "18/06/2014")
converted.dates <- strptime(dates, "%d/%m/%Y")
class(converted.dates)
sapply(converted.dates, weekdays)
sapply(1:length(converted.dates), function(i) weekdays(converted.dates[i]))

#difftime
difftime("2014-02-06","2014-07-06")
round(difftime("2014-02-06","2014-07-06"))
y2 <- as.POSIXlt("2015-10-22")
y1 <- as.POSIXlt("2018-10-22")
y1 - y2
as.numeric(y1-y2)
(t1 <- as.difftime("6:14:21"))
(t2 <- as.difftime("5:12:32"))
t1-t2

#sequence of dates
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2015-11-15"), "1 day")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2016-04-05"), "2 weeks")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2018-10-04"), "3 months")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2026-02-04"), "year")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2015-11-05"), 8955)
seq(as.POSIXlt("2015-11-04"), by="month", length=10)
seq(as.POSIXlt("2015-11-04"), by="month", along=runif(15))
weekdays(seq(as.POSIXlt("2015-11-04"), by="month", along=runif(15)))

y <- as.Date(1:100,origin="2015-12-31")
x <- as.POSIXlt(y)
x[x$wday==1]
rm(list = ls())

#regression using dates and times
data <- data.frame(value=exp(13:1 + runif(13, min = 0, max = 2)), #perfect! I like this noise.
                   date=seq(as.POSIXlt("2016-01-01"), by="month", length=13))
with(data, plot(date, value, pch=16, xlab ="month"))
with(data, plot(date, log(value), pch=16, xlab ="month"))
model <- with(data, lm(log(value) ~ date))
abline(model)
summary(model)
rm(list = ls())

#environments
ls(envir = globalenv())
with(OrchardSprays,boxplot(decrease~treatment))

library(MASS)
with(bacteria,tapply((y=="n"),trt,sum))

with(mammals,{
  plot(body,brain)
  model <- lm(body ~ brain)
  abline(model)
})
rm(list=ls())

#writing r functions
arithmetic.mean <- function(x){sum(x)/length(x)}
arithmetic.mean(c(4,4,5,6,6))
mean(c(4,4,5,6,6))

med <- function(x){
  odd.even <- length(x) %% 2
  if(odd.even == 0){
    (sort(x)[length(x) %/% 2] + sort(x)[1 + length(x) %/% 2])/2
  }else{
    sort(x)[ceiling(length(x)/2)]
  }
}
x <- rnorm(20)
y <- rnorm(21)
med(x)
median(x)
med(y)
median(y)

geometric <- function(x){exp(mean(log(x)))}
x<-runif(20, 1, 100)
geometric(x)
geometric(y) #log(0) -> -inf

harmonic <- function(x){1/mean(1/x)}
harmonic(c(1,2,4,1))

#SS = sum(y - mean(y))
#degrees of freedom = n - k, where n is the sample size, k is the number of parameters, estimated from the data
variance <- function(x){sum( (x - mean(x))^2 )/( length(x)-1 )}
x <- seq(1, 10, 0.2)
variance(x)
var(x)

variance.ratio <- function(x,y) {
  v1 <- var(x)
  v2 <- var(y)
  if (var(x) > var(y)){
    vr <- var(x)/var(y)
    df1 <- length(x)-1
    df2 <- length(y)-1
  } else {
    vr <- var(y)/var(x)
    df1 <- length(y)-1
    df2 <- length(x)-1
  }
  2*(1-pf(vr,df1,df2)) 
}
x <- rnorm(20,15, 2)
y <- rnorm(20,15, 4)
variance.ratio(x, y)
var.test(x,y)

se <- function(x) sqrt(var(x)/length(x))
ci95 <- function(x) {
  t.value <- qt(0.975,length(x)-1)
  standard.error <- se(x)
  ci <- t.value*standard.error
  cat("95 Confidence Interval = ", mean(x) -ci, "to ", mean(x) +ci,"\n") 
}
x <- rnorm(150,25,3)
ci95(x)

xv <- rnorm(30)
sem <- numeric(30)
sem[1] <- NA
for(i in 2:30) sem[i] <- se(xv[1:i])
plot(1:30,sem,ylim=c(0,0.8),
     ylab="standard error of mean",xlab="sample size n",pch=16)
lines(2:30,1/sqrt(2:30))

central <- function(y, measure) {
  switch(measure,
         Mean = mean(y),
         Geometric = exp(mean(log(y))),
         Harmonic = 1/mean(1/y),
         Median = median(y),
         stop("Measure not included")) 
}
central(rnorm(100,10,2),"Harmonic")
central(rnorm(100,10,2),4)

func <- function(...){
  arguments <- list(...)
  mean_ <- numeric(length(arguments))
  var_ <- numeric(length(arguments))
  sd_ <- numeric(length(arguments))
  for(i in 1:length(arguments)){
    mean_[i] <- mean(arguments[[i]])
    var_[i] <- var(arguments[[i]])
    sd_[i] <- sd(arguments[[i]])
  }
  return(list(mean=mean_, var=var_))
}
func(rnorm(30), runif(20, 10,50), rpois(20,0.7))

(function(x,y){ z <- 2* x^2 + y^2; x+y+z })(0:7, 1)

plotx2 <- function (x, y = z^2) {
  z <- 1:x
  plot(z,y,type="l") 
}
windows(7,4)
par(mfrow=c(1,2))
plotx2(12)
plotx2(12,1:12)

(y <- seq(0.9,0.3,-0.1))
str(y)
df <- data.frame(x=1:10, y=as.character(rep(1:5, times=2)))
str(df)
