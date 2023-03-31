setwd('~/Desktop/Evolution/Tasks/Task_08')
trees <- list()
births <- numeric()
Fractions <- numeric()
?runif
for (i in 1:100) {
  births[i] <- runif(1)
  Fractions[i] <- runif(1)
  trees[[i]] <- pbtree(births[i], births[i] * Fractions[i], n = 100)
}
net_diversification <- births - births * Fractions
log_tips <- sapply(trees, function(x) log(length(x$tip.label)))
plot(x = log_tips, y = net_diversification, xlab = "Log of Total Number of Tips", ylab = "Diversification Rate")
# It appears that the greater the log of the total number of tips, the more potential
# to have a higher diversification rate. If the log was under 3, then the highest
# diversification rate recorded was approximately 0.61. But, if it was greater than 4.5, but less than 5.5, 
# the highest diversification rate recorded was approximately 0.98. More log of tips
# = more chance for in that range. The closer to 4.8 the higher the diversification rate 
# recorded.
branch_avg <- numeric(length(trees))
for (i in seq_along(trees)) {
  tree <- trees[[i]]  
  branch_avg[i] <- mean(cophenetic(tree))  
}
branch_avg
branch_log <- log(branch_avg)
plot(x = births, y = branch_log, xlab = "Speciation Rate", ylab = "Average Branch Length")
# This displays a curvilinear relationship between branch length and speciation rate.
# specifically, branch length appears to decrease as speciation rate increases.
correlation <- cor(births, branch_avg)
correlation
# -0.22 which aligns with the graph
largest_tree <- which.max(sapply(trees, function(x) length(x$tip.label)))
largest_tree
Tree <- trees[[largest_tree]]
Tree
plot(Tree, show.tip.label = FALSE)
rates <- numeric()
traits <- list()
for (i in 1:100) {
  rates[i] <- runif(1)
  traits[[i]] <- fastBM(tree = Tree, sig2 = rates[i])
}
rates
traits
t_means <- lapply(traits, mean)
t_means1 <- as.numeric(t_means)
trait_correlation <- cor(t_means1, rates)
trait_correlation
plot(x = t_means1, y = rates)
# It appears that rate at which new traits are formed increases and spreads out the
# greater or more negative t_mean is from 0. 
t_var <- sapply(traits, var)
cor(t_var, rates)
plot(t_var, rates)
# Very strong positive correlation initially and traits variance becomes more spread out the greater the
# rate is.
f_cor <- cor(traits[[1]], traits[[2]])
traitMat <- cbind(traits[[1]], traits[[2]])
traitMat
plot(traitMat)
phylomorphospace(Tree, traitMat, xlab = "Trait 1", ylab = "Trait 2")
