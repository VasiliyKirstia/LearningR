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
