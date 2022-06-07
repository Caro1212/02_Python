## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 2/22/22 at 10:10
predicted <- function(){
 if(!is.na(value__root_mean_square) & value__root_mean_square <= 1.24745124636 ){
   catvalues <- c("wiener")
   if(cat %in% catvalues){
     if(!is.na(value__minimum) & value__minimum <= -.332510000000E-01 ){
       if(!is.na(value__minimum) & value__minimum <= -1.06980000000 ){
         nodeid <- 16
         fitvar <- "value__root_mean_square"
         x <- value__root_mean_square
         predict <-  -.827619609058 + x * 1.11880912734
         predict <- predict + x^2 * -.645640286815
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  -.361319444444
       } else {
         if(!is.na(value__root_mean_square) & value__root_mean_square <= .179426141789 ){
           nodeid <- 34
           fitvar <- "value__sum_values"
           x <- value__sum_values
           predict <-  .681292781220E-01 + x * .283250511827E-01
           predict <- predict + x^2 * -.481095534803E-01
           predict <- min(max(predict, -1.54220000000),1.35450000000)
           if(is.na(predict)) predict <-  -.478421680000E-01
         } else {
           if(!is.na(value__minimum) & value__minimum <= -.372660000000 ){
             nodeid <- 70
             fitvar <- "value__mean"
             x <- value__mean
             predict <-  .124325617581E-01 + x * 1.04839199831
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  -.974385454545E-01
           } else {
             if(!is.na(value__minimum) & value__minimum <= -.221355000000 ){
               nodeid <- 142
               fitvar <- "value__sum_values"
               x <- value__sum_values
               predict <-  -.880418930119E-01 + x * .514206494945E-01
               predict <- min(max(predict, -1.54220000000),1.35450000000)
               if(is.na(predict)) predict <-  -.248973615385E-01
             } else {
               nodeid <- 143
               fitvar <- "value__sum_values"
               x <- value__sum_values
               predict <-  .385569948868E-01 + x * .403125111677E-01
               predict <- min(max(predict, -1.54220000000),1.35450000000)
               if(is.na(predict)) predict <-  .239291500000
             }
           }
         }
       }
     } else {
       if(!is.na(value__minimum) & value__minimum <= .234915000000 ){
         nodeid <- 18
         fitvar <- "value__root_mean_square"
         x <- value__root_mean_square
         predict <-  -.823909070940E-02 + x * .655186043924
         predict <- predict + x^2 * -.216495814139
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  .260763157895
       } else {
         nodeid <- 19
         fitvar <- "value__sum_values"
         x <- value__sum_values
         predict <-  .299253003273 + x * -.111352591151E-01
         predict <- predict + x^2 * .860876700188E-03
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  .342699565217
       }
     }
   } else {
     if(!is.na(value__sum_values) & value__sum_values <= -4.72094780000 ){
       catvalues <- c("hammerstein")
       if(cat %in% catvalues){
         if(!is.na(value__median) & value__median <= -.950145000000 ){
           nodeid <- 40
           fitvar <- "value__minimum"
           x <- value__minimum
           predict <-  -.679502445908 + x * .168782250219
           predict <- min(max(predict, -1.54220000000),1.35450000000)
           if(is.na(predict)) predict <-  -.909530952381
         } else {
           nodeid <- 41
           fitvar <- "value__median"
           x <- value__median
           predict <-  -.143792747651 + x * 1.04331256666
           predict <- predict + x^2 * .364725457547
           predict <- min(max(predict, -1.54220000000),1.35450000000)
           if(is.na(predict)) predict <-  -.610488888889
         }
       } else {
         nodeid <- 21
         fitvar <- "value__sum_values"
         x <- value__sum_values
         predict <-  .741354083695 + x * .138192487230
         predict <- predict + x^2 * .324594617266E-02
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  -.383447500000
       }
     } else {
       if(!is.na(value__root_mean_square) & value__root_mean_square <= .864142618877 ){
         if(!is.na(value__root_mean_square) & value__root_mean_square <= .462925811734 ){
           if(!is.na(value__root_mean_square) & value__root_mean_square <= .168721158186 ){
             nodeid <- 88
             fitvar <- "value__median"
             x <- value__median
             predict <-  -.696378123221E-01 + x * 1.05961248313
             predict <- predict + x^2 * 9.70267652007
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  -.307007188889E-01
           } else {
             if(!is.na(value__minimum) & value__minimum <= -.324505000000 ){
               catvalues <- c("nde")
               if(cat %in% catvalues){
                 nodeid <- 356
                 fitvar <- "value__median"
                 x <- value__median
                 predict <-  -.294770224644 + x * .771870839201
                 predict <- predict + x^2 * 3.13576674033
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  -.154580000000
               } else {
                 nodeid <- 357
                 fitvar <- "value__median"
                 x <- value__median
                 predict <-  -.161860013888 + x * .776327275058
                 predict <- predict + x^2 * 1.80024417420
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  -.829938888889E-01
               }
             } else {
               if(!is.na(value__minimum) & value__minimum <= -.119280000000 ){
                 catvalues <- c("hammerstein")
                 if(cat %in% catvalues){
                   if(!is.na(value__minimum) & value__minimum <= -.295235000000 ){
                     nodeid <- 1432
                     fitvar <- "value__sum_values"
                     x <- value__sum_values
                     predict <-  -.146082808522 + x * .869418310622E-01
                     predict <- predict + x^2 * -.173031607610E-02
                     predict <- min(max(predict, -1.54220000000),1.35450000000)
                     if(is.na(predict)) predict <-  -.635903636364E-01
                   } else {
                     nodeid <- 1433
                     fitvar <- "value__mean"
                     x <- value__mean
                     predict <-  -.394074197090E-01 + x * 1.11706890212
                     predict <- min(max(predict, -1.54220000000),1.35450000000)
                     if(is.na(predict)) predict <-  .741028347619E-01
                   }
                 } else {
                   if(!is.na(value__sum_values) & value__sum_values <= 2.73888700000 ){
                     nodeid <- 1434
                     fitvar <- "value__median"
                     x <- value__median
                     predict <-  -.132877763985 + x * 1.56015647646
                     predict <- min(max(predict, -1.54220000000),1.35450000000)
                     if(is.na(predict)) predict <-  -.557514285714E-01
                   } else {
                     nodeid <- 1435
                     fitvar <- "value__sum_values"
                     x <- value__sum_values
                     predict <-  -.967714116936 + x * .505770940658
                     predict <- predict + x^2 * -.431736278121E-01
                     predict <- min(max(predict, -1.54220000000),1.35450000000)
                     if(is.na(predict)) predict <-  .241486000000
                   }
                 }
               } else {
                 if(!is.na(value__minimum) & value__minimum <= -.881300000000E-01 ){
                   nodeid <- 718
                   fitvar <- "value__mean"
                   x <- value__mean
                   predict <-  -.124022250831 + x * -1.24463938289
                   predict <- predict + x^2 * 7.71592641303
                   predict <- min(max(predict, -1.54220000000),1.35450000000)
                   if(is.na(predict)) predict <-  .142839363636
                 } else {
                   nodeid <- 719
                   fitvar <- "value__root_mean_square"
                   x <- value__root_mean_square
                   predict <-  -.108280958517 + x * 1.02962814039
                   predict <- min(max(predict, -1.54220000000),1.35450000000)
                   if(is.na(predict)) predict <-  .303370000000
                 }
               }
             }
           }
         } else {
           catvalues <- c("hammerstein")
           if(cat %in% catvalues){
             if(!is.na(value__median) & value__median <= .664415000000 ){
               if(!is.na(value__maximum) & value__maximum <= .751830000000 ){
                 nodeid <- 360
                 fitvar <- "value__minimum"
                 x <- value__minimum
                 predict <-  .546392397656 + x * .223705240047
                 predict <- predict + x^2 * -.476195056072
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .476117777778
               } else {
                 nodeid <- 361
                 fitvar <- "value__mean"
                 x <- value__mean
                 predict <-  .924334178656E-01 + x * .761230455436
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .515796190476
               }
             } else {
               nodeid <- 181
               fitvar <- "value__maximum"
               x <- value__maximum
               predict <-  .813805072194E-01 + x * .595659066723
               predict <- min(max(predict, -1.54220000000),1.35450000000)
               if(is.na(predict)) predict <-  .666595789474
             }
           } else {
             if(!is.na(value__absolute_maximum) & value__absolute_maximum <= 1.08730000000 ){
               if(!is.na(value__median) & value__median <= .400225000000 ){
                 nodeid <- 364
                 fitvar <- "value__absolute_maximum"
                 x <- value__absolute_maximum
                 predict <-  .956507389429 + x * -.627487441155
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .407920588235
               } else {
                 nodeid <- 365
                 fitvar <- "value__root_mean_square"
                 x <- value__root_mean_square
                 predict <-  -1.56374404707 + x * 6.54264382980
                 predict <- predict + x^2 * -4.59617695275
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .701034666667
               }
             } else {
               if(!is.na(value__minimum) & value__minimum <= .310940000000 ){
                 nodeid <- 366
                 fitvar <- "value__mean"
                 x <- value__mean
                 predict <-  -.178364818952 + x * -.525413790220
                 predict <- predict + x^2 * 2.34973186157
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .206592000000
               } else {
                 nodeid <- 367
                 fitvar <- "value__minimum"
                 x <- value__minimum
                 predict <-  -3.54016841519 + x * 20.6330802900
                 predict <- predict + x^2 * -23.9349845488
                 predict <- min(max(predict, -1.54220000000),1.35450000000)
                 if(is.na(predict)) predict <-  .658553750000
               }
             }
           }
         }
       } else {
         if(!is.na(value__median) & value__median <= 1.00645000000 ){
           if(!is.na(value__root_mean_square) & value__root_mean_square <= .976462510067 ){
             nodeid <- 92
             fitvar <- "value__minimum"
             x <- value__minimum
             predict <-  .682727149154 + x * 1.83143209160
             predict <- predict + x^2 * -2.49394129563
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  .644245130000
           } else {
             nodeid <- 93
             fitvar <- "value__minimum"
             x <- value__minimum
             predict <-  .682409652467 + x * 1.62064200808
             predict <- predict + x^2 * -1.82263669381
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  .783896000000
           }
         } else {
           if(!is.na(value__minimum) & value__minimum <= .591490000000 ){
             nodeid <- 94
             fitvar <- "value__mean"
             x <- value__mean
             predict <-  -4.12036193948 + x * 8.37495560020
             predict <- predict + x^2 * -3.36438592554
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  .836436250000
           } else {
             nodeid <- 95
             fitvar <- "value__minimum"
             x <- value__minimum
             predict <-  -33.8514314767 + x * 98.7759338319
             predict <- predict + x^2 * -69.0458758287
             predict <- min(max(predict, -1.54220000000),1.35450000000)
             if(is.na(predict)) predict <-  1.17747500000
           }
         }
       }
     }
   }
 } else {
   catvalues <- c("nde")
   if(cat %in% catvalues){
     if(!is.na(value__median) & value__median <= -1.12665000000 ){
       nodeid <- 12
       fitvar <- "value__maximum"
       x <- value__maximum
       predict <-  .846850750749 + x * 4.75716311730
       predict <- predict + x^2 * 2.41123929626
       predict <- min(max(predict, -1.54220000000),1.35450000000)
       if(is.na(predict)) predict <-  -1.29864941176
     } else {
       if(!is.na(value__median) & value__median <= 1.27745000000 ){
         nodeid <- 26
         fitvar <- "value__minimum"
         x <- value__minimum
         predict <-  1.04630944218 + x * .837366765109
         predict <- predict + x^2 * -.567255424697
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  -.945300000000E-01
       } else {
         nodeid <- 27
         fitvar <- "value__minimum"
         x <- value__minimum
         predict <-  2.67836357763 + x * -4.23842945323
         predict <- predict + x^2 * 2.76398235919
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  1.13792500000
       }
     }
   } else {
     if(!is.na(value__maximum) & value__maximum <= 1.63760000000 ){
       nodeid <- 14
       fitvar <- "value__maximum"
       x <- value__maximum
       predict <-  -.743510473809E-01 + x * .898923561064
       predict <- predict + x^2 * -.101858891478
       predict <- min(max(predict, -1.54220000000),1.35450000000)
       if(is.na(predict)) predict <-  -.278217083333
     } else {
       nodeid <- 15
       fitvar <- "value__minimum"
       x <- value__minimum
       predict <-  4.67554349641 + x * -7.89722598704
       predict <- predict + x^2 * 4.22256084821
       predict <- min(max(predict, -1.54220000000),1.35450000000)
       if(is.na(predict)) predict <-  1.01193076923
     }
   }
 }
 return(c(nodeid,fitvar,predict))
}
## end of function
##
##
## If desired, replace "test_data_ts.csv" with name of file containing new data
## and change the "names(newdata)" line if necessary
## New file must have at least the same variables with same names
## (but not necessarily the same order) as in the training data file
## Missing value code is converted to NA if not already NA
newdata <- read.csv("test_data_ts.csv",header=TRUE,colClasses="character")
## node contains terminal node ID of each case
## fitvar contains name of regressor in each node
## pred contains predicted value of each case
node <- NULL
fitvar <- NULL
pred <- NULL
for(i in 1:nrow(newdata)){
    value__sum_values <- as.numeric(newdata$value__sum_values[i])
    value__mean <- as.numeric(newdata$value__mean[i])
    value__median <- as.numeric(newdata$value__median[i])
    value__minimum <- as.numeric(newdata$value__minimum[i])
    value__maximum <- as.numeric(newdata$value__maximum[i])
    value__root_mean_square <- as.numeric(newdata$value__root_mean_square[i])
    value__absolute_maximum <- as.numeric(newdata$value__absolute_maximum[i])
    cat <- as.character(newdata$cat[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    fitvar <- c(fitvar,tmp[2])
    pred <- c(pred,as.numeric(tmp[3]))
}

cat(pred)