##
# This file is the introduction to R homework.
# Exercise 8-2
# File Name : ex8-2.R
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
# Create a scatterplot of mpg (x-axis) against drat (y-axis) and add a label to the x-axis. Which of the following statements is correct:
# a. plot(mpg,drat,xaxis="Miles per gallon")
# b. plot(mpg,drat,xlab="Miles per gallon")
#

# plot(mpg, drat, xaxis="Miles per gallon", main=utils.genEX(1, F)) # invalid
plot(x=mpg, y=drat, xlab="Miles per gallon", main=utils.genEX(1, F))

# answer
#   b. plot(mpg,drat,xlab="Miles per gallon")

####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# We just saw how to customize the label on the x-axis. For the next exercise:
# a. Customize the y-axis label like we customized the x-axis in the previous exercise..
# b. Produce a plot customizing x and y axis, range and colours. Choose a range for x axis from 0 to 40, for y axis from 0 to 7, red colour and highlighted points.
#

# answer a
plot(x=mpg, y=drat, xlab="Miles per gallon", ylab="Rear axle ratio", main=utils.genEX(2.1, F))

# answer b
plot(x=mpg, y=drat, xlab="Miles per gallon", ylab="Rear axle ratio", xlim=c(0,30), col=2, lwd=2, ylim=c(0,7), main=utils.genEX(2.2, F))

####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# We have to add a title to our plot. What command do we have to type?
# a. plot(mpg,drat,main="Miles vs Rar")
# b. plot(mpg,drat,title="Miles vs Rar")
#

# plot(x=mpg, y=drat, title="Miles vs Rar") # invalid
plot(x=mpg, y=drat, main="Miles vs Rar")

# answer
#  b. plot(mpg,drat,title="Miles vs Rar")

####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# We just saw how to add labels, titles and custom details such as colours and the size of points. Now we will
# have to construct our plot in different stages. Firstly we have to plot our data, secondly we will add axes, title and text.
# a.Plot our data specifying that axes haven’t to be plotted.
# b.Add axes, labels and text afterwards
#

plot(x=mpg, y=drat, axes=F)
axis(side=1, at=c(0,40))
axis(side=2, at=c(0,10))
mtext("Miles vs Rar", side=3)
mtext("Miles", side=1)
mtext("Miscellaneous", side=2)


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Now we want to add a legend to our plot. Which statement is correct?
# a. plot(mpg,drat,legend=1)
# b. plot(mpg,drat);legend()
#

plot(x=mpg, y=drat, main=utils.genEX(5, F)); points(x=mpg, y=wt, col=2)
legend("topright", legend=c("Rar","Wt"), col=c(1:2), ncol=2, pch=1)

# answer
#   b. plot(mpg,drat);legend()

####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Customize our legend:
# a.Use different types of symbols, colours, background colours and position.
# b.Insert new variables to our plot and then customize the legend
#


# answer a
plot(x=mpg, y=drat, pch=2 , main=utils.genEX(6.1, F))
points(x=mpg, y=wt, col=3, pch=2)
legend("bottomright", legend=c("Rar","Wt"), col=c(1,3), ncol=3, pch=2, bg="light blue")

# answer b
plot(x=mpg, y=drat, main=utils.genEX(6.2, F))
points(x=mpg, y=wt, col=3, pch=3)
points(x=mpg, y=cyl, col=2, pch=2)
legend("bottomright", legend=c("Rar","Cyl","Wt"), col=c(1:3), ncol=3, pch=1:3, bg="light blue")


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# Finally, we will build a plot using four continuous variables in two stages:
# a. plot two variables at a time, eliminating axes. Introduce axes and labels afterwards.
# b. Insert a legend using diffent colours and adifferent symbol for every variable. Put the legend in a top right position using x and y coordinates.
#

# answer a
plot(x=mpg, y=drat, axes=F, xlab="", ylab="")
points(x=mpg, y=wt, pch=2, col=2, xlab="", ylab="")
points(x=mpg, y=cyl, pch=3, col=3, xlab="", ylab="")
axis(side=1, at=c(0,40))
axis(side=2, at=c(0,30))
mtext("Miles vs Miscellaneous", side=3)
mtext("Miles", side=1)
mtext("Miscellaneous", side=2)

# answer b
legend("topright", legend=c("Rar","Weight","Cyl"), col=c(1:3), ncol=3, pch=1:3, bg="light blue")
