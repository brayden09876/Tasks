5
A <- 5
A*2
B <- c(A,5,5)
B
B*2
'B'*2
B <- c(A,5,5)
B*2
C <- c(B,6,10)
C*6
D <- c(1,5,10,15,20)
sum(D)
mean(D)
min(D)
E <- c(6,7,8,9,10)
which(E == 8)
which(E>8)
E[which(E>8)]
trueMean1 <- 5
trueSD1 <- 5
population1 <- rnorm(1e6, trueMean1, trueSD1)
trueMean2 <- 4
trueSD2 <- 5
population2 <- rnorm(1e6, trueMean2, trueSD2)
Size <- 50
Sample1 <- sample(population1, Size)
Sample2 <- sample(population2, Size)
boxplot(Sample1, Sample2)
population1
population2
Sample1
Sample2
individual1 <- c("B", "A")
individual2 <- c("A", "A")
Gam1 <- sample(individual1, 1)
Gam2 <- sample(individual2, 1)
newBaby <- c(Gam1, Gam2)
newBaby
isHet <- c()
for (i in 1:100) {
  Gam1 <- sample(individual1, 1)
  Gam2 <- sample(individual2, 1)
  newBaby <- c(Gam1, Gam2)
  isHet[i] <- Gam1 == Gam2
}
sum(isHet)/length(isHet)
source("http://jonsmitchell.com/code/simFxn04.R")
MatGrandma <- makeFounder("grandma_mom")
MatGrandpa <- makeFounder("grandpa_mom")
PatGrandma <- makeFounder("grandma_da")
PatGrandpa <- makeFounder("grandpa_da")
MatGrandma
Alan <- makeBaby(PatGrandma, PatGrandpa)
Alan
Brenda <- makeBaby(MatGrandma, MatGrandpa)
Brenda
Focus <- makeBaby(Brenda, Alan)
ToMom <- length(grep("mom", Focus))/length(Focus)
ToMom
ToMomMom <- length(grep("grandma_mom", Focus))/length(Focus)
ToMomMom
ToMomDad <- length(grep("grandpa_mom", Focus))/length(Focus)
ToMomDad
ToDadMom <- length(grep("grandma_da", Focus))/length(Focus)
ToDadMom
ToDadDad <- length(grep("grandpa_da", Focus))/length(Focus)
ToDadDad
Sibling_01 <- makeBaby(Brenda, Alan)
ToSib <- length(intersect(Focus, Sibling_01))/length(Focus)
ToSib
ManySiblings <- replicate(1e3, length(intersect(Focus, makeBaby(Brenda, Alan)))/length(Focus))
ManySiblings
quantile(ManySiblings)
mean(ManySiblings)
boxplot(ManySiblings)
hist(ManySiblings, xlim=c(0,1), xaxp=c(0,1,10), xlab="Allele Frequency", ylab = "Frequency", main="Relation of Focus to Siblings", ylim = c(0,250), yaxp=c(0,250,9))
# we see a range of values due to the fact that Focus will only share a certain amount of alleles with its other siblings.
# The plot shows a bell graph distribution which is what we would expect if they actually had 1000 siblings.
