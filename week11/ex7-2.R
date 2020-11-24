##
# This file is the introduction to R homework.
# Exercise 7-2
# File Name : ex7-2.R
#
# Exercises Link : https://www.r-exercises.com/2016/11/28/data-frame-exercises-vol-2/
#

utils.assert <- function(fact, proposition) {
    if (proposition == FALSE) {
        cat("Proposition is not satisfied \n")
        cat(" Invaild proposition : '",fact, "' \n", sep = "")
        stopifnot(FALSE)
    }
}

utils.dump <- function(answers, cnt = 0) {

    utils.assert("The output answer(s) must be list",
                     is.list(answers))

    utils.assert("The number of output answer(s) must be great than zero", 
                     length(answers) > 0)
    utils.assert("", is.numeric(cnt))

    cat(rep("~", 40), "\n", sep = "")
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
# Consider two vectors:
# x=seq(1,43,along.with=Id)
# y=seq(-20,0,along.with=Id)
# Create a data.frame df:
#
# >df
#    Id Letter         x          y
# 1   1      a  1.000000 -20.000000
# 2   1      b  4.818182 -18.181818
# 3   1      c  8.636364 -16.363636
# 4   2      a 12.454545 -14.545455
# 5   2      b 16.272727 -12.727273
# 6   2      c 20.090909 -10.909091
# 7   3      a 23.909091  -9.090909
# 8   3      b 27.727273  -7.272727
# 9   3      c 31.545455  -5.454545
# 10  4      a 35.363636  -3.636364
# 11  4      b 39.181818  -1.818182
# 12  4      c 43.000000   0.000000
#

df <- data.frame(Id = rep(c(1,2,3,4), each=3),
                 Letter = rep(letters[1:3], 4),
                 x = seq(1, 43, along.with=rep(1, 12)),
                 y = seq(-20, 0, along.with=rep(1, 12)))

utils.dump(list(df), 1)

##  output
##    Id Letter         x          y
## 1   1      a  1.000000 -20.000000
## 2   1      b  4.818182 -18.181818
## 3   1      c  8.636364 -16.363636
## 4   2      a 12.454545 -14.545455
## 5   2      b 16.272727 -12.727273
## 6   2      c 20.090909 -10.909091
## 7   3      a 23.909091  -9.090909
## 8   3      b 27.727273  -7.272727
## 9   3      c 31.545455  -5.454545
## 10  4      a 35.363636  -3.636364
## 11  4      b 39.181818  -1.818182
## 12  4      c 43.000000   0.000000



####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# From the previous one data frame df.
# Create this data frame:
#
#    Id      x.a        y.a       x.b        y.b       x.c        y.c
# 1   1  1.00000 -20.000000  4.818182 -18.181818  8.636364 -16.363636
# 4   2 12.45455 -14.545455 16.272727 -12.727273 20.090909 -10.909091
# 7   3 23.90909  -9.090909 27.727273  -7.272727 31.545455  -5.454545
# 10  4 35.36364  -3.636364 39.181818  -1.818182 43.000000   0.000000
#


# reshape(data, varying = NULL, v.names = NULL, timevar = "time",
#         idvar = "id", ids = 1:NROW(data),
#         times = seq_along(varying[[1]]),
#         drop = NULL, direction, new.row.names = NULL,
#         sep = ".",
#         split = if (sep == "") {
#             list(regexp = "[A-Za-z][0-9]", include = TRUE)
#         } else {
#             list(regexp = sep, include = FALSE, fixed = TRUE)}
#         )
#
# parameters:
#    timevar
#        the variable in long format that differentiates multiple records from the same group or individual.
#        If more than one record matches, the first will be taken (with a warning).
#
#    idvar
#        Names of one or more variables in long format that identify multiple records
#        from the same group/individual. These variables may also be present in wide format.
#        redf <- reshape(df, timevar='Letter', idvar='Id', direction='wide')
#
#    direction
#        character string, partially matched to either "wide" to reshape to wide format, or "long"
#        to reshape to long format.

redf <- reshape(data = df,
                timevar = "Letter",
                idvar = "Id",
                direction = "wide")

utils.dump(list(redf), 2)

##  output
##    Id      x.a        y.a       x.b        y.b       x.c        y.c
## 1   1  1.00000 -20.000000  4.818182 -18.181818  8.636364 -16.363636
## 4   2 12.45455 -14.545455 16.272727 -12.727273 20.090909 -10.909091
## 7   3 23.90909  -9.090909 27.727273  -7.272727 31.545455  -5.454545
## 10  4 35.36364  -3.636364 39.181818  -1.818182 43.000000   0.000000

####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Create two data frame df1 and df2:
#
# > df1
#   Id Age
# 1  1  14
# 2  2  12
# 3  3  15
# 4  4  10
#
# > df2
#   Id Age Sex Code
# 1  1  14   F    a
# 2  2  12   M    b
# 3  3  15   M    c
# 4  4  10   F    d


df1 <- data.frame(Id = c(1, 2, 3, 4),
                  Age = c(14, 12, 15, 10))
df2 <- data.frame(Id = c(1, 2, 3, 4), 
                  Sex = c('F', 'M', 'M', 'F'),
                  Code = c('a', 'b', 'c', 'd'))

utils.dump(list(df1, df2), 3)

##  output 1 :
##   Id Age
## 1  1  14
## 2  2  12
## 3  3  15
## 4  4  10
##
##  output 2 :
##   Id Sex Code
## 1  1   F    a
## 2  2   M    b
## 3  3   M    c
## 4  4   F    d

####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Create a data frame df3:
#
#   id2 score
# 1   4   100
# 2   3    98
# 3   2    94
# 4   1    99
#
# From M and df3 create N:
#
#   Id Age Sex Code score
# 1  1  14   F    a    99
# 2  2  12   M    b    94
# 3  3  15   M    c    98
# 4  4  10   F    d   100


M=merge(df1, df2, by='Id')

id2 = seq(4,1)
score = c(100, 98, 94, 99)
df3 = data.frame(id2, score)

N = merge(M, df3, by.x='Id', by.y='id2')

utils.dump(list(N), 4)


##  output
##   Id Age Sex Code score
## 1  1  14   F    a    99
## 2  2  12   M    b    94
## 3  3  15   M    c    98
## 4  4  10   F    d   100


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Consider the previous one data frame N:
# 1)Remove the variables Sex and Code
# 2)From N, create a data frame:
#
#
#    values   ind
# 1       1    Id
# 2       2    Id
# 3       3    Id
# 4       4    Id
# 5      14   Age
# 6      12   Age
# 7      15   Age
# 8      10   Age
# 9      99 score
# 10     94 score
# 11     98 score
# 12    100 score

N[,c("Sex")] <- NULL
N[,c("Code")] <- NULL
output <- stack(N)
utils.dump(list(output), 5)

##  output
##    values   ind
## 1       1    Id
## 2       2    Id
## 3       3    Id
## 4       4    Id
## 5      14   Age
## 6      12   Age
## 7      15   Age
## 8      10   Age
## 9      99 score
## 10     94 score
## 11     98 score
## 12    100 score


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# For this exercise, we’ll use the (built-in) dataset trees.
# a) Make sure the object is a data frame, if not change it to a data frame.
# b) Create a new data frame A:
#
# >A
#               Girth Height    Volume
# mean_tree  13.24839     76  30.17097
# min_tree    8.30000     63  10.20000
# max_tree   20.60000     87  77.00000
# sum_tree  410.70000   2356 935.30000


A <- data.frame(mean_tree = apply(trees, 2, mean),
                min_tree = apply(trees, 2, max),
                max_tree = apply(trees, 2, min),
                sum_tree = apply(trees, 2, sum))

A <- t(A)
utils.dump(list(A), 6)

##  output
##               Girth Height    Volume
## mean_tree  13.24839     76  30.17097
## min_tree    8.30000     63  10.20000
## max_tree   20.60000     87  77.00000
## sum_tree  410.70000   2356 935.30000

####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Consider the data frame A:
# 1)Order the entire data frame by the first column.
# 2)Rename the row names as follows: mean, min, max, tree


output1 <- A[order(A[,1]),]
row.names(A) <- c('mean','min','max','sum')
output2 <- A

utils.dump(list(output1, output2), 7)

##  output 1 :
##               Girth Height    Volume
## max_tree    8.30000     63  10.20000
## mean_tree  13.24839     76  30.17097
## min_tree   20.60000     87  77.00000
## sum_tree  410.70000   2356 935.30000
##
##  output 2 :
##          Girth Height    Volume
## mean  13.24839     76  30.17097
## min   20.60000     87  77.00000
## max    8.30000     63  10.20000
## sum  410.70000   2356 935.30000


####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Create an empty data frame with column types:
#
# > df
# Ints Logicals Doubles Characters
# (or 0-length row.names)

df = data.frame(Ints = integer(),
                Logicals = logical(),
                Doubles = double(),
                Characters = character())
utils.dump(list(df), 8)

##  output
## [1] Ints       Logicals   Doubles    Characters
## <0 rows> (or 0-length row.names)

####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Create a data frame XY
#
# X=c(1,2,3,1,4,5,2)
# Y=c(0,3,2,0,5,9,3)
# > XY
# X Y
# 1 1 0
# 2 2 3
# 3 3 2
# 4 1 0
# 5 4 5
# 6 5 9
# 7 2 3
#
# 1)looks at duplicated elements using a provided R function.
# 2) keeps only the uniques lines on XY using a provided R function.

X <- c(1, 2, 3, 1, 4, 5, 2)
Y <- c(0, 3, 2, 0, 5, 9, 3)
XY <- data.frame(X,Y)

output1 <- duplicated(XY)
output2 <- unique(XY)

utils.dump(list(output1, output2), 9)

##  output 1 :
## [1] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
##
##  output 2 :
##   X Y
## 1 1 0
## 2 2 3
## 3 3 2
## 5 4 5
## 6 5 9

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# For this exercise, we’ll use the (built-in) dataset Titanic.
# a) Make sure the object is a data frame, if not change it to a data frame.
# b) Define a data frame with value 1st in Class variable, and value NO in Survived variable
# and variables Sex, Age and Freq.
#
#       Sex   Age Freq
# 1    Male Child    0
# 5  Female Child    0
# 9    Male Adult  118
# 13 Female Adult    4


output <- subset(data.frame(Titanic),
                 subset = Class=='1st' & Survived=='No',
                 select = c(Sex, Age, Freq))

utils.dump(list(output), 10)

##  output
##       Sex   Age Freq
## 1    Male Child    0
## 5  Female Child    0
## 9    Male Adult  118
## 13 Female Adult    4
