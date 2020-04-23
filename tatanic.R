rm(list = ls())
library(rpart)
library(rpart.plot)
library(ggplot2)

#install.packages("titanic")
dim(Titanic)
View(Titanic)

data_titanic <- Titanic
rpart1 <-rpart(Survived~ ., data = data_titanic, method = "anova")
rpart.plot(rpart1, branch=1, branch.type=3, type=1, 
           shadow.col="gray", box.col="green",  
           border.col="blue", split.col="red",fallen.leaves = TRUE)

require(C50)

set.seed(9000)
titanic_1 <- as.data.frame(Titanic)
titanic_2 <- runif(nrow(titanic_1))
titanic_3 <- titanic_1[order(titanic_2),]
classification_titanic <- C5.0(titanic_3[1:30,-4],titanic_3[1:30,4])
classification_titanic
summary(classification_titanic)
p <-predict(classification_titanic,titanic_3[31:32,])
p

plot(classification_titanic)

library("e1071")

titanic_1 <- as.data.frame(Titanic)
classification_titanic <- naiveBayes(titanic_1[,1:3], titanic_1[,4])
table( predict(classification_titanic, titanic_1[,-4]), titanic_1[,4], dnn = list('predict', 'real'))
plot( function(x) dnorm(x,1.382, 0.1234983), 0, 8, col = "red" )
curve(dnorm(x, 4.323, 0.4343322), add=TRUE, col="blue")
curve(dnorm(x, 5.232, 0.5432223 ), add=TRUE, col = "green")

library(randomForest)
titanic_1 <- as.data.frame(Titanic)
set.seed(50)
tmp <- sample(nrow(titanic_1), 0.8*nrow(titanic_1), replace = FALSE)
trainset <- titanic_1[tmp,]
vaildset <- titanic_1[-tmp,]

m1 <- randomForest(Survived~., data = trainset, importance = TRUE )
m1
m2 <- randomForest(Survived~., data = trainset, ntree = 500, mtry = 6, importance = TRUE)
m2

predict.train <- predict( m2, trainset, type = "class")
table(predict.train, trainset$Survived)

predict.valid <- predict(m2, vaildset, type = "class")
table(predict.valid, vaildset$Survived)

library(party)
cluster_titanic<-ctree(Survived~.,data=titanic_1)
cluster_titanic
plot(cluster_titanic)

out.dist = dist( titanic_1[4:5], method = "euclidean")
out.hclust = hclust( out.dist, method = "complete")
plclust(out.hclust)
rect.hclust(out.hclust, k = 3)
out.id = cutree(out.hclust, k = 3 )
out.id
table(out.id)
