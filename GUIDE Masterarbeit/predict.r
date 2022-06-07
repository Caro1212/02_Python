## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 6/7/22 at 10:1
predicted <- function(){
 if(!is.na(Insulin__normal_(human)__minimum) & Insulin__normal_(human)__minimum <= 8871.42857143 ){
   if(!is.na(sys__median) & sys__median <= 143.166666667 ){
     if(!is.na(bmi__median) & bmi__median <= 28.6725000000 ){
       nodeid <- 8
       predict <- 166.869646636
     } else {
       nodeid <- 9
       predict <- 82.4520164654
       x <- ifelse(is.na(blutzucker__median), 246.569047619, blutzucker__median)
       predict <- predict +  .538021902755 * x
       predict <- min(max(predict, 120.642857143),278.700000000)
     }
   } else {
     nodeid <- 5
     predict <- 196.917356602
   }
 } else {
   if(!is.na(Insulin__normal_(human)__minimum) & Insulin__normal_(human)__minimum <= 9835.71428571 ){
     nodeid <- 6
     predict <- 166.250000000
   } else {
     if(!is.na(bmi__minimum) & bmi__minimum <= 27.7643750000 ){
       if(!is.na(gewicht__sum_values) & gewicht__sum_values <= 515.460511364 ){
         nodeid <- 28
         predict <- 166.220238095
       } else {
         nodeid <- 29
         predict <- 154.205750425
       }
     } else {
       nodeid <- 15
       predict <- -129.808121657
       x <- ifelse(is.na(bmi__maximum), 30.9351136364, bmi__maximum)
       predict <- predict +  10.6284341536 * x
       predict <- min(max(predict, 120.642857143),278.700000000)
     }
   }
 }
 return(c(nodeid,predict))
}
## end of function
##
##
## If desired, replace "train_data.csv" with name of file containing new data
## and change the "names(newdata)" line if necessary
## New file must have at least the same variables with same names
## (but not necessarily the same order) as in the training data file
## Missing value code is converted to NA if not already NA
newdata <- read.csv("train_data.csv",header=TRUE,colClasses="character")
## node contains terminal node ID of each case
## pred contains predicted value of each case
node <- NULL
pred <- NULL
for(i in 1:nrow(newdata)){
    blutzucker__median <- as.numeric(newdata$blutzucker__median[i])
    bmi__maximum <- as.numeric(newdata$bmi__maximum[i])
    gewicht__sum_values <- as.numeric(newdata$gewicht__sum_values[i])
    bmi__median <- as.numeric(newdata$bmi__median[i])
    bmi__minimum <- as.numeric(newdata$bmi__minimum[i])
    Insulin__normal_(human)__minimum <- as.numeric(newdata$Insulin__normal_(human)__minimum[i])
    sys__median <- as.numeric(newdata$sys__median[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    pred <- c(pred,tmp[2])
}
