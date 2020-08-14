#vector recycling code example

weight <- c(71,   67,   83,   67)   #71,  67,   83
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)

#warning is not thrown when longer vector is of multiple of shorter vector
weight <- c(71,   67,   83,   67)   #71,  67,   83
height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75, 2.45)


bmi <- weight/(height^2)
print(bmi)
