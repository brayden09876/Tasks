setwd('~/Desktop/Evolution/Tasks/Task_10')
x <- rnorm(n = 100, mean = 0, sd = 2)
x
y <- x*5+2+runif(100, min = 0, max = 0.1)
y
linmodel <- lm(y~x)
plot(linmodel)
slope <- vector("numeric", 100)
intercept <- vector("numeric", 100)
z <- vector("numeric", 100)
for (i in 1:100) {
  x <- rnorm(100, mean = 0, sd = 2)
  z[i] <- runif(1, min = 0.5, max = 2)
  y <- x*5+2+runif(100, min = 0, max = 0.1)
  linearmodel <- lm(y~x)
  intercept[i] <- coef(linearmodel)[1]*z[i]+2
  slope[i] <- coef(linearmodel)[2]*z[i]
}
plot(z, slope, xlab = "Z Estimated Slope")
abline(lm(slope~z), col = "red")
n <- 10000
prize <- sample(c("1", "2", "3"), size = n, replace = TRUE)
opened_door <- ifelse(prize == "1", sample(c("2", "3"), size = n, replace = TRUE), ifelse(prize == "2", "3", "2"))
closed_door <- ifelse(opened_door == "2", "3", "2")
same_door <- sum(prize =="1")/n
diff_door <- sum(prize == closed_door)/n
win_frequency <- c(same_door, diff_door)
barplot(win_frequency, names.arg = c("Same Door", "Different Door"), ylab ="Frequency of Wins (10,000 Runs)", ylim = c(0, 0.8), main = "Chance of Winning the Grand Prize", col = "lightpink")
t <- "https://listverse.com/wp-content/uploads/2009/01/obama-smoking-tm.jpg"
meme(t, "", "Me looking at Dr. Mitchell after a rough exam", size = 1.5)
