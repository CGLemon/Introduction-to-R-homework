##
# This file is the introduction to R homework.
# Exercise 2
# File : ex1-2.R
#
# Exercises Link : https://www.r-exercises.com/2016/11/15/vector-exercises-vol-2/
#


utils.dump  <- function(cnt, ans) {
    cat("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
    cat("Exercise", cnt, ":\n")
    print(ans)
    cat("\n")
}

utils.pair_dump <- function(cnt, ans.1, ans.2) {
    cat("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
    cat("Exercise", cnt, ":\n")
    cat("part 1 :\n")
    print(ans.1)
    cat("part 2 :\n")
    print(ans.2)
    cat("\n")
}

####################

#                  #

#    Exercise 1    #

#                  #

####################
#
#
# Consider two vectors, x, y
# x=c(4,6,5,7,10,9,4,15)
# y=c(0,10,1,8,2,3,4,1)
#
# What is the value of: x*y

x=c(4,6,5,7,10,9,4,15)
y=c(0,10,1,8,2,3,4,1)

ans <- x*y

utils.dump(1, ans)

## output :
## [1] 0 60  5 56 20 27 16 15

####################

#                  #

#    Exercise 2    #

#                  #

####################
#
#
# Consider two vectors, a, b
#
# a=c(1,2,4,5,6)
# b=c(3,2,4,1,9)
# What is the value of: cbind(a,b)

a=c(1,2,4,5,6)
b=c(3,2,4,1,9)

ans <- cbind(a,b)
utils.dump(2, ans)

## output :
##
##      a b
## [1,] 1 3
## [2,] 2 2
## [3,] 4 4
## [4,] 5 1
## [5,] 6 9
##

####################

#                  #

#    Exercise 3    #

#                  #

####################
#
#
# Consider two vectors, a, b
#
# a=c(1,5,4,3,6)
# b=c(3,5,2,1,9)
# What is the value of: a<=b

a=c(1,2,4,5,6)
b=c(3,2,4,1,9)

ans <- a<=b
utils.dump(3, ans)

## output
## [1]  TRUE  TRUE  TRUE FALSE  TRUE

####################

#                  #

#    Exercise 4    #

#                  #

####################
#
#
# Consider two vectors, a, b
#
# a=c(10,2,4,15)
# b=c(3,12,4,11)
# What is the value of: rbind(a,b)

a=c(10,2,4,15)
b=c(3,12,4,11)

ans <- rbind(a,b)
utils.dump(4, ans)

## output :
##
##   [,1] [,2] [,3] [,4]
## a   10    2    4   15
## b    3   12    4   11
##


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
#
# If x=c(1:12)
# What is the value of: dim(x)
# What is the value of: length(x)

x=c(1:12)

ans.1 <- dim(x)
ans.2 <- length(x)
utils.pair_dump(5, ans.1, ans.2)

## output 1 :
## NULL
##
## output 2 :
## [1] 12


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
#
# If a=c(12:5)
# What is the value of: is.numeric(a)

a=c(12:5)

ans <- is.numeric(a)
utils.dump(6, ans)

## output :
## [1] TRUE


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
#
# Consider two vectors, x, y
#
# x=c(12:4)
# y=c(0,1,2,0,1,2,0,1,2)
# What is the value of: which(!is.finite(x/y))

x=c(12:4)
y=c(0,1,2,0,1,2,0,1,2)

ans <- which(!is.finite(x/y))
utils.dump(7, ans)

## output :
## [1] 1 4 7


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
#
# Consider two vectors, x, y
#
# x=letters[1:10]
# y=letters[15:24]
#
# What is the value of: x<y

x=letters[1:10]
y=letters[15:24]

ans <- x<y
utils.dump(8, ans)

## output :
## [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
#
# If x=c('blue','red','green','yellow')
# What is the value of: is.character(x)

x=c('blue','red','green','yellow')

ans <- is.character(x)
utils.dump(9, ans)

## output :
## [1] TRUE

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
#
# If x=c('blue',10,'green',20)
# What is the value of: is.character(x)

x=c('blue',10,'green',20)

ans <- is.character(x)
utils.dump(10, ans)

## output :
## [1] TRUE
