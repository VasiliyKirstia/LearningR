data("iris")
head(iris)
tail(iris)
iris
summary(iris)
by(iris, iris$Species, summary)
by(iris, iris$Species, function(x) lm(Sepal.Length ~ Sepal.Width, data = x))
