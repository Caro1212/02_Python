## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 3/9/22 at 13:29
predicted <- function(){
 if(!is.na(u_0) & u_0 <= .790665000000 ){
   if(!is.na(y_0) & y_0 <= -.306785000000 ){
     nodeid <- 4
     predict <- -.485482080036E-01
     x <- ifelse(is.na(u_0), -1.19779996000, u_0)
     predict <- predict +  .435223046773E-01 * x
     x <- ifelse(is.na(y_0), -.382881200000, y_0)
     predict <- predict +  .722713931096 * x
     predict <- min(max(predict, -.439270000000),.500560000000)
   } else {
     nodeid <- 5
     predict <- -.122112929931E-01
     x <- ifelse(is.na(u_0), .132824498851, u_0)
     predict <- predict +  .739183512526E-01 * x
     x <- ifelse(is.na(y_0), .808847977011E-01, y_0)
     predict <- predict +  .873532189800 * x
     predict <- min(max(predict, -.439270000000),.500560000000)
   }
 } else {
   nodeid <- 3
   predict <- .961585707379E-01
   x <- ifelse(is.na(u_0), 1.52777073529, u_0)
   predict <- predict +  .321767703543E-01 * x
   x <- ifelse(is.na(y_0), .360648691176, y_0)
   predict <- predict +  .655012027909 * x
   predict <- min(max(predict, -.439270000000),.500560000000)
 }
 return(c(nodeid,predict))
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
## pred contains predicted value of each case
node <- NULL
pred <- NULL
for(i in 1:nrow(newdata)){
    u_0 <- as.numeric(newdata$u_0[i])
    y_0 <- as.numeric(newdata$y_0[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    pred <- c(pred,tmp[2])
}

cat(pred)