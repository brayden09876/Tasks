setwd('~/Desktop/Evolution/Tasks/Task_07')
text.string <-
  "(((((((cow, pig),whale),(bat,(lemur ,human))), (robin, iguana)), coelacanth),(gold_fish, trout)), shark);"
vert.tree<-read.tree(text=text.string)
plot(vert.tree, edge.width=2)
nodelabels(frame="circle", bg='white', cex=1)
dev.off()

vert.tree
str(vert.tree)
tree<-read.tree(text="(((A,B),(C,D)),E);")
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='lightblue', cex=1)
nodelabels(frame="circle", bg='white', cex=1)

dev.off()

tree$tip.label
tree$edge
AnolisTree <- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))

par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for Anolis tree", ylim=c(0,50), xlim=c(0,6))
dev.off()

tipEdges <- which(AnolisTree$edge[,2] <= Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths) <- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]
plot(AnolisTree, cex=0.25)
Labs <- sapply(AnolisTree$edge.length, round, digits = 2)
edgelabels(text=Labs, cex =0.25)
dev.off()
plot(AnolisTree, cex=0.25, show.tip.label = FALSE)
dev.off()
plot(AnolisTree, cex=0.25, show.tip.label = FALSE, type = "fan")
dev.off()
eCols <- rep("black", 162)
eCols
(eCols[tipEdges] = "red")
plot(AnolisTree, cex=0.25, type ="fan", edge.col = eCols)
dev.off()
Ntip(AnolisTree)
Lengths
which.min(Lengths)
NewAnolisTree <- drop.tip(AnolisTree, tip = "Anolis_occultus")
Ntip(NewAnolisTree)
plot(NewAnolisTree, cex=0.25, show.tip.label = TRUE, type ="fan")
dev.off()
ltt(AnolisTree)
abline(0, 1, lwd=2, col='red', lty=2)
fit.bd(AnolisTree, rho=0.2)
setwd('~/Desktop/Evolution/Tasks/Task_07')
AnolisTree <- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))
plot(AnolisTree, type = "fan")
dev.off()
data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors = F, row.names = 1)
data
svl <- setNames(data$svl, rownames(data))
svl
Ancestors <- fastAnc(AnolisTree,svl,vars=TRUE,CI=TRUE)
Ancestors
?fastAnc

par(mar=c(0.1,0.1,0.1,0.1))
plot(AnolisTree, type = "fan", lwd=2, show.tip.label = F)
tiplabels(pch=16, cex=0.25*svl[AnolisTree$tip.label])
nodelabels(pch=16, cex=0.25*Ancestors$ace)
dev.off()

obj <- contMap(AnolisTree, svl, plot = F)
plot(obj, legend = 0.7*max(nodeHeights(AnolisTree)), sig = 2, fsize = c(0.7, 0.9))

fossilData <- data.frame(svl=log(c(25.4, 23.2, 17.7, 19.7, 24, 31)), tip1=c("Anolis_aliniger", "Anolis_aliniger", "Anolis_occultus", "Anolis_ricordii", "Anolis_cristatellus", "Anolis_occultus"), tip2=c("Anolis_chlorocyanus", "Anolis_coelestinus", "Anolis_hendersoni", "Anolis_cybotes", "Anolis_angusticeps", "Anolis_angusticeps"))
fossilData
fossilNodes <- c()
fossilNodes
nodeN <- c()
nodeN
for (i in 1:nrow(fossilData)) {
  Node <- fastMRCA(AnolisTree, fossilData[i, "tip1"], fossilData[i, "tip2"])
  fossilNodes[i] <- fossilData[i, "svl"]
  nodeN[i] <- Node
  names(fossilNodes) <- nodeN
}
Ancestors_withFossils <- fastAnc(AnolisTree,svl,anc.stats=fossilNodes, CI=TRUE,var=TRUE)
Ancestors_withFossils
