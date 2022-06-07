## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 4/7/22 at 12:16
predicted <- function(){
 if(!is.na(u_0) & u_0 <= 2.84185000000 ){
   if(!is.na(u_0) & u_0 <= -1.46025000000 ){
     if(!is.na(y_0) & y_0 <= .325325000000 ){
       nodeid <- 8
       predict <- -.344200662926
       x <- ifelse(is.na(u_0), -2.44145930233, u_0)
       predict <- predict +  .108758119015 * x
       x <- ifelse(is.na(y_0), -.649051110233, y_0)
       predict <- predict +  .448134345947 * x
       predict <- min(max(predict, -1.23000000000),1.31650000000)
     } else {
       nodeid <- 9
       predict <- -.322209193455
       x <- ifelse(is.na(u_0), -2.34300000000, u_0)
       predict <- predict +  .321664245818 * x
       x <- ifelse(is.na(y_0), .638851000000, y_0)
       predict <- predict +  1.49773761238 * x
       predict <- min(max(predict, -1.23000000000),1.31650000000)
     }
   } else {
     if(!is.na(u_0) & u_0 <= .885760000000 ){
       if(!is.na(y_0) & y_0 <= .811460000000 ){
         if(!is.na(y_0) & y_0 <= -.754250000000 ){
           nodeid <- 40
           predict <- .320441020822
           x <- ifelse(is.na(u_0), -.139262466667, u_0)
           predict <- predict +  .146692194412 * x
           x <- ifelse(is.na(y_0), -.933052333333, y_0)
           predict <- predict +  1.15332077192 * x
           predict <- min(max(predict, -1.23000000000),1.31650000000)
         } else {
           nodeid <- 41
           predict <- .149152995176E-03
           x <- ifelse(is.na(u_0), -.203374192090, u_0)
           predict <- predict +  .261251844838 * x
           x <- ifelse(is.na(y_0), .405923163842E-01, y_0)
           predict <- predict +  .721718953924 * x
           predict <- min(max(predict, -1.23000000000),1.31650000000)
         }
       } else {
         nodeid <- 21
         predict <- -.224632683710
         x <- ifelse(is.na(u_0), .124185000000, u_0)
         predict <- predict +  .142054489539 * x
         x <- ifelse(is.na(y_0), .980846388889, y_0)
         predict <- predict +  1.05404344064 * x
         predict <- min(max(predict, -1.23000000000),1.31650000000)
       }
     } else {
       if(!is.na(y_0) & y_0 <= -.592280000000 ){
         nodeid <- 22
         predict <- .746343039077
         x <- ifelse(is.na(u_0), 1.71589000000, u_0)
         predict <- predict +  .241128182709 * x
         x <- ifelse(is.na(y_0), -.916161500000, y_0)
         predict <- predict +  1.71623747724 * x
         predict <- min(max(predict, -1.23000000000),1.31650000000)
       } else {
         if(!is.na(y_0) & y_0 <= .592940000000 ){
           nodeid <- 46
           predict <- .673583707523E-01
           x <- ifelse(is.na(u_0), 1.51516250000, u_0)
           predict <- predict +  .225035885805 * x
           x <- ifelse(is.na(y_0), .100636509615, y_0)
           predict <- predict +  .589278624111 * x
           predict <- min(max(predict, -1.23000000000),1.31650000000)
         } else {
           nodeid <- 47
           predict <- .187080418696
           x <- ifelse(is.na(u_0), 1.62245633333, u_0)
           predict <- predict +  .114293670712 * x
           x <- ifelse(is.na(y_0), .859500833333, y_0)
           predict <- predict +  .627117008495 * x
           predict <- min(max(predict, -1.23000000000),1.31650000000)
         }
       }
     }
   }
 } else {
   nodeid <- 3
   predict <- .452928802040
   x <- ifelse(is.na(u_0), 3.83284444444, u_0)
   predict <- predict +  .837986915714E-01 * x
   x <- ifelse(is.na(y_0), .635409925926, y_0)
   predict <- predict +  .384414069123 * x
   predict <- min(max(predict, -1.23000000000),1.31650000000)
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