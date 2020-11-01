##
# This file is the introduction to R homework.
# Exercise 5
# File : ex5.R
#
# Exercises Link : https://www.r-exercises.com/2015/12/01/array-exercises/
#

utils.dump <- function(answers, cnt) {
    cat("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
    cat("Exercise", cnt, ":\n")
    len = length(answers)
    if (len == 1) {
        out = answers[[1]]
        print(out)
    } else {
        for (i in c(1:len)) {
            cat(" output", i, ":\n")
            out = answers[[i]]
            print(out)
            cat("\n")
        }
    }
    cat("\n")
}


####################

#                  #

#    Exercise 1    #

#                  #

####################
#
# Create an array (3 dimensional) of 24 elements using the  dim()  function.
#

array <- c(1:24)
dim(array) <- c(2, 3, 4)
utils.dump(list(dim(array)), 1)

##  output
## [1] 2 3 4
##

####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Create an array (3 dimensional) of 24 elements using the  array()  function.
#

array <- array(data = c(1:24),
               dim = c(2,3,4))
utils.dump(list(dim(array)), 2)

##  output
## [1] 2 3 4
##


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Assign some dimnames of your choice to the array using the  dimnames()  function.
#

array <- array(data = c(1:24),
               dim = c(2, 3, 4))

dimnames(array)[[1]] <- c("a", "b")
dimnames(array)[[2]] <- c("x", "y", "z")
dimnames(array)[[3]] <- c("o", "n", "u", "r")

utils.dump(list(array), 3)

##  output
## , , o
##
##   x y z
## a 1 3 5
## b 2 4 6
##
## , , n
##
##   x  y  z
## a 7  9 11
## b 8 10 12
##
## , , u
##
##    x  y  z
## a 13 15 17
## b 14 16 18
##
## , , r
## 
##    x  y  z
## a 19 21 23
## b 20 22 24
##


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Assign some dimnames of your choice to the array using the arguments of the  array()  function.
#

array <- array(data = c(1:24),
               dim = c(2, 3, 4),
               dimnames = list(c("a", "b"), c("x", "y", "z"), c("o", "n", "u", "r")))
utils.dump(list(array), 4)

##  output
## , , o
##
##   x y z
## a 1 3 5
## b 2 4 6
##
## , , n
##
##   x  y  z
## a 7  9 11
## b 8 10 12
##
## , , u
##
##    x  y  z
## a 13 15 17
## b 14 16 18
##
## , , r
##
##    x  y  z
## a 19 21 23
## b 20 22 24
##


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Instead of column-major array, make a row-major array (transpose).
#

t_array <- aperm(array, perm = NULL, resize = TRUE)
utils.dump(list(t_array), 5)

##  output
## , , a
##
##    x  y  z
## o  1  3  5
## n  7  9 11
## u 13 15 17
## r 19 21 23
##
## , , b
##
##    x  y  z
## o  2  4  6
## n  8 10 12
## u 14 16 18
## r 20 22 24
##

####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# For this exercise, and all that follow, download this file, and read it into R using the  read.csv()  function, e.g.:
# Copy the column named N into a new variable arr.
#


dataset <- read.csv("./ex.csv")
arr <- dataset$N
utils.dump(list(arr), 6)

##  output
## [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
##


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Set dimensions of this variable and convert it into a 3 * 2 * 4 array. Add dimnames.
#

dim(arr) <- c(3, 2, 4)
dimnames(arr)[[1]] <- c("a", "b", "c")
dimnames(arr)[[2]] <- c("x", "y")
dimnames(arr)[[3]] <- c("o", "n", "u", "r")
utils.dump(list(arr), 7)

##  output
## , , o
##
##   x y
## a 1 4
## b 2 5
## c 3 6
##
## , , n
##
##   x  y
## a 7 10
## b 8 11
## c 9 12
##
## , , u
##
##    x  y
## a 13 16
## b 14 17
## c 15 18
##
## , , r
##
##    x  y
## a 19 22
## b 20 23
## c 21 24
##


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Print the whole array on the screen.
#

utils.dump(list(arr), 8)


##  output
## , , o
## 
##   x y
## a 1 4
## b 2 5
## c 3 6
##
## , , n
##
##   x  y
## a 7 10
## b 8 11
## c 9 12
##
## , , u
##
##    x  y
## a 13 16
## b 14 17
## c 15 18
##
## , , r
##
##    x  y
## a 19 22
## b 20 23
## c 21 24
##


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Print only elements of height 2, assuming the first dimension represents rows, the second columns and the third heigth.
#

out <- arr[,,2]
utils.dump(list(out), 9)

##  output
##   x  y
## a 7 10
## b 8 11
## c 9 12
##

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Print elements of height 1 and columns 3 and 1.
#

out <- arr[,c(T, F), 1]
utils.dump(list(out), 10)

##  output
## a b c 
## 1 2 3 
##


####################

#                  #

#    Exercise 11   #

#                  #

####################
#
# Print element of height 2, column 4 and row 2.
#

# out <- arr[2, 4, 2]
utils.dump(list("Syntax error"), 11)

##  output
## Error in arr[2, 4, 2] : subscript out of bounds
## Execution halted
##

####################

#                  #

#    Exercise 12   #

#                  #

####################
#
# Repeat the exercises 9-11, but instead of using numbers to reference row, column and height, use  dimnames.
#

out_1 <- arr[,,"n"]
out_2 <- arr[,"x" ,"o"]
utils.dump(list(out_1, out_2), 12)


##  output 1 :
##   x  y
## a 7 10
## b 8 11
## c 9 12
##
##  output 2 :
## a b c 
## 1 2 3 
##


