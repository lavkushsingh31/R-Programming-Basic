cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki",
           "Slifer the Sky Dragon", "Obelisk the Tormentor",
           "Black Luster Soldier", "5-Headed Dragon", "Exodia the Forbidden One",
           "Dragon Master Knight")
print(cards)
typeof(cards)

atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 1000, 5000)
print(atk)
typeof(atk)

yugioh <- c(cards, atk)
print(yugioh)
typeof(yugioh)



monster <- c(T, T, T, F, T, T, T, T, T, T)
print(monster)
typeof(monster)

yugioh <- c(monster, yugioh)
print(yugioh)
typeof(yugioh)

coerce.check <- c(atk, monster)
print(coerce.check)
typeof(coerce.check)
