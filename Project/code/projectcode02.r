setwd("~/Desktop/Evolution/Tasks/Project/data")
Data <- read.csv("ImsaOtoData_2.csv")
names(Data)
Data$length
Data$weight
New_Data <- subset(Data, select = c(year, length, weight))
New_Data$length
New_Data <- subset(New_Data, complete.cases(New_Data$year, New_Data$length, New_Data$weight))
New_Data$length
New_Data$weight
New_Data$year
New_Data$year <- factor(New_Data$year, levels = c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016))
eel_test <- brm(bf(length ~ (1 | year), sigma ~ (1 | year)),
    data = New_Data, family = gaussian())
eel_test
plot(eel_test)
weight_test <- brm(bf(weight ~ (1 | year), sigma ~ (1 | year)),
                   data = New_Data, family = gaussian())
weight_test
plot(weight_test)
LengthEffects <- ranef(eel_test)
WeightEffects <- ranef(weight_test)

# bayesplot & stanplot packages for pretty plots.
# you care about the random effect
plot(c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016), LengthEffects$year[,1,1], type="b")
plot(c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016), WeightEffects$year[,1,1], type="b")


MakeCurve <- function(BR){
  z <- summary(BR)
  Sig <- z$fixed[2,1]
  SigSig <- z$fixed[2,2]
  Mu <- z$fixed[1,1]
  MuSig <- z$fixed[1,2]
  x <- ranef(BR)
  Mus <- c()
  Sigs <- c()
  for (i in 1:nrow(x$year)){
    Mus[i] <- rnorm(1, Mu, MuSig^2) + rnorm(1, x$year[i,1,1], x$year[i,2,1]^2)
    Sigs[i] <- rnorm(1, Sig, SigSig^2) + rnorm(1, x$year[i,1,2], x$year[i,2,2]^2)
  }
  return(cbind(Mus, Sigs))
}

Convert <- 1:8
names(Convert) <- c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016)
COL <- 'red'
Buffer <- 0.25
par(las=1)
ExF <- 1e2
plot(1, 1, type="n", xlim=range(New_Data$weight), ylim=c(0.5,8.5), yaxt="n", xlab="Weight (g)", ylab="Year", main ="Weight of Eels by Year")
axis(2, at=1:8, label=c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016))
points(New_Data$weight, Convert[as.character(New_Data$year)], pch=21, bg="lightblue")

Mu <- fixef(weight_test)[1,1] + ranef(weight_test)$year[,1,1]
Sig <- (fixef(weight_test)[2,1] + ranef(weight_test)$year[,1,2])^2
Sig <- Sig*3
for (i in 1:8){
  segments(Mu[i]-Sig[i], i+Buffer, Mu[i]+Sig[i], i+Buffer, col=COL, lwd=2)
}
points(Mu, (1:8)+Buffer, pch=21, bg=COL, cex=2)

#####
Nrep <- 100
Range <- seq(from=min(New_Data$weight), to=max(New_Data$weight), length.out=101)
ExF <- 1e200
for (i in 1:Nrep){
  Curves <- MakeCurve(weight_test)
  for (j in 1:8){
    z <- dnorm(Range, mean=Curves[j,1], sd=Curves[j,2]^2)
    lines(Range, rep(j, length(Range))+z*ExF, col=rgb(0,0,0,0.01))
  }
}

MakeCurve2 <- function(BR){
  z2 <- summary(BR)
  Sig2 <- z2$fixed[2,1]
  SigSig2 <- z2$fixed[2,2]
  Mu2 <- z2$fixed[1,1]
  MuSig2 <- z2$fixed[1,2]
  x2 <- ranef(BR)
  Mus2 <- c()
  Sigs2 <- c()
  for (i in 1:nrow(x$year)){
    Mus2[i] <- rnorm(1, Mu2, MuSig2^2) + rnorm(1, x2$year[i,1,1], x2$year[i,2,1]^2)
    Sigs2[i] <- rnorm(1, Sig2, SigSig2^2) + rnorm(1, x2$year[i,1,2], x2$year[i,2,2]^2)
  }
  return(cbind(Mus2, Sigs2))
}

Convert2 <- 1:8
names(Convert2) <- c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016)
COL2 <- 'red'
Buffer2 <- 0.25
par(las=1)
ExF2 <- 1e2
plot(1, 1, type="n", xlim=range(New_Data$length), ylim=c(0.5,8.5), yaxt="n", xlab="Length (mm)", ylab="Year", main ="Length of Eels by Year")
axis(2, at=1:8, label=c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016))
points(New_Data$length, Convert[as.character(New_Data$year)], pch=21, bg="lightblue")

Mu2 <- fixef(eel_test)[1,1] + ranef(eel_test)$year[,1,1]
Sig2 <- (fixef(eel_test)[2,1] + ranef(eel_test)$year[,1,2])^2
Sig2 <- Sig2*3
for (i in 1:8){
  segments(Mu2[i]-Sig2[i], i+Buffer2, Mu2[i]+Sig2[i], i+Buffer2, col=COL2, lwd=2)
}
points(Mu2, (1:8)+Buffer2, pch=21, bg=COL2, cex=2)

#####
Nrep2 <- 100
Range2 <- seq(from=min(New_Data$length), to=max(New_Data$length), length.out=101)
ExF2 <- 1e200
for (i in 1:Nrep2){
  Curves2 <- MakeCurve(eel_test)
  for (j in 1:8){
    z2 <- dnorm(Range2, mean=Curves2[j,1], sd=Curves2[j,2]^2)
    lines(Range2, rep(j, length(Range2))+z2*ExF2, col=rgb(0,0,0,0.01))
  }
}
?brm
