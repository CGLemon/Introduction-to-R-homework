##
# This file is the introduction to R homework.
# Exercise 9
# File Name : ex9.R
#
# Exercises Link : https://www.r-exercises.com/2016/09/26/replicating-plots-boxplot-exercises/
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

# boxplot(x, …)
# S3 method for formula
# boxplot(formula, data = NULL, …, subset, na.action = NULL,
#         xlab = mklab(y_var = horizontal),
#         ylab = mklab(y_var =!horizontal),
#         add = FALSE, ann = !add, horizontal = FALSE,
#         drop = FALSE, sep = ".", lex.order = FALSE)
#
# S3 method for default
# boxplot(x, …, range = 1.5, width = NULL, varwidth = FALSE,
#         notch = FALSE, outline = TRUE, names, plot = TRUE,
#         border = par("fg"), col = NULL, log = "",
#         pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
#         ann = !add, horizontal = FALSE, add = FALSE, at = NULL)
#
#  
# formula :
# a formula, such as y ~ grp, where y is a numeric vector of data values to be split into groups according to the grouping variable grp (usually a factor). Note that ~ g1 + g2 is equivalent to g1:g2.
#
# data :
# a data.frame (or list) from which the variables in formula should be taken.
#
# subset :
# an optional vector specifying a subset of observations to be used for plotting.
#
# na.action :
# a function which indicates what should happen when the data contain NAs. The default is to ignore missing values in either the response or the group.
#
# xlab, ylab :
# x- and y-axis annotation, since R 3.6.0 with a non-empty default. Can be suppressed by ann=FALSE.
#
# ann :
# logical indicating if axes should be annotated (by xlab and ylab).
# 
# drop, sep, lex.order :
# passed to split.default, see there.
#
# x :
# for specifying data from which the boxplots are to be produced. Either a numeric vector, or a single list containing such vectors. Additional unnamed arguments specify further data as separate vectors (each corresponding to a component boxplot). NAs are allowed in the data.
#
# … :
# For the formula method, named arguments to be passed to the default method.
#
# For the default method, unnamed arguments are additional data vectors (unless x is a list when they are ignored), and named arguments are arguments and graphical parameters to be passed to bxp in addition to the ones given by argument pars (and override those in pars). Note that bxp may or may not make use of graphical parameters it is passed: see its documentation.
#
# range :
# this determines how far the plot whiskers extend out from the box. If range is positive, the whiskers extend to the most extreme data point which is no more than range times the interquartile range from the box. A value of zero causes the whiskers to extend to the data extremes.
#
# width :
# a vector giving the relative widths of the boxes making up the plot.
#
# varwidth :
# if varwidth is TRUE, the boxes are drawn with widths proportional to the square-roots of the number of observations in the groups.
#
# notch :
# if notch is TRUE, a notch is drawn in each side of the boxes. If the notches of two plots do not overlap this is ‘strong evidence’ that the two medians differ (Chambers et al, 1983, p.62). See boxplot.stats for the calculations used.
#
# outline :
# if outline is not true, the outliers are not drawn (as points whereas S+ uses lines).
#
# names :
# group labels which will be printed under each boxplot. Can be a character vector or an expression (see plotmath).
#
# boxwex :
# a scale factor to be applied to all boxes. When there are only a few groups, the appearance of the plot can be improved by making the boxes narrower.
#
# staplewex :
# staple line width expansion, proportional to box width.
#
# outwex :
# outlier line width expansion, proportional to box width.
#
# plot :
# if TRUE (the default) then a boxplot is produced. If not, the summaries which the boxplots are based on are returned.
#
# border :
# an optional vector of colors for the outlines of the boxplots. The values in border are recycled if the length of border is less than the number of plots.
#
# col :
# if col is non-null it is assumed to contain colors to be used to colour the bodies of the box plots. By default they are in the background colour.
#
# log :
# character indicating if x or y or both coordinates should be plotted in log scale.
#
# pars :
# a list of (potentially many) more graphical parameters, e.g., boxwex or outpch; these are passed to bxp (if plot is true); for details, see there.
#
# horizontal :
# logical indicating if the boxplots should be horizontal; default FALSE means vertical boxes.
#
# add :
# logical, if true add boxplot to current plot.
#
# at :
# numeric vector giving the locations where the boxplots should be drawn, particularly when add = TRUE; defaults to 1:n where n is the number of boxes.
#
# xaxt :
# Plotting parameter for x-axis generation. Default is not to produce an x-axis.
#
# yaxt :
# Plotting parameter for y-axis generation. Default is not to produce an y-axis.
#
# outlty, outlwd, outpch, outcex, outcol, outbg:
# outlier line type, line width, point character, point size expansion, color, and background color. The default outlty = "blank" suppresses the lines and outpch = NA suppresses points.
#
# medlty, medlwd, medpch, medcex, medcol, medbg:
# median line type, line width, point character, point size expansion, color, and background color. The default medpch = NA suppresses the point, and medlty = "blank" does so for the line. Note that medlwd defaults to 3x the default lwd.
#


####################

#                  #

#    Exercise 1    #

#                  #

####################
#
# Make a default boxplot of Sepal.Width stratified by Species.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        main=utils.genEX(1, addition="Basic", strip=F))

####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Change the range of the y-axis so it starts at 2 and ends at 4.5.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        ylim=c(2, 4.5),
        main=utils.genEX(2, addition="Change y-axis range", strip=F))


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Modify the boxplot function so it doesn’t draw ticks nor labels of the x and y axes.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        xaxt='n',
        yaxt='n',
        main=utils.genEX(3, addition="Do not draw x and y axes", strip=F))


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Add notches (triangular dents around the median representing confidence intervals) to the boxes in the plot.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        notch=TRUE,
        main=utils.genEX(4, addition="Add notches", strip=F))

####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Increase the distance between boxes in the plot.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        boxwex=0.5,
        main=utils.genEX(5, addition="Increase the distance", strip=F))

####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Change the color of the box borders to blue.
#

boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        boxcol="blue",
        main=utils.genEX(6, addition="Change the color of the box borders", strip=F))

####################

#                  #

#    Exercise 7   #

#                  #

####################
#
# a. Change the color of the median lines to red.
# b. Change the line width of the median line to 1.
#

# Answer a.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        medcol="red",
        main=utils.genEX(7.1, addition="Change the color of the median", strip=F))

# Answer b.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        medlwd=1,
        main=utils.genEX(7.2, addition="Change the line width of the median line", strip=F))

####################

#                  #

#    Exercise 8   #

#                  #

####################
#
# a. Change the color of the outlier points to red.
# b. Change the symbol of the outlier points to “+”.
# c. Change the size of the outlier points to 0.8.
#

# Answer a.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        outcol="red",
        main=utils.genEX(8.1, addition="Change the color of the outlier points", strip=F))

# Answer b.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        outpch=3,
        main=utils.genEX(8.2, addition="Change the symbol of the outlier points", strip=F))

# Answer c.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        outcex=0.8,
        main=utils.genEX(8.3, addition="Change the size of the outlier points", strip=F))


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# a. Add the title to the boxplot (try to replicate the style of matlab’s boxplot).
# b. Add the y-axis label to the boxplot (try to replicate the style of matlab’s boxplot).
#

# Answer a.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        main=utils.genEX(9.1, addition="Add the title to the boxplot", strip=F))

# Answer b.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        main=utils.genEX(9.2, addition="Add the y-axis label to the boxplot", strip=F))
mtext("Sepal width in mm", 2, cex=0.9, line=2)

####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# a. Add x-axis (try to make it resemble the x-axis in the matlab’s boxplot)
# b. Add y-axis (try to make it resemble the y-axis in the matlab’s boxplot)
# c. Add the y-axis ticks on the other side.
#

lab <- format(as.character(pretty(c(2,4.5))), drop0trailing=TRUE, justify="right")

# Answer a.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        xaxt='n',
        yaxt='n',
        main=utils.genEX(10.1, addition="Add x-axis", strip=F))
axis(2, tck=0.02, at=pretty(c(2,4.5)), labels=lab, las=1, hadj=0.3)

# Answer b.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        xaxt='n',
        yaxt='n',
        main=utils.genEX(10.2, addition="Add y-axis", strip=F))
axis(4, tck=0.02, labels=FALSE)

# Answer c.
boxplot(formula=Sepal.Width ~ Species,
        data=iris,
        xaxt='n',
        yaxt='n',
        main=utils.genEX(10.3, addition="Add the y-axis ticks on the other side", strip=F))
axis(1, at=1:3, labels=unique(iris$Species), tck=0, padj=-1)


# Final.
boxplot(formula=Sepal.Width ~ Species,
        data=iris, ylim=c(2, 4.5),
        xaxt='n', yaxt='n',
        notch=TRUE,
        boxwex=0.5,
        boxcol="blue",
        medcol="red",
        medlwd=1,
        outcol="red",
        outpch=3,
        outcex=0.8,
        main=utils.genEX(10.4, addition="Comparison of three species in the Fisher iris data", strip=F))

mtext("Sepal width in mm", 2, cex=0.9, line=2)
lab <- format(as.character(pretty(c(2,4.5))), drop0trailing=TRUE, justify="right")
axis(2, tck=0.02, at=pretty(c(2,4.5)), labels=lab, las=1, hadj=0.3)
axis(4, tck=0.02, labels=FALSE)
axis(1, at=1:3, labels=unique(iris$Species), tck=0, padj=-1)



