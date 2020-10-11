##
# This file is the introduction to R homework.
# Exercise 2
# File : ex2.R
#
# Exercises Link : https://www.r-bloggers.com/2015/11/matrix-exercises/
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
# Create three vectors  x,y,z  with integers and each vector has 3 elements.
# Combine the three vectors to become a 3×3 matrix A where each column represents a vector.
# Change the row names to  a,b,c.
#

x <- c(1:3)
y <- c(4:6)
z <- c(7:9)
A = matrix(c(x, y, z), nrow = 3, ncol = 3)
colnames(A)<-c("x", "y", "z")
rownames(A)<-c("a", "b", "c")

utils.dump(list(A), 1)

## output :
##   x y z
## a 1 4 7
## b 2 5 8
## c 3 6 9


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Please check your result from Exercise 1, using is.matrix(A).
# It should return  TRUE, if your answer is correct.
# Otherwise, please correct your answer.
#

out <- is.matrix(A)
utils.dump(list(out), 2)

## output :
## [1] TRUE


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Create a vector with 12 integers.
# Convert the vector to a 4*3 matrix  B  using  matrix().
# Please change the column names to  x, y, z  and row names to  a, b, c, d.
# The argument byrow  in  matrix()  is set to be  FALSE  by default.
# Please change it to  TRUE  and print  B  to see the differences.
#

v <- c(1:12)
B_bycol = matrix(v, nrow = 4, ncol = 3)
colnames(B_bycol)<-c("x", "y", "z")
rownames(B_bycol)<-c("a", "b", "c", "d")

B_byrow = matrix(v, nrow = 4, ncol = 3, byrow = TRUE)
colnames(B_byrow)<-c("x", "y", "z")
rownames(B_byrow)<-c("a", "b", "c", "d")


utils.dump(list(B_bycol, B_byrow), 3)

##  output 1 :
##   x y  z
## a 1 5  9
## b 2 6 10
## c 3 7 11
## d 4 8 12
##
##  output 2 :
##    x  y  z
## a  1  2  3
## b  4  5  6
## c  7  8  9
## d 10 11 12



####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Please obtain the transpose matrix of  B  named  tB .
#

tB_byrow <- t(B_byrow)
utils.dump(list(tB_byrow), 4)

##  output
##   a  b  c  d
## x 1  2  3  4
## y 5  6  7  8
## z 9 10 11 12


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Now  tB  is a 3×4 matrix. By the rule of matrix multiplication in algebra, can we perform  tB*tB  in R language?
# (Is a 3×4 matrix multiplied by a 3×4 allowed?) What result would we get?

out <- tB_byrow * tB_byrow
utils.dump(list(out), 5)

## It is not the matrix multiplication.

##  output
##   a  b  c   d
## x 1 16 49 100
## y 4 25 64 121
## z 9 36 81 144


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# As we can see from Exercise 5, we were expecting that  tB*tB  would not be allowed because it disobeys the algebra rules.
# But it actually went through the computation in R.
# However, as we check the output result , we notice the multiplication with a single  *  operator is performing the componentwise multiplication.
# It is not the conventional matrix multiplication. How to perform the conventional matrix multiplication in R? Can you compute matrix  A  multiplies  tB ?
#

out <- A %*% t(B_byrow)
utils.dump(list(out), 6)

##  output
##    a  b   c   d
## a 30 66 102 138
## b 36 81 126 171
## c 42 96 150 204


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# If we convert  A  to a  data.frame  type instead of a  matrix , can we still compute a conventional matrix multiplication for matrix  A  multiplies matrix  A ?
# Is there any way we could still perform the matrix multiplication for two  data.frame  type variables? (Assuming proper dimension)

M <- A %*% A
datA<-data.frame(A)
# datA %*% datA : Not allowed
#     This is not a matrix. The matrix multiplicatio is not allowed.
MartixA <- as.matrix(datA)
out <- MartixA %*% MartixA

utils.dump(list(M, out), 7)

##  output 1 :
##    x  y   z
## a 30 66 102
## b 36 81 126
## c 42 96 150
##
##  output 2 :
##    x  y   z
## a 30 66 102
## b 36 81 126
## c 42 96 150


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Extract a sub-matrix from  B  named  subB . It should be a 3×3 matrix which includes the last three rows of matrix  B  and their corresponding columns.

subB_byrow<-B_byrow[2:dim(B_byrow)[1],1:3]
utils.dump(list(subB_byrow), 8)

##  output
##    x  y  z
## b  4  5  6
## c  7  8  9
## d 10 11 12


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Compute  3*A ,  A+subB ,  A-subB . Can we compute  A+B? Why?

threeA <- 3 * A
AplusSubB <- A + subB_byrow
AminusSubB <- A - subB_byrow
# AplusB <- A + B : Not allowed
#     Because they are differece dimension.

utils.dump(list(threeA, AplusSubB, AminusSubB), 9)

##  output 1 :
##   x  y  z
## a 3 12 21
## b 6 15 24
## c 9 18 27
##
##  output 2 :
##    x  y  z
## a  5  9 13
## b  9 13 17
## c 13 17 21
##
##  output 3 :
##    x  y  z
## a -3 -1  1
## b -5 -3 -1
## c -7 -5 -3

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Generate a n * n matrix (square matrix)  A1  with proper number of random numbers, then generate another n * m matrix  A2.
# If we have  A1*M=A2  (Here * represents the conventional multiplication), please solve for  M.
# Hint: use the  runif()

set.seed(123456789)
n <- 8
m <- 5
A1<-matrix(runif(n * n), n, n)
A2<-matrix(runif(n * m), n, m)
solve<-solve(A1,A2)

utils.dump(list(solve), 10)

##  output 10 :
##           [,1]       [,2]       [,3]        [,4]       [,5]
## [1,]  3.180155 -0.2058086  -8.796884  0.18749294  -7.426565
## [2,]  3.525588 -0.4933106 -11.283028 -0.03109128 -10.309037
## [3,]  1.486882  0.5102269  -2.283156 -0.55390677  -1.964792
## [4,] -6.252520  1.2317138  21.622730  0.39963898  18.850713
## [5,]  2.481700 -0.0477147  -8.097359 -0.50192765  -7.336219
## [6,] -1.281943  0.5261375   3.393331  0.83719148   2.925728
## [7,] -4.904423  0.1116496  16.654154  0.55975946  14.719663
## [8,]  2.478868 -0.6787698  -8.699870  0.03844758  -7.359919

