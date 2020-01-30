EPI_data <- read.csv("C:/da/lab1/2010EPI_data.csv",skip = 1)
#or
#install.packages("xlsx")
#library(xlsx)
#EPI_data <- read.xlsx("C:/da/lab1/2010EPI_data.xlsx")
# Note: replace default data frame name – cannot start with numbers!
View(EPI_data)
attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
EPI <- EPI[!tf] # filters out NA values, new array
summary(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30., 95., 1.0), prob = TRUE )
lines(density(EPI, na.rm = TRUE, bw = 1. ) )
rug(EPI)
plot(ecdf(EPI),do.points=FALSE,verticals = TRUE)
par(pty= "s" )
qqnorm(EPI)
qqline(EPI)
x <-  seq(30,95,1)
qqplot(qt(ppoints(250),df = 5 ), x, xlab = "Q-Q plot for t dsn" )
qqline(x)
DALY
df <- is.na(DALY)
DALY <- DALY[!df]
summary(DALY)
fivenum(DALY)
stem(DALY)
hist(DALY)
hist(DALY,seq(0., 100., 1.0), prob = TRUE )
lines( density(DALY, na.rm = TRUE, bw = 1.) )
rug(DALY)
plot(ecdf(DALY),do.points=FALSE,verticals = TRUE)
par(pty= "s" )
qqnorm(DALY)
qqline(DALY)

boxplot(EPI, DALY)
qqplot( EPI, DALY )

EPILand <- EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
hist(Eland, seq(30.,95., 1.0 ), prob = TRUE )
lines( density(Eland, na.rm = TRUE, bw = 1.))
rug(Eland)
plot( ecdf(Eland), do.points = FALSE, verticals = TRUE )
par(pty= "s" )
qqnorm(Eland)
qqline(Eland)

boxplot( EPI, DALY, Eland)

EPI_no_surface_water <- EPI[!No_surface_water]
EPI_no_surface_water <- EPI_no_surface_water[!is.na(EPI_no_surface_water)]
hist(EPI_no_surface_water)
hist(EPI_no_surface_water, seq(30.,100., 1.0 ), prob = TRUE )
lines( density(EPI_no_surface_water, na.rm = TRUE, bw = 1.))
rug(EPI_no_surface_water)
plot( ecdf(EPI_no_surface_water), do.points = FALSE, verticals = TRUE )
par(pty= "s" )
qqnorm(EPI_no_surface_water)
qqline(EPI_no_surface_water)

boxplot( EPI, DALY, Eland, EPI_no_surface_water)

EPI_desert<- EPI[!Desert]
EPI_desert <- EPI_desert[!is.na(EPI_desert)]
hist(EPI_desert)
hist(EPI_desert, seq(30.,100., 1.0 ), prob = TRUE )
lines( density(EPI_desert, na.rm = TRUE, bw = 1.))
rug(EPI_desert)
plot( ecdf(EPI_desert), do.points = FALSE, verticals = TRUE )
par(pty= "s" )
qqnorm(EPI_desert)
qqline(EPI_desert)

boxplot( EPI, DALY, Eland, EPI_no_surface_water, EPI_desert)

EPI_pop <- EPI[!High_Population_Density]
EPI_pop <- EPI_pop[!is.na(EPI_pop)]
hist(EPI_pop)
hist(EPI_pop, seq(30.,100., 1.0 ), prob = TRUE )
lines( density(EPI_pop, na.rm = TRUE, bw = 1.))
rug(EPI_pop)
plot( ecdf(EPI_pop), do.points = FALSE, verticals = TRUE )
par(pty= "s" )
qqnorm(EPI_pop)
qqline(EPI_pop)

boxplot( EPI, DALY, Eland, EPI_no_surface_water, EPI_desert, EPI_pop)

#other data
GRUMP_data <- read.csv("C:\da\lab1/GPW3_GRUMP_SummaryInformation_2010.csv")

