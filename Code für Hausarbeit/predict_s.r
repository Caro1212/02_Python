## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 5/1/22 at 21:35
predicted <- function(){
 if(!is.na(u_0) & u_0 <= -.133630000000E-01 ){
   if(!is.na(u_0) & u_0 <= -1.38595000000 ){
     if(!is.na(u_0) & u_0 <= -2.65105000000 ){
       if(!is.na(y_0) & y_0 <= -.943900000000E-02 ){
         nodeid <- 16
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.693019573229 + x * .428836566916
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  -1.04054518519
       } else {
         nodeid <- 17
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.872843792663 + x * .911770401546
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  -.483858833333
       }
     } else {
       if(!is.na(u_0) & u_0 <= -1.83950000000 ){
         nodeid <- 18
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.505272779289 + x * .570954758533
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  -.784047733333
       } else {
         nodeid <- 19
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.391197453012 + x * .643385999713
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  -.625147261905
       }
     }
   } else {
     if(!is.na(u_0) & u_0 <= -.818425000000 ){
       if(!is.na(y_0) & y_0 <= .522660000000 ){
         nodeid <- 20
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.298973333886 + x * .634468873185
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  -.448718804878
       } else {
         nodeid <- 21
         fitvar <- "y_0"
         x <- y_0
         predict <-  -.691699588299 + x * 1.34879732470
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  .406923846154
       }
     } else {
       nodeid <- 11
       fitvar <- "y_0"
       x <- y_0
       predict <-  -.919870336272E-01 + x * .828368676501
       predict <- min(max(predict, -1.23000000000),1.31650000000)
       if(is.na(predict)) predict <-  -.827091663889E-01
     }
   }
 } else {
   if(!is.na(u_0) & u_0 <= 1.16820000000 ){
     if(!is.na(u_0) & u_0 <= .525175000000 ){
       nodeid <- 12
       fitvar <- "y_0"
       x <- y_0
       predict <-  .607073018958E-01 + x * .804357781225
       predict <- min(max(predict, -1.23000000000),1.31650000000)
       if(is.na(predict)) predict <-  .139454140351
     } else {
       if(!is.na(u_0) & u_0 <= .885760000000 ){
         if(!is.na(y_0) & y_0 <= -.483610000000 ){
           nodeid <- 52
           fitvar <- "y_0"
           x <- y_0
           predict <-  .500215582853 + x * 1.22532389799
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  -.558002142857
         } else {
           nodeid <- 53
           fitvar <- "y_0"
           x <- y_0
           predict <-  .193818561231 + x * .726280854344
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  .511261093023
         }
       } else {
         nodeid <- 27
         fitvar <- "y_0"
         x <- y_0
         predict <-  .237437188062 + x * .723127476487
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  .597883766667
       }
     }
   } else {
     if(!is.na(u_0) & u_0 <= 2.84185000000 ){
       if(!is.na(y_0) & y_0 <= -.598455000000 ){
         if(!is.na(u_0) & u_0 <= 1.76335000000 ){
           nodeid <- 56
           fitvar <- "y_0"
           x <- y_0
           predict <-  .859707103538 + x * 1.45185365404
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  -.413876666667
         } else {
           nodeid <- 57
           fitvar <- "y_0"
           x <- y_0
           predict <-  1.50999384306 + x * 1.96721140804
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  -.412443833333
         }
       } else {
         if(!is.na(u_0) & u_0 <= 1.59340000000 ){
           nodeid <- 58
           fitvar <- "y_0"
           x <- y_0
           predict <-  .344891635610 + x * .629573812071
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  .558667696970
         } else {
           nodeid <- 59
           fitvar <- "y_0"
           x <- y_0
           predict <-  .520424729125 + x * .526890458789
           predict <- min(max(predict, -1.23000000000),1.31650000000)
           if(is.na(predict)) predict <-  .820142352941
         }
       }
     } else {
       if(!is.na(u_0) & u_0 <= 3.33435000000 ){
         nodeid <- 30
         fitvar <- "y_0"
         x <- y_0
         predict <-  .672461713134 + x * .462621374308
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  .802300000000
       } else {
         nodeid <- 31
         fitvar <- "y_0"
         x <- y_0
         predict <-  .857584198910 + x * .330752253471
         predict <- min(max(predict, -1.23000000000),1.31650000000)
         if(is.na(predict)) predict <-  1.12641500000
       }
     }
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
    u_0 <- as.numeric(newdata$u_0[i])
    y_0 <- as.numeric(newdata$y_0[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    fitvar <- c(fitvar,tmp[2])
    pred <- c(pred,as.numeric(tmp[3]))
}

cat(pred)