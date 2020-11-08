##
# This file is the introduction to R homework.
# Exercise 6-1
# File : ex6-1.R
#
# Exercises Link : https://www.r-exercises.com/2015/12/31/list-exercises/
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
# If:
# p <- c(2,7,8), q <- c("A", "B", "C") and
# x <- list(p, q),
# then what is the value of x[2]?
# a. NULL
# b. "A" "B" "C"
# c. "7"
#

p <- c(2,7,8)
q <- c("A", "B", "C")
x <- list(p, q)
utils.dump(list(x[2]), 1)

##  output
## [[1]]
## [1] "A" "B" "C"
##
##  answer
## b.


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# If:
# w <- c(2, 7, 8)
# v <- c("A", "B", "C")
# x <- list(w, v),
# then which R statement will replace "A" in x with "K".
# a. x[[2]] <- "K"
# b. x[[2]][1] <- "K"
# c. x[[1]][2] <- "K"


w <- c(2, 7, 8)
v <- c("A", "B", "C")
x <- list(w, v)
x[[2]][1] <- "K"

utils.dump(list(x), 2)

##  output
## [[1]]
## [1] 2 7 8
##
## [[2]]
## [1] "K" "B" "C"
##
##  answer
## b.


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# If a <- list ("x"=5, "y"=10, "z"=15), which R statement will give the sum of all elements in a?
# a. sum(a)
# b. sum(list(a))
# c. sum(unlist(a))

a <- list ("x"=5, "y"=10, "z"=15)
utils.dump(list(sum(unlist(a))), 3)

##  output
## [1] 30
##
##  answer
## c.


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# If Newlist <- list(a=1:10, b="Good morning", c="Hi"), 
# write an R statement that will add 1 to each element of the first vector in Newlist.

Newlist <- list(a=1:10, b="Good morning", c="Hi")
Newlist$a <- Newlist$a + 1
utils.dump(list(Newlist), 4)

##  output
## $a
##  [1]  2  3  4  5  6  7  8  9 10 11
##
## $b
## [1] "Good morning"
##
## $c
## [1] "Hi"


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# If b <- list(a=1:10, c="Hello", d="AA"),
# write an R expression that will give all elements, except the second, of the first vector of b.

b <- list(a=1:10, c="Hello", d="AA")
out <- b$a[-2]
utils.dump(list(out), 5)

##  output
## [1]  1  3  4  5  6  7  8  9 10


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Let x <- list(a=5:10, c="Hello", d="AA"),
# write an R statement to add a new item z = "NewItem" to the list x.

x <- list(a=5:10, c="Hello", d="AA")
x$z <-"New Item"
utils.dump(list(x), 6)

##  output
## $a
## [1]  5  6  7  8  9 10
##
## $c
## [1] "Hello"
##
## $d
## [1] "AA"
##
## $z
## [1] "New Item"



####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Consider y <- list("a", "b", "c"),
# write an R statement that will assign new names "one", "two" and "three" to the elements of y.

y <- list("a", "b", "c")
names(y) <- c("one", "two", "three")
utils.dump(list(y), 7)

##  output
## $one
## [1] "a"
##
## $two
## [1] "b"
##
## $three
## [1] "c"

####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# If x <- list(y=1:10, t="Hello", f="TT", r=5:20), write an R statement that will give the length of vector r of x.

x <- list(y=1:10, t="Hello", f="TT", r=5:20)
out = length(x$r)
utils.dump(list(out), 8)

##  output
## [1] 16


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Let string <- "Grand Opening", write an R statement to split this string into two and return the following output:
#
# [[1]]
# [1] "Grand"
#
# [[2]]
# [1] "Opening"

string <- "Grand Opening"
splits <- strsplit(string, " ")
out <- list(splits[[1]][1], splits[[1]][2])
utils.dump(list(out), 9)

##  output
## [[1]]
## [1] "Grand"
##
## [[2]]
## [1] "Opening"


####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Let:
# y <- list("a", "b", "c") and
# q <- list("A", "B", "C", "a", "b", "c").
# Write an R statement that will return all elements of q that are not in y, with the following result:
#
# [[1]]
# [1] "A"
#
# [[2]]
# [1] "B"
#
# [[3]]
# [1] "C"

y <- list("a", "b", "c") 
q <- list("A", "B", "C", "a", "b", "c")
out <- setdiff(q, y)
utils.dump(list(out), 10)

##  output
## [[1]]
## [1] "A"
##
## [[2]]
## [1] "B"
##
## [[3]]
## [1] "C"


