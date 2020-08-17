rnormMatrix <- matrix(rnorm(25), nrow = 5)
rnormMatrix

colAvg <- colMeans(rnormMatrix)
colAvg
ColSum <- colSums(rnormMatrix)
ColSum

#adding new rows
rnormMatrixPrelim <- rbind(rnormMatrix, colAvg, ColSum)
rnormMatrixPrelim

rowAvg<- rowMeans(rnormMatrixPrelim)
rowAvg
rowSum <- rowSums(rnormMatrixPrelim)
rowSum

#adding new columns
rnormMatrixPrelim <- cbind(rnormMatrixPrelim, rowSum, rowAvg)
rnormMatrixPrelim

min(rnormMatrixPrelim)
max(rnormMatrixPrelim)
mean(rnormMatrixPrelim)
sd(rnormMatrixPrelim)


#---------------------------------------------------------------


runifMatrix <- matrix(runif(25), nrow = 5)
runifMatrix

colAvg2 <- colMeans(runifMatrix)
ColSum2 <- colSums(runifMatrix)

#adding new rows
runifMatrixPrelim <- rbind(runifMatrix, ColSum2, colAvg2)
runifMatrixPrelim

rowAvg2 <- rowMeans(runifMatrixPrelim)
rowSum2 <- rowSums(runifMatrixPrelim)

#adding new columns

runifMatrixPrelim <- cbind(runifMatrixPrelim, rowSum2, rowAvg2)
runifMatrixPrelim

min(runifMatrixPrelim)
max(runifMatrixPrelim)
mean(runifMatrixPrelim)
sd(runifMatrixPrelim)


#----------------------------------------------

matNormal <- matrix(rnorm(25), nrow = 5)
mean(matNormal)
sd(matNormal)

matuniform <- matrix(runif(25), nrow = 5)
mean(matuniform)
sd(matuniform)
