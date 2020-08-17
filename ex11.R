Player <- c("dark","dark","dark","dark","dark","light","light","light","light","light")
Peice <- c("king","queen","pawn","pawn","knight","bishop","king","rook","pawn","pawn")
chess <- c(Player,Peice)

chessMatrix <- matrix(chess, ncol = 2, byrow = FALSE, dimnames = list(NULL, c("Player","Peice")))
print(chessMatrix)

chessMatrix <- t(chessMatrix)
print(chessMatrix)

chessMatrix <- rbind(chessMatrix, c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1))
print(chessMatrix)

rownames(chessMatrix)[3] <- "Turn"

chessMatrix <- t(chessMatrix)
print(chessMatrix)

chessMatrix[6,"Peice"]
chessMatrix[,c("Player", "Peice")]

chessMatrix[1:5,]
chessMatrix[, "Peice",drop = FALSE]
class(chessMatrix[, "Peice", drop = FALSE ])

chessMatrix[,-2]

chessMatrix[2,c(1,3)]

chessMatrix[7,3] <- 3
print(chessMatrix)
