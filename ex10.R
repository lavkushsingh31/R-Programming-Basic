
Player <- c("dark","dark","dark","dark","dark","light","light","light","light","light")
Peice <- c("king","queen","pawn","pawn","knight","bishop","king","rook","pawn","pawn")
vect <- c(Player,Peice)
print(vect)
        
matrix1 <- cbind(Player, Peice)
print(matrix1)

matrix2 <- matrix(vect, nrow = 10, byrow = F, dimnames = list(NULL,c("Player", "Peice")))
print(matrix2)


dim(vect) <- c(10,2)
vect
colnames(vect) <- c("Player", "Peice")
