## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 2/18/22 at 17:24
predicted <- function(){
 if(!is.na(value__root_mean_square) & value__root_mean_square <= .646444721143 ){
   nodeid <- 2
   fitvar <- "value__median"
   x <- value__median
   predict <-  -.274698737409E-01 + x * .943256207334
   predict <- min(max(predict, -1.54220000000),1.35450000000)
   if(is.na(predict)) predict <-  .129662536620
 } else {
   if(!is.na(value__maximum) & value__maximum <= -.473220000000 ){
     nodeid <- 6
     fitvar <- "value__sum_values"
     x <- value__sum_values
     predict <-  .123331028874 + x * .549609200052E-01
     predict <- min(max(predict, -1.54220000000),1.35450000000)
     if(is.na(predict)) predict <-  -1.11452375000
   } else {
     if(!is.na(value__median) & value__median <= 1.05480000000 ){
       nodeid <- 14
       fitvar <- "value__mean"
       x <- value__mean
       predict <-  .101874667953 + x * .691768694528
       predict <- min(max(predict, -1.54220000000),1.35450000000)
       if(is.na(predict)) predict <-  .199216750000
     } else {
       if(!is.na(value__maximum) & value__maximum <= 1.78035000000 ){
         nodeid <- 30
         fitvar <- "value__sum_values"
         x <- value__sum_values
         predict <-  -1.27171617728 + x * .105431782446
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  .877602000000
       } else {
         nodeid <- 31
         fitvar <- "value__sum_values"
         x <- value__sum_values
         predict <-  -1.97205056422 + x * .120103228265
         predict <- min(max(predict, -1.54220000000),1.35450000000)
         if(is.na(predict)) predict <-  .838950000000
       }
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
    value__maximum <- as.numeric(newdata$value__maximum[i])
    value__root_mean_square <- as.numeric(newdata$value__root_mean_square[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    fitvar <- c(fitvar,tmp[2])
    pred <- c(pred,as.numeric(tmp[3]))
}

cat(pred)