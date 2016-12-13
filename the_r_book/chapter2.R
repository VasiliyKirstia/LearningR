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


