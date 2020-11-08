##
# This file is the introduction to R homework.
# Exercise 6-2
# File : ex6-2.R
#
# Exercises Link : https://www.r-exercises.com/2016/12/27/list-exercises-vol-2/
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
# Consider 3 vectors, day, month and year:
#
# year=c(2005:2016)
# month=c(1:12)
# day=c(1:31)
#
# Define a list Date such as:
#
# Date=
#
# $year
# [1] 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
#
# $month
# [1] 1 2 3 4 5 6 7 8 9 10 11 12
#
# $day
# [1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31

Date <- list("year" = c(2005:2016), "month" = c(1:12), "day" = c(1:31))
utils.dump(list(Date), 1)

##  output
## $year
##  [1] 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
##
## $month
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
##
## $day
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# write an R statement that will replace the values of year element in Date list for c(2000:2010).

Date$year = c(2000:2010)
utils.dump(list(Date), 2)

##  output
## $year
##  [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010
##
## $month
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12
##
## $day
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# write an R statement that will delete the value 4 of the month component of the list Date.

Date$month = Date$month[Date$month != 4]
utils.dump(list(Date), 3)

##  output
## $year
##  [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010
##
## $month
##  [1]  1  2  3  5  6  7  8  9 10 11 12
##
## $day
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Consider a vector x such that:
# x=c(1,3,4,7,11,18,29)
# Write an R statement that will return a list X2 with components of value:
# x*2,x/2,sqrt(x) and names "x*2","x/2","sqrt(x)"


x = c(1, 3, 4, 7, 11, 18, 29)
X2=list("x*2" = x*2, "x/2" = x/2, "sqrt(x)" = sqrt(x))
utils.dump(list(X2), 4)

##  output
## $`x*2`
## [1]  2  6  8 14 22 36 58
##
## $`x/2`
## [1]  0.5  1.5  2.0  3.5  5.5  9.0 14.5
##
## $`sqrt(x)`
## [1] 1.000000 1.732051 2.000000 2.645751 3.316625 4.242641 5.385165


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Consider the X2 list.
# Write an R statement that will return a vector:
# 2.000000 2.645751 3.316625

out <- X2$'sqrt(x)'[(X2$'sqrt(x)' >= 2) & (X2$'sqrt(x)' < 4)]
utils.dump(list(out), 5)


##  output
## [1] 2.000000 2.645751 3.316625


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Write an R statement that will return a concatenation M, of Date and X2 lists.
#
# M
# $year
# [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008
#
# $month
# [1] 1 2 3 5 6 7 8 9 10 11 12
#
# $day
# [1] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
# [24] 24 25 26 27 28 29 30 31
#
# $`x*2`
# [1] 2 6 8 14 22 36 58
#
# $`x/2`
# [1] 0.5 1.5 2.0 3.5 5.5 9.0 14.5
#
# $`sqrt(x)`
# [1] 1.000000 1.732051 2.000000 2.645751 3.316625 4.242641 5.385165

M <- c(Date, X2)
utils.dump(list(M), 6)

##  output
## $year
##  [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010
##
## $month
##  [1]  1  2  3  5  6  7  8  9 10 11 12
##
## $day
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31
##
## $`x*2`
## [1]  2  6  8 14 22 36 58
##
## $`x/2`
## [1]  0.5  1.5  2.0  3.5  5.5  9.0 14.5
##
## $`sqrt(x)`
##[1] 1.000000 1.732051 2.000000 2.645751 3.316625 4.242641 5.385165


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Write an R statement that will return a sublist N of M, with components year,x*2 and day.

N <- M[c('year', 'x*2', 'day')]
utils.dump(list(N), 7)

##  output
## $year
##  [1] 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010
##
## $`x*2`
## [1]  2  6  8 14 22 36 58
##
## $day
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
## [26] 26 27 28 29 30 31


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Consider the N list.
# Write an R statement that will return:
# -the length of x*2 vector in N
# -the value of the second element of vector year in N

out <- list(length(N$'x*2'), N$year[2])
utils.dump(out, 8)

##  output 1 :
## [1] 7
##
##  output 2 :
## [1] 2001



####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Consider 3 letters vectors, and 2 numeric vectors:
# A=letters[1:4],B=letters[5:10],C=letters[11:15]
# D=c(1:10),E=c(20:5)
#
# Define a list z, with elementes x and y,such that
# x is a list with elements A,B,and C;
# and y is alist with elements D and E.


A <- letters[1:4]
B <- letters[5:10]
C <- letters[11:15]
D <- c(1:10)
E <- c(20:5)


x <- list(A, B, C)
y <- list(D, E)

names(x) <- c("A", "B", "C")
names(y) <- c("D", "E")

z <- list(y, x)
names(z) <- c("Y", "X")

utils.dump(list(z), 9)

##  output
## $Y
## $Y$D
##  [1]  1  2  3  4  5  6  7  8  9 10
##
## $Y$E
##  [1] 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5
##
##
## $X
## $X$A
## [1] "a" "b" "c" "d"
##
## $X$B
## [1] "e" "f" "g" "h" "i" "j"
##
## $X$C
## [1] "k" "l" "m" "n" "o"




####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Write an R statement that will return:
# -the number on third position on the second vector of the first list of z
# -the letter on fifth position on the third vector of the second list of z

out <- list(z$Y$E[3], z$X$C[5])
utils.dump(out, 10)

##  output 1 :
## [1] 18
##
##  output 2 :
## [1] "o"


