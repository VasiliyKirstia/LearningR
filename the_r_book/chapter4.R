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