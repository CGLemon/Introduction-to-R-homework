##
# This file is the introduction to R homework.
# Exercise 3
# File : ex3.R
#
# Exercises Link : https://www.r-exercises.com/2015/12/21/index-vectors/
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
#
# If x <- c("ww", "ee", "ff", "uu", "kk"), what will be the output for x[c(2,3)]?
# a. "ee", "ff"
# b. "ee"
# c. "ff"

x <- c("ww", "ee", "ff", "uu", "kk")
out <- x[c(2,3)]
utils.dump(list(out), 1)

##  output:
## [1] "ee" "ff"
##
##  answer: (b)


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
#
# If x <- c("ss", "aa", "ff", "kk", "bb"), what will be the third value in the index vector operation x[c(2, 4, 4)]?
# a. "uu"
# b. NA
# c. "kk"

x <- c("ss", "aa", "ff", "kk", "bb")
out <- x[c(2, 4, 4)]
utils.dump(list(out), 2)

##  output:
## [1] "aa" "kk" "kk"
##
##  answer: (c)


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
#
# If x <- c("pp", "aa", "gg", "kk", "bb"), what will be the fourth value in the index vector operation x[-2]?
# a. "aa"
# b. "gg"
# c. "bb"

x <- c("pp", "aa", "gg", "kk", "bb")
out <- x[-2]
utils.dump(list(out), 3)

##  output:
## [1] "pp" "gg" "kk" "bb"
##
##  answer: (c)


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
#
# Let a <- c(2, 4, 6, 8) and b <- c(TRUE, FALSE, TRUE, FALSE), what will be the output for the R expression max(a[b])?

a <- c(2, 4, 6, 8) 
b <- c(TRUE, FALSE, TRUE, FALSE)
out <- max(a[b])
utils.dump(list(out), 4)

##  output:
## [1] 6


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
#
# Let a <- c (3, 4, 7, 8) and b <- c(TRUE, TRUE, FALSE, FALSE), what will be the output for the R expression sum(a[b])?

a <- c (3, 4, 7, 8)
b <- c(TRUE, TRUE, FALSE, FALSE)
out <- sum(a[b])
utils.dump(list(out), 5)

##  output:
## [1] 7


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
#
# Write an R expression that will return the sum value of 10 for the vector x <- c(2, 1, 4, 2, 1, NA)

x <- c(2, 1, 4, 2, 1, NA)
out <- sum(x[!is.na(x)])
utils.dump(list(out), 6)

##  output:
## [1] 10


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
#
# Exercise 7
# If x <- c(1, 3, 5, 7, NA) write an r expression that will return the output 1, 3, 5, 7.

x <- c(1, 3, 5, 7, NA)
out <- x[!is.na(x)]
utils.dump(list(out), 7)

##  output:
## [1] 1 3 5 7


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
#
# Consider the data frame s <- data.frame(first= as.factor(c("x", "y", "a", "b", "x", "z")), second=c(2, 4, 6, 8, 10, 12)).
# Write an R statement that will return the output 2, 4, 10, by using the variable first as an index vector.

s <- data.frame(first= as.factor(c("x", "y", "a", "b", "x", "z")), second=c(2, 4, 6, 8, 10, 12))
out <- s$second[s$first %in% c('x', 'y')] 
utils.dump(list(out), 8)

##  output:
## [1]  2  4 10

####################

#                  #

#    Exercise 9    #

#                  #

####################
#
#
## What will be the output for the R expression (c(FALSE, TRUE)) || (c(TRUE, TRUE))?

out <- (c(FALSE, TRUE)) || (c(TRUE, TRUE))
utils.dump(list(out), 9)

##  output:
## [1] TRUE

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
#
# Write an R expression that will return the positions of 3 and 7 in the vector x <- c(1, 3, 6, 7, 3, 7, 8, 9, 3, 7, 2)

x <- c(1, 3, 6, 7, 3, 7, 8, 9, 3, 7, 2)
out <- which(x %in% c(3, 7))
utils.dump(list(out), 10)

##  output:
## [1]  2  4  5  6  9 10
