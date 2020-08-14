cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki",
           "Slifer the Sky Dragon", "Obelisk the Tormentor",
           "Black Luster Soldier", "5-Headed Dragon", "Exodia the Forbidden One")
atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 1000, 5000)

names(atk)
attributes(atk)

names(atk) <- cards
print(atk)


# The 6-th value
atk[6]
atk["Obelisk the Tormentor"]

# All the values but the 2nd one
atk[-2]
# Values 1, 3, 5, 7, and 9
atk[c(1,3,5,7,9)]
# All the values but the 4th, 5th, and 6th
atk[-(4:6)]
# All the values larger than 2000
atk[atk>2000]
