##
# This file is the introduction to R homework.
# Exercise 10
# File Name : ex10.R
#
# Exercises Link : https://www.r-exercises.com/2016/09/23/advanced-base-graphics-exercises/
#

utils.assert <- function(fact, proposition) {
    if (proposition == FALSE) {
        cat("Proposition is not satisfied \n")
        cat(" Invaild proposition : '", fact, "' \n", sep="")
        stopifnot(proposition)
    }
}

utils.genEX <- function(cnt, colon=TRUE, addition="", strip=TRUE) {

    sub <- paste("Exercise", cnt)

    if (colon) {
        sub <- paste(sub, ":")
    }

    if (addition != "") {
        sub <- paste(sub, addition)
    }

    if (strip) {
        sub <- paste(sub, "\n")      
    }

    return (sub)
}

utils.dump <- function(answers, cnt=0) {

    utils.assert("The output answer(s) must be list",
                     is.list(answers))
    utils.assert("The number of output answer(s) must be great than zero", 
                     length(answers) > 0)
    utils.assert("The count must be numeric", is.numeric(cnt))

    cat(rep("~", 40), "\n", sep="")
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

####################

#                  #

#    Exercise 1    #

#                  #

####################
# 
# a)Load the cars dataset and create a scatterplot of the data.
#
# b)Using the argument lab of the function plot create a new scatterplot where the thickmarks of the x and y axis specify every integer.
#

# anwser a.
plot(cars, main=utils.genEX(1.1, FALSE))

# anwser b.
plot(cars, lab=c(20,10,6), main=utils.genEX(1.2, FALSE, strip=FALSE))


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# The previous plot didn’t showed all the numbers associated to the new thickmarks, so we are going to fix them.
# Recreate the same plot from the previous question and using the argument cex.axis control the size of the numbers
# associated to the axes thickmarks so they can be small enough to be visible.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, main=utils.genEX(2, FALSE, strip=FALSE))


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# On the previous plot the numbers associated to the y-axis thickmarks aren’t easy to read. Recreate the plot
# from the last exercise and use the argument las to change the orientation of the labels from vertical to horizontal.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, main=utils.genEX(3, FALSE, strip=FALSE))
points(x=c(230,26), y=c(60,61), col="red")


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Suppose you want to add two new observations to the previous plot, but you want to identify them on the graph.
# Using the points function add the new observations to the last plot using red to identify them. The values of
# the new observation are speed = 23, 26 and dist = 60, 61.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, main=utils.genEX(4, FALSE, strip=FALSE))
points(x=c(23,26), y=c(60,61), col="red")

####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# As you could see the previous plot doesn’t show one of the new observations because is out the x-axis range.
#
# a)Create again the plot for the old observations with an x-axis range that includes all the values from 4 to 26.
#
# b)Add the two new observations using the points function.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, xlim=c(4,26), main=utils.genEX(5, FALSE, strip=FALSE))
points(x=c(23,26), y=c(60,61), col="red")

####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# After running a linear regression to the original data you find out that a = -17.5 and b = 3.93. Using the function abline
# add the linear regression to the plot using blue and a dashed line.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, xlim=c(4,26), main=utils.genEX(6, FALSE, strip=FALSE))
points(x=c(23,26), y=c(60,61), col="red")
abline(a=-17.5, b=3.93, col="blue", lty=2)


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Using the function title and expression add the following title “Regression: β 0 = -17.3, β 1 = -3.93″.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, xlim=c(4,26), main=utils.genEX(7, FALSE, strip=FALSE))
points(x=c(23,26), y=c(60,61), col="red")
abline(a=-17.5, b=3.93, col="blue", lty=2)
title(expression(paste("Regression : ",beta[0], "= -17.5, ", beta[1], "= -3.93")))

####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Add to the previous plot a legend on the top left corner that shows which color is assigned to old observations and which one to new ones.
#

plot(cars, lab=c(20,10,6), cex.axis=.6, las=1, xlim=c(4,26), main=utils.genEX(8, FALSE, strip=FALSE))
points(x=c(23,26), y=c(60,61), col="red")
abline(a=-17.5, b=3.93, col="blue", lty=2)
title(expression(paste("Regression : ",beta[0], "= -17.5, ", beta[1], "= -3.93")))
legend(5,100,c("Old", "New"), col=1:2, pch=1)

####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# This exercise will test your skills to create more than one plot in the same layout. Using the functions par and mfrow.
# Create on the same layout two histograms, one for each column of the cars data.
#

par(mfrow=c(1,2))
hist(cars[,1], xlab="Speed", main=utils.genEX(9.1, addition="Speed histogram" ,strip=FALSE))
hist(cars[,2], xlab="Distance", main=utils.genEX(9.2, addition="Distance histogram",strip=FALSE))

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Using the function layout print on the same layout 3 plots, on the left side a scatterplot of cars, on the top right the histogram
# of the column speed of the data cars, and on the bottom right an histogram of the column distance.
#

layout(matrix(c(1,1,2,3), ncol=2))
plot(cars, las=1, main=utils.genEX(10.1, FALSE))
hist(cars[,1], xlab="Speed", main=utils.genEX(10.2, addition="Speed histogram" ,strip=FALSE))
hist(cars[,2], xlab="Distance", main=utils.genEX(10.3, addition="Distance histogram",strip=FALSE))







