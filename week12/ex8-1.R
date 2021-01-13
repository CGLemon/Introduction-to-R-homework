##
# This file is the introduction to R homework.
# Exercise 8-1
# File Name : ex8-1.R
#
# Exercises Link : https://www.r-exercises.com/2016/03/11/start-plotting-data-3/
#

utils.assert <- function(fact, proposition) {
    if (proposition == FALSE) {
        cat("Proposition is not satisfied \n")
        cat(" Invaild proposition : '", fact, "' \n", sep = "")
        stopifnot(FALSE)
    }
}

utils.genEX <- function(cnt, colon = TRUE) {
    if (colon) {
        return (paste("Exercise", cnt, ":\n"))
    }
    return (paste("Exercise", cnt, "\n"))
}

utils.dump <- function(answers, cnt = 0) {

    utils.assert("The output answer(s) must be list",
                     is.list(answers))
    utils.assert("The number of output answer(s) must be great than zero", 
                     length(answers) > 0)
    utils.assert("The count must be numeric", is.numeric(cnt))

    cat(rep("~", 40), "\n", sep = "")
    cat(utils.genEX(cnt))
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

attach(mtcars) # Get the data from mtcars.

####################

#                  #

#    Exercise 1    #

#                  #

####################
#
# Plot Miles/(US) gallon versus Rear axle ratio by plot(mpg,drat) . On which axis does mpg appear?
# a. mpg appears on the x axis
# b. mpg appears on the y axis
#

plot(x=mpg, y=drat, main=utils.genEX(1, F))

# answer
#   a. mpg appears on the x axis


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Is a scatterplot recommended for continuous or dichotomous variables?
# a. continuous
# b. dichotomous
#

# answer
#   a. continuous


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Produce a histogram with hist(gear). What do you see?
# a. frequencies
# b. probability density
#

hist(x=gear, main=utils.genEX(3, F))

# answer
#   a. frequencies

####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Change type of visualization of our scatterplot in Exercise 1 plot(mpg,drat,type=""). If we want to see lines what we have to type into “”:
# a.type=”l”
# b.type=”p”
#

plot(mpg, drat, type="l", main=utils.genEX(4.1, F))
plot(mpg, drat, type="p", main=utils.genEX(4.2, F))

# answer
#   a.type=”l”

####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Now we want to see both point and lines in our plot. What we have to type into
# plot(mpg,drat,type=""):
# a.type=c(“p”,”l”)
# b.type=”b”
#

# plot(mpg, drat, type=c("p", "l"), main=utils.genEX(5, F)) # invalid
plot(x=mpg, y=drat, type="b", main=utils.genEX(5, F))

# answer
#   b.type=”b”


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Add another variable to our plot, for example Weight. What command do we have to use:
# a.plot(mpg, drat); plot(mpg, wt)
# b.plot(mpg, drat); points(mpg, wt)
#

plot(x=mpg, y=drat, main=utils.genEX(6, F)); points(x=mpg, y=wt)

# answer
#   b.plot(mpg, drat); points(mpg, wt)

####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Now we have added a new variable to our plot. Suppose we want to use two different colours to separate the points. Type plot(mpg, drat, col=2) :
# What colour have we selected:
# a. red
# b. green
#

plot(x=mpg, y=drat, col=2, main=utils.genEX(7, F))

# answer
#   a. red 

####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Now we want to differentiate the two different variables in the scatterplot:
# a. Let’s change the colours of the second plot
# b. Change use two different types of plot (e.g. points,lines)
#

plot(mpg, drat, col=2, main=utils.genEX(8.1, F)); points(x=mpg, y=wt, col=3)
plot(mpg, drat, col=2, type="l", main=utils.genEX(8.1, F)); lines(x=mpg, y=wt, col=3)

####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Now we want to highlight a variable in the final plot.
# Type: plot(mpg, drat, lwd=2) ; points(mpg, wt, lwd=1). Which plot is highlighted:
# a. (mpg, drat)
# b. (mpg, wt)
#

plot(x=mpg, y=drat, lwd=2, main=utils.genEX(9, F)) ; points(x=mpg, y=wt, lwd=1)

# answer
#   a. (mpg, drat)

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Finally choose four different continuous variables from mtcars set and produce:
# a.Plot with lines and points for different variables with different colours (hint: change
# y axis parameters by adding command ylim=c(0,30) to plot [e.g. plot(a,b,type="p",ylim=c(0,30)).
# b.Choose one variable from each and highlighted it set red colour and a broad line
#

# answer a
plot(x=mpg, y=drat, col=2, lwd=2, ylim=c(0,30), main=utils.genEX(10.1, F))
points(x=mpg, y=wt, col=3)
points(x=mpg, y=qsec, col=4)

# answer b
plot(x=mpg, y=drat, col=2, type="l", ylim=c(0,30), main=utils.genEX(10.1, F))
lines(x=mpg, y=wt, col=3, lwd=2)
lines(x=mpg, y=qsec, col=4)
