## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 2/18/22 at 11:16
predicted <- function(){
 if(!is.na(y_0) & y_0 <= .591200000000E-01 ){
   nodeid <- 2
   fitvar <- "y_8"
   x <- y_8
   predict <-  .270482307868E-01 + x * 1.06728674771
   predict <- predict + x^2 * .253073084180E-01
   predict <- min(max(predict, -1.54220000000),1.35450000000)
   if(is.na(predict)) predict <-  -.346251544538
 } else {
   if(!is.na(u_8) & u_8 <= -.222040000000 ){
     nodeid <- 6
     fitvar <- "y_8"
     x <- y_8
     predict <-  -.595741203155E-01 + x * 1.02736414043
     predict <- min(max(predict, -1.54220000000),1.35450000000)
     if(is.na(predict)) predict <-  .148934062500E-01
   } else {
     nodeid <- 7
     fitvar <- "y_8"
     x <- y_8
     predict <-  -.142029353798E-01 + x * 1.00766900062
     predict <- min(max(predict, -1.54220000000),1.35450000000)
     if(is.na(predict)) predict <-  .514512597015
   }
 }
 return(c(nodeid,fitvar,predict))
}
## end of function
##
##
## If desired, replace "test_data.csv" with name of file containing new data
## and change the "names(newdata)" line if necessary
## New file must have at least the same variables with same names
## (but not necessarily the same order) as in the training data file
## Missing value code is converted to NA if not already NA
newdata <- read.csv("test_data.csv",header=TRUE,colClasses="character")
## node contains terminal node ID of each case
## fitvar contains name of regressor in each node
## pred contains predicted value of each case
node <- NULL
fitvar <- NULL
pred <- NULL
for(i in 1:nrow(newdata)){
    u_8 <- as.numeric(newdata$u_8[i])
    y_0 <- as.numeric(newdata$y_0[i])
    y_8 <- as.numeric(newdata$y_8[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    fitvar <- c(fitvar,tmp[2])
    pred <- c(pred,as.numeric(tmp[3]))
}

cat(pred)