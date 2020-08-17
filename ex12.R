?runif
u <- runif(12)
u

matrx <- matrix(u, nrow = 3, byrow = TRUE, dimnames = list(c("x","y","z"),c("uno", "dos", "tres", "cuatro")))
print(matrx)

scaledMatirx <- matrx*10
scaledMatirx
extractedMatrix <- scaledMatirx[1:2, 1:4]
extractedMatrix

#cannot substract smaller matrix from larger matrix
smallerFromBigger <- scaledMatirx - extractedMatrix

extracter3x3 <- scaledMatirx[1:3, 1:3]
extracter3x3

smallerFromBigger2 <- scaledMatirx - extracter3x3

unoFromMatrix <- scaledMatirx[, 1]
unoFromMatrix

#this worked
vectorMinusMatrix <- scaledMatirx - unoFromMatrix
vectorMinusMatrix

?rnorm
vectByrnorm <- rnorm(12)
matrixRnorm <- matrix(vectByrnorm, nrow = 3, byrow = FALSE)

scaledMatirx * matrixRnorm
