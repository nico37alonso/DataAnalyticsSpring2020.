multivariate <- read.csv("C:/da/lab2/multivariate.csv")
attach(multivariate)
multivariate
mm <- lm(Homeowners~Immigrant)
mm
summary(mm)$coef
coefficients(mm)
plot(Homeowners~Immigrant)
abline(mm)
abline(mm, col = 2, lwd = 3)
newImmigrantdata <- data.frame(Immigrant = c(0,20))
mm %>% predict(newImmigrantdata)
abline(mm)
abline(mm, col = 3, lwd = 3)
attributes(mm)
mm$coefficients
