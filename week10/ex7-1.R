##
# This file is the introduction to R homework.
# Exercise 7-1
# File Name : ex7-1.R
#
# Exercises Link : https://www.r-exercises.com/2016/01/04/data-frame-exercises/
#

utils.dump <- function(answers, cnt = 0) {
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
# Create the following data frame, afterwards invert Sex for all individuals
#


data <- data.frame(row.names = c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline"),
                   Age       = c(25, 31, 23, 52, 76, 49, 26),
                   Height    = c(177, 163, 190, 179, 163, 183, 164),
                   Weight    = c(57, 69, 83, 75, 70, 83, 53),
                   Sex       = c("F", "F", "M", "M", "F", "M", "F"))
out1 <- data
levels(data$Sex) <- c("M", "F")
out2 <- data

utils.dump(list(out1, out2), 1)

##  output 1 :
##          Age Height Weight Sex
## Alex      25    177     57   F
## Lilly     31    163     69   F
## Mark      23    190     83   M
## Oliver    52    179     75   M
## Martha    76    163     70   F
## Lucas     49    183     83   M
## Caroline  26    164     53   F
##
##  output 2 :
##          Age Height Weight Sex
## Alex      25    177     57   M
## Lilly     31    163     69   M
## Mark      23    190     83   F
## Oliver    52    179     75   F
## Martha    76    163     70   M
## Lucas     49    183     83   F
## Caroline  26    164     53   M


####################

#                  #

#    Exercise 2    #

#                  #

####################
#
# Create this data frame (make sure you import the variable Working as character and not factor).
#
# Add this data frame column-wise to the previous one.
# a) How many rows and columns does the new data frame have?
# b) What class of data is in each column?
#


adata <- data.frame(row.names =  c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline"),
                    Working = c("Yes", "No", "No", "Yes", "Yes", "No", "Yes"))

data <- cbind (data, adata)

dim <- dim(data)
class <- sapply(data, class)

utils.dump(list(dim, class), 2)

##  output 1 :
## [1] 7 5
##
##  output 2 :
##       Age    Height    Weight       Sex   Working 
## "numeric" "numeric" "numeric"  "factor"  "factor" 


####################

#                  #

#    Exercise 3    #

#                  #

####################
#
# Check what class of data is the (built-in data set) state.center and convert it to data frame.
#

class <- class(state.center)
data <- as.data.frame(state.center)

utils.dump(list(class, data), 3)


##  output 1 :
## [1] "list"
##
##  output 2 :
##            x       y
## 1   -86.7509 32.5901
## 2  -127.2500 49.2500
## 3  -111.6250 34.2192
## 4   -92.2992 34.7336
## 5  -119.7730 36.5341
## 6  -105.5130 38.6777
## 7   -72.3573 41.5928
## 8   -74.9841 38.6777
## 9   -81.6850 27.8744
## 10  -83.3736 32.3329
## 11 -126.2500 31.7500
## 12 -113.9300 43.5648
## 13  -89.3776 40.0495
## 14  -86.0808 40.0495
## 15  -93.3714 41.9358
## 16  -98.1156 38.4204
## 17  -84.7674 37.3915
## 18  -92.2724 30.6181
## 19  -68.9801 45.6226
## 20  -76.6459 39.2778
## 21  -71.5800 42.3645
## 22  -84.6870 43.1361
## 23  -94.6043 46.3943
## 24  -89.8065 32.6758
## 25  -92.5137 38.3347
## 26 -109.3200 46.8230
## 27  -99.5898 41.3356
## 28 -116.8510 39.1063
## 29  -71.3924 43.3934
## 30  -74.2336 39.9637
## 31 -105.9420 34.4764
## 32  -75.1449 43.1361
## 33  -78.4686 35.4195
## 34 -100.0990 47.2517
## 35  -82.5963 40.2210
## 36  -97.1239 35.5053
## 37 -120.0680 43.9078
## 38  -77.4500 40.9069
## 39  -71.1244 41.5928
## 40  -80.5056 33.6190
## 41  -99.7238 44.3365
## 42  -86.4560 35.6767
## 43  -98.7857 31.3897
## 44 -111.3300 39.1063
## 45  -72.5450 44.2508
## 46  -78.2005 37.5630
## 47 -119.7460 47.4231
## 48  -80.6665 38.4204
## 49  -89.9941 44.5937
## 50 -107.2560 43.0504


####################

#                  #

#    Exercise 4    #

#                  #

####################
#
# Create a simple data frame from 3 vectors. Order the entire data frame by the first column.
#

set.seed(123456789)
v <- ceiling(runif(9) * 20) + 20
b <- LETTERS[rep(1:3, 3)]
n <- round(rnorm(9, 65, 5))

data <- data.frame(Age = v, Class = b, Grade = n)
data <- data[order(data$Age), ]  

utils.dump(list(data), 4)

##  output
##
##   Age Class Grade
## 7  25     A    67
## 9  26     C    71
## 1  34     A    64
## 2  34     B    70
## 3  34     C    60
## 4  35     A    62
## 6  38     C    68
## 5  39     B    56
## 8  39     B    56


####################

#                  #

#    Exercise 5    #

#                  #

####################
#
# Create a data frame from a matrix of your choice, change the row names so every row says
# id_i (where i is the row number) and change the column names to variable_i (where i is the column number).
# I.e., for column 1 it will say variable_1, and for row 2 will say id_2 and so on.


rowsize <- 5
colsize <- 5
matr <- matrix(c(1:(rowsize*rowsize)), ncol = colsize) 


data <- as.data.frame(matr)
colnames(data) <- paste("variable_", 1:ncol(data))
rownames(data) <- paste("id_", 1:nrow(data))
utils.dump(list(data), 5)

##  output 
##       variable_ 1 variable_ 2 variable_ 3 variable_ 4 variable_ 5
## id_ 1           1           6          11          16          21
## id_ 2           2           7          12          17          22
## id_ 3           3           8          13          18          23
## id_ 4           4           9          14          19          24
## id_ 5           5          10          15          20          25


####################

#                  #

#    Exercise 6    #

#                  #

####################
#
# For this exercise, we’ll use the (built-in) dataset VADeaths.
#
# a) Make sure the object is a data frame, if not change it to a data frame.
# b) Create a new variable, named Total, which is the sum of each row.
# c) Change the order of the columns so total is the first variable.


data <- as.data.frame(VADeaths)
type <- class(data)


data$Total <- data[, 1] + data[, 2] + data[, 3] + data[, 4]
data$Total <- rowSums(data[1:4])   
out2 <- data

data <- data[, c(5, 1:4)]
out3 <- data

utils.dump(list(type, out2, out3), 6)

##  output 1 :
## [1] "data.frame"
##
##  output 2 :
##       Rural Male Rural Female Urban Male Urban Female Total
## 50-54       11.7          8.7       15.4          8.4  44.2
## 55-59       18.1         11.7       24.3         13.6  67.7
## 60-64       26.9         20.3       37.0         19.3 103.5
## 65-69       41.0         30.9       54.6         35.1 161.6
## 70-74       66.0         54.3       71.1         50.0 241.4
##
##  output 3 :
##       Total Rural Male Rural Female Urban Male Urban Female
## 50-54  44.2       11.7          8.7       15.4          8.4
## 55-59  67.7       18.1         11.7       24.3         13.6
## 60-64 103.5       26.9         20.3       37.0         19.3
## 65-69 161.6       41.0         30.9       54.6         35.1
## 70-74 241.4       66.0         54.3       71.1         50.0


####################

#                  #

#    Exercise 7    #

#                  #

####################
#
# For this exercise we’ll use the (built-in) dataset state.x77.
#
# a) Make sure the object is a data frame, if not change it to a data frame.
# b) Find out how many states have an income of less than 4300.
# c) Find out which is the state with the highest income.




data <- as.data.frame(state.x77)
type <- class(data)

cnt <- nrow(subset(data, data$Income < 4300))

names <- row.names(data)[(which(max(data$Income) == data$Income))]

utils.dump(list(type, cnt, names), 7)

##  output 1 :
## [1] "data.frame"
##
##  output 2 :
## [1] 20
##
##  output 3 :
## [1] "Alaska"

####################

#                  #

#    Exercise 8    #

#                  #

####################
#
# With the dataset swiss, create a data frame of only the rows 1, 2, 3, 10, 11, 12 and 13, and only the variables Examination, Education and Infant.Mortality.
#
# a) The infant mortality of Sarine is wrong, it should be a NA, change it.
# b) Create a row that will be the total sum of the column, name it Total.
# c) Create a new variable that will be the proportion of Examination (Examination / Total)

data <- swiss[c(1:3, 10:13), c("Examination", "Education", "Infant.Mortality")]



data[4, 3] <- NA
out1 <- data

data["Total",] <- c(sum(data$Examination), sum(data$Education), sum(data$Infant.Mortality, na.rm = TRUE))
out2 <- data

data$proportion <- round(data$Examination / data["Total", "Examination"], 3)
out3 <- data

utils.dump(list(out1, out2, out3), 8)

##  output 1 :
##              Examination Education Infant.Mortality
## Courtelary            15        12             22.2
## Delemont               6         9             22.2
## Franches-Mnt           5         5             20.2
## Sarine                16        13               NA
## Veveyse               14         6             24.5
## Aigle                 21        12             16.5
## Aubonne               14         7             19.1
##
##  output 2 :
##              Examination Education Infant.Mortality
## Courtelary            15        12             22.2
## Delemont               6         9             22.2
## Franches-Mnt           5         5             20.2
## Sarine                16        13               NA
## Veveyse               14         6             24.5
## Aigle                 21        12             16.5
## Aubonne               14         7             19.1
## Total                 91        64            124.7
##
##  output 3 :
##              Examination Education Infant.Mortality proportion
## Courtelary            15        12             22.2      0.165
## Delemont               6         9             22.2      0.066
## Franches-Mnt           5         5             20.2      0.055
## Sarine                16        13               NA      0.176
## Veveyse               14         6             24.5      0.154
## Aigle                 21        12             16.5      0.231
## Aubonne               14         7             19.1      0.154
## Total                 91        64            124.7      1.000

####################

#                  #

#    Exercise 9    #

#                  #

####################
#
# Create a data frame with the datasets state.abb, state.area,
# state.division, state.name, state.region. The row names should be the names of the states.
#
# a) Rename the column names so only the first 3 letters after the full stop appear (e.g. States.abb will be abb).

data <- data.frame(state.abb, state.area, state.division, state.region, row.names = state.name)
out1 <- data
names(data) <- substr(names(data), 7, 9)
out2 <- data

utils.dump(list(out1, out2), 9)

##  output 1 :
##                state.abb state.area     state.division  state.region
## Alabama               AL      51609 East South Central         South
## Alaska                AK     589757            Pacific          West
## Arizona               AZ     113909           Mountain          West
## Arkansas              AR      53104 West South Central         South
## California            CA     158693            Pacific          West
## Colorado              CO     104247           Mountain          West
## Connecticut           CT       5009        New England     Northeast
## Delaware              DE       2057     South Atlantic         South
## Florida               FL      58560     South Atlantic         South
## Georgia               GA      58876     South Atlantic         South
## Hawaii                HI       6450            Pacific          West
## Idaho                 ID      83557           Mountain          West
## Illinois              IL      56400 East North Central North Central
## Indiana               IN      36291 East North Central North Central
## Iowa                  IA      56290 West North Central North Central
## Kansas                KS      82264 West North Central North Central
## Kentucky              KY      40395 East South Central         South
## Louisiana             LA      48523 West South Central         South
## Maine                 ME      33215        New England     Northeast
## Maryland              MD      10577     South Atlantic         South
## Massachusetts         MA       8257        New England     Northeast
## Michigan              MI      58216 East North Central North Central
## Minnesota             MN      84068 West North Central North Central
## Mississippi           MS      47716 East South Central         South
## Missouri              MO      69686 West North Central North Central
## Montana               MT     147138           Mountain          West
## Nebraska              NE      77227 West North Central North Central
## Nevada                NV     110540           Mountain          West
## New Hampshire         NH       9304        New England     Northeast
## New Jersey            NJ       7836    Middle Atlantic     Northeast
## New Mexico            NM     121666           Mountain          West
## New York              NY      49576    Middle Atlantic     Northeast
## North Carolina        NC      52586     South Atlantic         South
## North Dakota          ND      70665 West North Central North Central
## Ohio                  OH      41222 East North Central North Central
## Oklahoma              OK      69919 West South Central         South
## Oregon                OR      96981            Pacific          West
## Pennsylvania          PA      45333    Middle Atlantic     Northeast
## Rhode Island          RI       1214        New England     Northeast
## South Carolina        SC      31055     South Atlantic         South
## South Dakota          SD      77047 West North Central North Central
## Tennessee             TN      42244 East South Central         South
## Texas                 TX     267339 West South Central         South
## Utah                  UT      84916           Mountain          West
## Vermont               VT       9609        New England     Northeast
## Virginia              VA      40815     South Atlantic         South
## Washington            WA      68192            Pacific          West
## West Virginia         WV      24181     South Atlantic         South
## Wisconsin             WI      56154 East North Central North Central
## Wyoming               WY      97914           Mountain          West
##
##  output 2 :
##                abb    are                div           reg
## Alabama         AL  51609 East South Central         South
## Alaska          AK 589757            Pacific          West
## Arizona         AZ 113909           Mountain          West
## Arkansas        AR  53104 West South Central         South
## California      CA 158693            Pacific          West
## Colorado        CO 104247           Mountain          West
## Connecticut     CT   5009        New England     Northeast
## Delaware        DE   2057     South Atlantic         South
## Florida         FL  58560     South Atlantic         South
## Georgia         GA  58876     South Atlantic         South
## Hawaii          HI   6450            Pacific          West
## Idaho           ID  83557           Mountain          West
## Illinois        IL  56400 East North Central North Central
## Indiana         IN  36291 East North Central North Central
## Iowa            IA  56290 West North Central North Central
## Kansas          KS  82264 West North Central North Central
## Kentucky        KY  40395 East South Central         South
## Louisiana       LA  48523 West South Central         South
## Maine           ME  33215        New England     Northeast
## Maryland        MD  10577     South Atlantic         South
## Massachusetts   MA   8257        New England     Northeast
## Michigan        MI  58216 East North Central North Central
## Minnesota       MN  84068 West North Central North Central
## Mississippi     MS  47716 East South Central         South
## Missouri        MO  69686 West North Central North Central
## Montana         MT 147138           Mountain          West
## Nebraska        NE  77227 West North Central North Central
## Nevada          NV 110540           Mountain          West
## New Hampshire   NH   9304        New England     Northeast
## New Jersey      NJ   7836    Middle Atlantic     Northeast
## New Mexico      NM 121666           Mountain          West
## New York        NY  49576    Middle Atlantic     Northeast
## North Carolina  NC  52586     South Atlantic         South
## North Dakota    ND  70665 West North Central North Central
## Ohio            OH  41222 East North Central North Central
## Oklahoma        OK  69919 West South Central         South
## Oregon          OR  96981            Pacific          West
## Pennsylvania    PA  45333    Middle Atlantic     Northeast
## Rhode Island    RI   1214        New England     Northeast
## South Carolina  SC  31055     South Atlantic         South
## South Dakota    SD  77047 West North Central North Central
## Tennessee       TN  42244 East South Central         South
## Texas           TX 267339 West South Central         South
## Utah            UT  84916           Mountain          West
## Vermont         VT   9609        New England     Northeast
## Virginia        VA  40815     South Atlantic         South
## Washington      WA  68192            Pacific          West
## West Virginia   WV  24181     South Atlantic         South
## Wisconsin       WI  56154 East North Central North Central
## Wyoming         WY  97914           Mountain          West


####################

#                  #

#    Exercise 10   #

#                  #

####################
#
# Add the previous data frame column-wise to state.x77
#
# a) Remove the variable div.
# b) Also remove the variables Life Exp, HS Grad, Frost, abb, and are.
# c) Add a variable to the data frame which should categorize the level of illiteracy:
#    [0,1) is low, [1,2) is some, [2, inf) is high.
# d) Find out which state from the west, with low illiteracy, has the highest income, and what that income is.

adata <- cbind(state.x77, data)

adata$div <- NULL
out1 <- adata


adata <- subset(adata, ,-c(4, 6, 7, 9, 10))
out2 <- adata

adata$illi <- ifelse(adata$Illiteracy < 1,
                     "Low Illiteracy",
                     ifelse(adata$Illiteracy >= 1 & adata$Illiteracy < 2,
                            "Some Illiteracy",
                            "High Illiteracy"))
out3 <- adata


sub <- subset(adata, illi == "Low Illiteracy" & reg == "West")
max <- max(sub$Income)
stat <- row.names(sub)[which (sub$Income == max)]

utils.dump(list(out1, out2, out3, max, stat), 10)

##  output 1 :
##                Population Income Illiteracy Life Exp Murder HS Grad Frost
## Alabama              3615   3624        2.1    69.05   15.1    41.3    20
## Alaska                365   6315        1.5    69.31   11.3    66.7   152
## Arizona              2212   4530        1.8    70.55    7.8    58.1    15
## Arkansas             2110   3378        1.9    70.66   10.1    39.9    65
## California          21198   5114        1.1    71.71   10.3    62.6    20
## Colorado             2541   4884        0.7    72.06    6.8    63.9   166
## Connecticut          3100   5348        1.1    72.48    3.1    56.0   139
## Delaware              579   4809        0.9    70.06    6.2    54.6   103
## Florida              8277   4815        1.3    70.66   10.7    52.6    11
## Georgia              4931   4091        2.0    68.54   13.9    40.6    60
## Hawaii                868   4963        1.9    73.60    6.2    61.9     0
## Idaho                 813   4119        0.6    71.87    5.3    59.5   126
## Illinois            11197   5107        0.9    70.14   10.3    52.6   127
## Indiana              5313   4458        0.7    70.88    7.1    52.9   122
## Iowa                 2861   4628        0.5    72.56    2.3    59.0   140
## Kansas               2280   4669        0.6    72.58    4.5    59.9   114
## Kentucky             3387   3712        1.6    70.10   10.6    38.5    95
## Louisiana            3806   3545        2.8    68.76   13.2    42.2    12
## Maine                1058   3694        0.7    70.39    2.7    54.7   161
## Maryland             4122   5299        0.9    70.22    8.5    52.3   101
## Massachusetts        5814   4755        1.1    71.83    3.3    58.5   103
## Michigan             9111   4751        0.9    70.63   11.1    52.8   125
## Minnesota            3921   4675        0.6    72.96    2.3    57.6   160
## Mississippi          2341   3098        2.4    68.09   12.5    41.0    50
## Missouri             4767   4254        0.8    70.69    9.3    48.8   108
## Montana               746   4347        0.6    70.56    5.0    59.2   155
## Nebraska             1544   4508        0.6    72.60    2.9    59.3   139
## Nevada                590   5149        0.5    69.03   11.5    65.2   188
## New Hampshire         812   4281        0.7    71.23    3.3    57.6   174
## New Jersey           7333   5237        1.1    70.93    5.2    52.5   115
## New Mexico           1144   3601        2.2    70.32    9.7    55.2   120
## New York            18076   4903        1.4    70.55   10.9    52.7    82
## North Carolina       5441   3875        1.8    69.21   11.1    38.5    80
## North Dakota          637   5087        0.8    72.78    1.4    50.3   186
## Ohio                10735   4561        0.8    70.82    7.4    53.2   124
## Oklahoma             2715   3983        1.1    71.42    6.4    51.6    82
## Oregon               2284   4660        0.6    72.13    4.2    60.0    44
## Pennsylvania        11860   4449        1.0    70.43    6.1    50.2   126
## Rhode Island          931   4558        1.3    71.90    2.4    46.4   127
## South Carolina       2816   3635        2.3    67.96   11.6    37.8    65
## South Dakota          681   4167        0.5    72.08    1.7    53.3   172
## Tennessee            4173   3821        1.7    70.11   11.0    41.8    70
## Texas               12237   4188        2.2    70.90   12.2    47.4    35
## Utah                 1203   4022        0.6    72.90    4.5    67.3   137
## Vermont               472   3907        0.6    71.64    5.5    57.1   168
## Virginia             4981   4701        1.4    70.08    9.5    47.8    85
## ## Washington           3559   4864        0.6    71.72    4.3    63.5    32
## West Virginia        1799   3617        1.4    69.48    6.7    41.6   100
## Wisconsin            4589   4468        0.7    72.48    3.0    54.5   149
## Wyoming               376   4566        0.6    70.29    6.9    62.9   173
##                  Area abb    are           reg
## Alabama         50708  AL  51609         South
## Alaska         566432  AK 589757          West
## Arizona        113417  AZ 113909          West
## Arkansas        51945  AR  53104         South
## California     156361  CA 158693          West
## Colorado       103766  CO 104247          West
## Connecticut      4862  CT   5009     Northeast
## Delaware         1982  DE   2057         South
## Florida         54090  FL  58560         South
## Georgia         58073  GA  58876         South
## Hawaii           6425  HI   6450          West
## Idaho           82677  ID  83557          West
## Illinois        55748  IL  56400 North Central
## Indiana         36097  IN  36291 North Central
## Iowa            55941  IA  56290 North Central
## Kansas          81787  KS  82264 North Central
## Kentucky        39650  KY  40395         South
## Louisiana       44930  LA  48523         South
## Maine           30920  ME  33215     Northeast
## Maryland         9891  MD  10577         South
## Massachusetts    7826  MA   8257     Northeast
## Michigan        56817  MI  58216 North Central
## Minnesota       79289  MN  84068 North Central
## Mississippi     47296  MS  47716         South
## Missouri        68995  MO  69686 North Central
## Montana        145587  MT 147138          West
## Nebraska        76483  NE  77227 North Central
## Nevada         109889  NV 110540          West
## New Hampshire    9027  NH   9304     Northeast
## New Jersey       7521  NJ   7836     Northeast
## New Mexico     121412  NM 121666          West
## New York        47831  NY  49576     Northeast
## North Carolina  48798  NC  52586         South
## North Dakota    69273  ND  70665 North Central
## Ohio            40975  OH  41222 North Central
## Oklahoma        68782  OK  69919         South
## Oregon          96184  OR  96981          West
## Pennsylvania    44966  PA  45333     Northeast
## Rhode Island     1049  RI   1214     Northeast
## South Carolina  30225  SC  31055         South
## South Dakota    75955  SD  77047 North Central
## Tennessee       41328  TN  42244         South
## Texas          262134  TX 267339         South
## Utah            82096  UT  84916          West
## Vermont          9267  VT   9609     Northeast
## Virginia        39780  VA  40815         South
## Washington      66570  WA  68192          West
## West Virginia   24070  WV  24181         South
## Wisconsin       54464  WI  56154 North Central
## Wyoming         97203  WY  97914          West
##
##  output 2 :
##                Population Income Illiteracy Murder   Area           reg
## Alabama              3615   3624        2.1   15.1  50708         South
## Alaska                365   6315        1.5   11.3 566432          West
## Arizona              2212   4530        1.8    7.8 113417          West
## Arkansas             2110   3378        1.9   10.1  51945         South
## California          21198   5114        1.1   10.3 156361          West
## Colorado             2541   4884        0.7    6.8 103766          West
## Connecticut          3100   5348        1.1    3.1   4862     Northeast
## Delaware              579   4809        0.9    6.2   1982         South
## Florida              8277   4815        1.3   10.7  54090         South
## Georgia              4931   4091        2.0   13.9  58073         South
## Hawaii                868   4963        1.9    6.2   6425          West
## Idaho                 813   4119        0.6    5.3  82677          West
## Illinois            11197   5107        0.9   10.3  55748 North Central
## Indiana              5313   4458        0.7    7.1  36097 North Central
## Iowa                 2861   4628        0.5    2.3  55941 North Central
## Kansas               2280   4669        0.6    4.5  81787 North Central
## Kentucky             3387   3712        1.6   10.6  39650         South
## Louisiana            3806   3545        2.8   13.2  44930         South
## Maine                1058   3694        0.7    2.7  30920     Northeast
## Maryland             4122   5299        0.9    8.5   9891         South
## Massachusetts        5814   4755        1.1    3.3   7826     Northeast
## Michigan             9111   4751        0.9   11.1  56817 North Central
## Minnesota            3921   4675        0.6    2.3  79289 North Central
## Mississippi          2341   3098        2.4   12.5  47296         South
## Missouri             4767   4254        0.8    9.3  68995 North Central
## Montana               746   4347        0.6    5.0 145587          West
## Nebraska             1544   4508        0.6    2.9  76483 North Central
## Nevada                590   5149        0.5   11.5 109889          West
## New Hampshire         812   4281        0.7    3.3   9027     Northeast
## New Jersey           7333   5237        1.1    5.2   7521     Northeast
## New Mexico           1144   3601        2.2    9.7 121412          West
## New York            18076   4903        1.4   10.9  47831     Northeast
## North Carolina       5441   3875        1.8   11.1  48798         South
## North Dakota          637   5087        0.8    1.4  69273 North Central
## Ohio                10735   4561        0.8    7.4  40975 North Central
## Oklahoma             2715   3983        1.1    6.4  68782         South
## Oregon               2284   4660        0.6    4.2  96184          West
## Pennsylvania        11860   4449        1.0    6.1  44966     Northeast
## Rhode Island          931   4558        1.3    2.4   1049     Northeast
## South Carolina       2816   3635        2.3   11.6  30225         South
## South Dakota          681   4167        0.5    1.7  75955 North Central
## Tennessee            4173   3821        1.7   11.0  41328         South
## Texas               12237   4188        2.2   12.2 262134         South
## Utah                 1203   4022        0.6    4.5  82096          West
## Vermont               472   3907        0.6    5.5   9267     Northeast
## Virginia             4981   4701        1.4    9.5  39780         South
## Washington           3559   4864        0.6    4.3  66570          West
## West Virginia        1799   3617        1.4    6.7  24070         South
## Wisconsin            4589   4468        0.7    3.0  54464 North Central
## Wyoming               376   4566        0.6    6.9  97203          West
##
##  output 3 :
##                Population Income Illiteracy Murder   Area           reg
## Alabama              3615   3624        2.1   15.1  50708         South
## Alaska                365   6315        1.5   11.3 566432          West
## Arizona              2212   4530        1.8    7.8 113417          West
## Arkansas             2110   3378        1.9   10.1  51945         South
## California          21198   5114        1.1   10.3 156361          West
## Colorado             2541   4884        0.7    6.8 103766          West
## Connecticut          3100   5348        1.1    3.1   4862     Northeast
## Delaware              579   4809        0.9    6.2   1982         South
## Florida              8277   4815        1.3   10.7  54090         South
## Georgia              4931   4091        2.0   13.9  58073         South
## Hawaii                868   4963        1.9    6.2   6425          West
## Idaho                 813   4119        0.6    5.3  82677          West
## Illinois            11197   5107        0.9   10.3  55748 North Central
## Indiana              5313   4458        0.7    7.1  36097 North Central
## Iowa                 2861   4628        0.5    2.3  55941 North Central
## Kansas               2280   4669        0.6    4.5  81787 North Central
## Kentucky             3387   3712        1.6   10.6  39650         South
## Louisiana            3806   3545        2.8   13.2  44930         South
## Maine                1058   3694        0.7    2.7  30920     Northeast
## Maryland             4122   5299        0.9    8.5   9891         South
## Massachusetts        5814   4755        1.1    3.3   7826     Northeast
## Michigan             9111   4751        0.9   11.1  56817 North Central
## Minnesota            3921   4675        0.6    2.3  79289 North Central
## Mississippi          2341   3098        2.4   12.5  47296         South
## Missouri             4767   4254        0.8    9.3  68995 North Central
## Montana               746   4347        0.6    5.0 145587          West
## Nebraska             1544   4508        0.6    2.9  76483 North Central
## Nevada                590   5149        0.5   11.5 109889          West
## New Hampshire         812   4281        0.7    3.3   9027     Northeast
## New Jersey           7333   5237        1.1    5.2   7521     Northeast
## New Mexico           1144   3601        2.2    9.7 121412          West
## New York            18076   4903        1.4   10.9  47831     Northeast
## North Carolina       5441   3875        1.8   11.1  48798         South
## North Dakota          637   5087        0.8    1.4  69273 North Central
## Ohio                10735   4561        0.8    7.4  40975 North Central
## Oklahoma             2715   3983        1.1    6.4  68782         South
## Oregon               2284   4660        0.6    4.2  96184          West
## Pennsylvania        11860   4449        1.0    6.1  44966     Northeast
## Rhode Island          931   4558        1.3    2.4   1049     Northeast
## South Carolina       2816   3635        2.3   11.6  30225         South
## South Dakota          681   4167        0.5    1.7  75955 North Central
## Tennessee            4173   3821        1.7   11.0  41328         South
## Texas               12237   4188        2.2   12.2 262134         South
## Utah                 1203   4022        0.6    4.5  82096          West
## Vermont               472   3907        0.6    5.5   9267     Northeast
## Virginia             4981   4701        1.4    9.5  39780         South
## Washington           3559   4864        0.6    4.3  66570          West
## West Virginia        1799   3617        1.4    6.7  24070         South
## Wisconsin            4589   4468        0.7    3.0  54464 North Central
## Wyoming               376   4566        0.6    6.9  97203          West
##                           illi
## Alabama        High Illiteracy
## Alaska         Some Illiteracy
## Arizona        Some Illiteracy
## Arkansas       Some Illiteracy
## California     Some Illiteracy
## Colorado        Low Illiteracy
## Connecticut    Some Illiteracy
## Delaware        Low Illiteracy
## Florida        Some Illiteracy
## Georgia        High Illiteracy
## Hawaii         Some Illiteracy
## Idaho           Low Illiteracy
## Illinois        Low Illiteracy
## Indiana         Low Illiteracy
## Iowa            Low Illiteracy
## Kansas          Low Illiteracy
## Kentucky       Some Illiteracy
## Louisiana      High Illiteracy
## Maine           Low Illiteracy
## Maryland        Low Illiteracy
## Massachusetts  Some Illiteracy
## Michigan        Low Illiteracy
## Minnesota       Low Illiteracy
## Mississippi    High Illiteracy
## Missouri        Low Illiteracy
## Montana         Low Illiteracy
## Nebraska        Low Illiteracy
## Nevada          Low Illiteracy
## New Hampshire   Low Illiteracy
## New Jersey     Some Illiteracy
## New Mexico     High Illiteracy
## New York       Some Illiteracy
## North Carolina Some Illiteracy
## North Dakota    Low Illiteracy
## Ohio            Low Illiteracy
## Oklahoma       Some Illiteracy
## Oregon          Low Illiteracy
## Pennsylvania   Some Illiteracy
## Rhode Island   Some Illiteracy
## South Carolina High Illiteracy
## South Dakota    Low Illiteracy
## Tennessee      Some Illiteracy
## Texas          High Illiteracy
## Utah            Low Illiteracy
## Vermont         Low Illiteracy
## Virginia       Some Illiteracy
## Washington      Low Illiteracy
## West Virginia  Some Illiteracy
## Wisconsin       Low Illiteracy
## Wyoming         Low Illiteracy
##
##  output 4 :
## [1] 5149
##
##  output 5 :
## [1] "Nevada"
