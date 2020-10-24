##
# This file is the introduction to R homework.
# Exercise 4
# File : ex4.R
#
# Exercises Link : https://www.r-exercises.com/2015/11/25/logical-vectors-and-operators/
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

utils.data <- mtcars

####################

#                  #

#    Exercise 1    #

#                  #

####################
#
# Use logical operators to output only those rows of  data  where column  mpg  is between 15 and 20 (excluding 15 and 20).

gather <- utils.data$mpg > 15 & utils.data$mpg < 20
res <- utils.data[gather,]
utils.dump(list(res), 1)

##  output
##                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C         17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE        16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL        17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC       15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Dodge Challenger  15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin       15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Pontiac Firebird  19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Ford Pantera L    15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino      19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Use logical operators to output only those rows of  data  where column  cyl  is equal to 6 and column am is not 0.

gather <- utils.data$cyl == 6 & utils.data$am != 0
res <- utils.data[gather,]
utils.dump(list(res), 2)

##  output
##                mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Ferrari Dino  19.7   6  145 175 3.62 2.770 15.50  0  1    5    6

####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Use logical operators to output only those rows of  data  where column  gear  or  carb  has the value 4.

gather <- utils.data$gear == 4 | utils.data$carb == 4
res <- utils.data[gather,]
utils.dump(list(res), 3)

##  output
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Use logical operators to output only the even rows of data.

gather <- c(FALSE, TRUE)
res <- utils.data[gather,]
utils.dump(list(res), 4)

##  output
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Use logical operators and change every fourth element in column  mpg  to 0.

gather <- c(FALSE, FALSE, FALSE, TRUE)
res <- utils.data
res$mpg[gather] <- 0
utils.dump(list(res), 5)

##  output
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive       0.0   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D            0.0   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Merc 450SE           0.0   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## Lincoln Continental  0.0   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla       0.0   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
## Camaro Z28           0.0   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa         0.0   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E           0.0   4 121.0 109 4.11 2.780 18.60  1  1    4    2


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# Output only those rows of  data  where columns  vs  and  am  have the same value 1, solve this without using  ==  operator.

gather <- utils.data$vs & utils.data$am
res <- utils.data[gather,]
utils.dump(list(res), 6)

##  output
##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# (TRUE + TRUE) * FALSE , what does this expression evaluate to and why?

res <- (TRUE + TRUE) * FALSE
utils.dump(list(res), 7)


##  answer
## The numeric value of TRUE is one. The numeric value of FALSE is zero
## So 
##  res <- (TRUE + TRUE) * FALSE
## is equal to
##  res <- (1 + 1) * 0
##
##  output
## [1] 0



####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# Output only those rows of  data  where at least  vs  or  am  have the value 1, solve this without using  ==  or  !=.

gather <- utils.data$vs | utils.data$am
res <- utils.data[gather,]
utils.dump(list(res), 8)

##  output
##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Explain the difference between  | ,  || ,  &  and  &&.

##  answer
## |  : Element-wise logical OR
## || : Logical OR
## &  : Element-wise logical AND
## && : Logical AND


####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Change all values that are 0 in the column  am  in  data  to 2.

res <- utils.data
res[res$am == 0,] <- 2
utils.dump(list(res), 10)

##  output
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive       2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Hornet Sportabout    2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Valiant              2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Duster 360           2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 240D            2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 230             2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 280             2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 280C            2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 450SE           2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 450SL           2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Merc 450SLC          2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Cadillac Fleetwood   2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Lincoln Continental  2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Chrysler Imperial    2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
## Toyota Corona        2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Dodge Challenger     2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## AMC Javelin          2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Camaro Z28           2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Pontiac Firebird     2.0   2   2.0   2 2.00 2.000  2.00  2  2    2    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


####################

#                  #

#    Exercise 11   #

#                  #

####################
#
# Add 2 to every element in the column  vs  without using numbers.

res <- utils.data
res$vs <- res$vs + TRUE + TRUE
utils.dump(list(res), 11)

##  output
##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  2  1    4    4
## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  2  1    4    4
## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  3  1    4    1
## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  3  0    3    1
## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  2  0    3    2
## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  3  0    3    1
## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  2  0    3    4
## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  3  0    4    2
## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  3  0    4    2
## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  3  0    4    4
## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  3  0    4    4
## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  2  0    3    3
## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  2  0    3    3
## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  2  0    3    3
## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  2  0    3    4
## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  2  0    3    4
## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  2  0    3    4
## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  3  1    4    1
## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  3  1    4    2
## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  3  1    4    1
## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  3  0    3    1
## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  2  0    3    2
## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  2  0    3    2
## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  2  0    3    4
## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  2  0    3    2
## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  3  1    4    1
## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  2  1    5    2
## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  3  1    5    2
## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  2  1    5    4
## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  2  1    5    6
## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  2  1    5    8
## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  3  1    4    2


####################

#                  #

#    Exercise 12   #

#                  #

####################
#
# Output only those rows of  data  where  vs  and  am  have different values, solve this without using  ==  or  !=.

gather <- (!utils.data$vs & utils.data$am) | (utils.data$vs & !utils.data$am)
res <- utils.data[gather,]
utils.dump(list(res), 12)

##  output
##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
## Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
