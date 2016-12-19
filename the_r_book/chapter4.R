data("iris")
head(iris)
tail(iris)
iris
summary(iris)
by(iris, iris$Species, summary)
by(iris, iris$Species, function(x) lm(Sepal.Length ~ Sepal.Width, data = x))

#subscripts
iris[2,3]
iris[1:15,3:4]
class(iris[2,])
class(iris[,2])
iris[iris$Species=="virginica",]
iris[iris$Species=="virginica",c(1,3)]

iris[sample(1:nrow(iris), 5),]
iris[order(iris$Petal.Length),]
iris[rev(order(iris$Petal.Length)),]
iris[order(iris$Species, iris$Petal.Length),]
iris[order(iris$Species, iris$Petal.Length, iris$Petal.Width), 
     c("Species", "Petal.Length", "Petal.Width")]

with(iris, 
     iris[Sepal.Length > mean(Sepal.Length) & Sepal.Width > mean(Sepal.Width), 
     sapply(iris, is.numeric)])
iris[-(1:100),]

#the same--------
iris[!(iris$Sepal.Length > median(iris$Sepal.Length)),]
iris[ -which(iris$Sepal.Length > median(iris$Sepal.Length)),]
#-----------------

data("obama_vs_mccain", package = "learningr")
(ovm_vna <- na.omit(obama_vs_mccain))
apply(apply(obama_vs_mccain, 2, is.na), 2, sum)
obama_vs_mccain[is.na(obama_vs_mccain)] <- 0

new_iris <- iris[rev(order(iris$Sepal.Length)),]
new_iris[!duplicated(iris$Species),] 

iris[order(iris$Species, -iris$Sepal.Length, -iris$Sepal.Width), ]
rank(iris$Species)
iris[order(-rank(iris$Species), iris$Sepal.Length), ]

colnames(iris)
grep("S", colnames(iris))
iris[,grep("S", colnames(iris))]

y <- rpois(1500, 1.5)
table(y)
short <- as.data.frame(table(y))
index<-rep(1:8,short$Freq)
length(index)
hist(index, -0.5:8.5)
long <- short[index,]
head(long)
tail(long, 20)
