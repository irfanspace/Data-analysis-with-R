
#Logical values
#True or False

p <- 4

# p > 5 False
# p >= 5 F
# p < 5 T
# p <= 5 T
# p == 5 F
# p != 5 T (Is p different than 5)

# logical values in vectors
# thus, output will be a vector
P <- c(3, 1, 8, 10, -2)

# P > 5 (False, False, True, True, False)
# P >= 5 (F, F, T, T, F)
# P < 5 (T, T, F, F, T)
# P <= 5 (T, T, F, F, T)
# P == 5 (F, F, F, F, F)
# P != 5 (T, T, T, T, T) (Is P not equal to 5?)

# == equal; != not equal; | or; ! not; & and; < less than; > greater than; <= less than equal....
# %in% contained in set
# 8 %in% c(3, 1, 8, 10 ,-2) TRUE
# 2 %in% c(3, 1, 8, 10 ,-2) FALSE

#Operating with logical values
a <- T
b <- F
c <- T

# a&b F
# a&c T
# !a F (opposite of a )
# a | b T ( a or b)

# Indexing a data structure
# Logical vectors can be used to select certain parts from data structures like data frames or matrices.

mat1 <- matrix(data = rnorm(30), nrow = 5, ncol = 6)
dim(mat1)

idx <- c(TRUE, TRUE, TRUE, TRUE, FALSE)
mat2 <- mat1[idx,]
dim(mat2)

         