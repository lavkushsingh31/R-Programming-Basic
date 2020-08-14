flippingCoin <-  function(){
        coin <- c("heads","tails")
        toss <- sample(coin, size = 100, replace = TRUE, prob = c(0.3,0.7))
        return(toss)
}

tossResult <- flippingCoin()
print(paste("Number of Heads:", sum(tossResult == "heads"), sep = " "))
print(paste("Number of Tails:", sum(tossResult == "tails"), sep = " "))
