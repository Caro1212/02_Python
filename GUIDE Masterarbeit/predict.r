## Function for predicting least-squares mean
## Code produced by GUIDE 39.0 on 6/15/22 at 23:34
predicted <- function(){
 if(!is.na(gewicht__minimum) & gewicht__minimum <= 103.892042607 ){
   if(!is.na(sys__absolute_maximum) & sys__absolute_maximum <= 149.821428571 ){
     nodeid <- 4
     predict <- -31.6630976677
     x <- ifelse(is.na(blutzucker__absolute_maximum), 14.0402358060, blutzucker__absolute_maximum)
     predict <- predict +  .697719685647 * x
     x <- ifelse(is.na(blutzucker__sum_values), 1257.48430183, blutzucker__sum_values)
     predict <- predict +  -2.86059678514 * x
     x <- ifelse(is.na(blutzucker__median), 12.5287685399, blutzucker__median)
     predict <- predict +  .965867997305E-01 * x
     x <- ifelse(is.na(blutzucker__root_mean_square), 12.6213489260, blutzucker__root_mean_square)
     predict <- predict +  287.393667018 * x
     x <- ifelse(is.na(blutzucker__standard_deviation), .811832744608, blutzucker__standard_deviation)
     predict <- predict +  -24.2097256414 * x
     x <- ifelse(is.na(blutzucker__variance), 1.28571100379, blutzucker__variance)
     predict <- predict +  -2.68255633268 * x
     x <- ifelse(is.na(Insulin_glargin__minimum), 17711.1747851, Insulin_glargin__minimum)
     predict <- predict +  -.941721647719E-04 * x
     x <- ifelse(is.na(Insulin_glargin__standard_deviation), 886.795159817, Insulin_glargin__standard_deviation)
     predict <- predict +  -.577596693917E-03 * x
     x <- ifelse(is.na(Insulin_glargin__variance), 3628192.84814, Insulin_glargin__variance)
     predict <- predict +  -.121776325436E-05 * x
     x <- ifelse(is.na(Insulin_glargin__sum_values), 2278160.45845, Insulin_glargin__sum_values)
     predict <- predict +  -.241343844049E-03 * x
     x <- ifelse(is.na(Insulin_glargin__root_mean_square), 22865.1194611, Insulin_glargin__root_mean_square)
     predict <- predict +  .212751575743E-01 * x
     x <- ifelse(is.na(sys__minimum), 128.237822350, sys__minimum)
     predict <- predict +  -.204242600963E-01 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__minimum), 2067.33524355, Metformin_hydrochlorid__minimum)
     predict <- predict +  .312091881144E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__standard_deviation), 2342.24163407, Insulin__normal_(human)__standard_deviation)
     predict <- predict +  -.561665851308E-03 * x
     x <- ifelse(is.na(Insulin__normal_(human)__variance), 23948287.5559, Insulin__normal_(human)__variance)
     predict <- predict +  -.163439670118E-06 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__mean), 2196.01719198, Metformin_hydrochlorid__mean)
     predict <- predict +  -.235863515219 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__root_mean_square), 2203.72282052, Metformin_hydrochlorid__root_mean_square)
     predict <- predict +  .144276397373 * x
     x <- ifelse(is.na(Insulin__normal_(human)__absolute_maximum), 28088.2521490, Insulin__normal_(human)__absolute_maximum)
     predict <- predict +  .458510060764E-04 * x
     x <- ifelse(is.na(Insulin__normal_(human)__root_mean_square), 21273.3833551, Insulin__normal_(human)__root_mean_square)
     predict <- predict +  .173452159249E-01 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__median), 2191.97707736, Metformin_hydrochlorid__median)
     predict <- predict +  .103462717549 * x
     x <- ifelse(is.na(Insulin__normal_(human)__mean), 20951.7679083, Insulin__normal_(human)__mean)
     predict <- predict +  -.160469350221E-01 * x
     x <- ifelse(is.na(Insulin_glargin__median), 22951.2893983, Insulin_glargin__median)
     predict <- predict +  .271097425349E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__median), 21166.7621777, Insulin__normal_(human)__median)
     predict <- predict +  -.307628094991E-03 * x
     x <- ifelse(is.na(blutzucker__minimum), 10.7098425917, blutzucker__minimum)
     predict <- predict +  .347802529853E-01 * x
     x <- ifelse(is.na(Insulin_lispro__root_mean_square), 36849.9256557, Insulin_lispro__root_mean_square)
     predict <- predict +  -.186727062422E-03 * x
     x <- ifelse(is.na(Insulin_lispro__mean), 36029.8280802, Insulin_lispro__mean)
     predict <- predict +  .217369794869E-03 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__absolute_maximum), 2286.53295129, Metformin_hydrochlorid__absolute_maximum)
     predict <- predict +  .121090751597E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__minimum), 15191.6905444, Insulin__normal_(human)__minimum)
     predict <- predict +  -.164290436749E-03 * x
     x <- ifelse(is.na(Insulin_lispro__absolute_maximum), 46473.3524355, Insulin_lispro__absolute_maximum)
     predict <- predict +  .212768331511E-05 * x
     x <- ifelse(is.na(Insulin_lispro__variance), 28069589.8109, Insulin_lispro__variance)
     predict <- predict +  .412920628480E-08 * x
     x <- ifelse(is.na(Insulin_lispro__standard_deviation), 2765.95238770, Insulin_lispro__standard_deviation)
     predict <- predict +  -.958026246052E-04 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__standard_deviation), 43.7226694942, Metformin_hydrochlorid__standard_deviation)
     predict <- predict +  .279297152848E-01 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__variance), 25479.7994269, Metformin_hydrochlorid__variance)
     predict <- predict +  -.553277831722E-05 * x
     x <- ifelse(is.na(Insulin_lispro__minimum), 29300.2865330, Insulin_lispro__minimum)
     predict <- predict +  -.224175894476E-04 * x
     x <- ifelse(is.na(sys__sum_values), 13374.1845750, sys__sum_values)
     predict <- predict +  -.194674390487 * x
     x <- ifelse(is.na(sys__root_mean_square), 133.809383780, sys__root_mean_square)
     predict <- predict +  19.6053937807 * x
     x <- ifelse(is.na(gewicht__variance), .439236643014, gewicht__variance)
     predict <- predict +  -.686052031977E-01 * x
     x <- ifelse(is.na(gewicht__standard_deviation), .557854734771, gewicht__standard_deviation)
     predict <- predict +  .580456582045 * x
     x <- ifelse(is.na(gewicht__minimum), 102.001331119, gewicht__minimum)
     predict <- predict +  .621887146992 * x
     x <- ifelse(is.na(sys__standard_deviation), 3.89516985786, sys__standard_deviation)
     predict <- predict +  .802444824783E-01 * x
     x <- ifelse(is.na(sys__variance), 18.0246234607, sys__variance)
     predict <- predict +  -.634043621873E-01 * x
     x <- ifelse(is.na(sys__maximum), 141.804543594, sys__maximum)
     predict <- predict +  -.330030411064E-01 * x
     x <- ifelse(is.na(gewicht__mean), 103.064686312, gewicht__mean)
     predict <- predict +  -1.23459141011 * x
     x <- ifelse(is.na(gewicht__median), 103.097297587, gewicht__median)
     predict <- predict +  .270870413042 * x
     predict <- min(max(predict, 10.0000000000),17.0000000000)
   } else {
     nodeid <- 5
     predict <- 170.237105463
     x <- ifelse(is.na(blutzucker__absolute_maximum), 13.8554911522, blutzucker__absolute_maximum)
     predict <- predict +  .592184553439 * x
     x <- ifelse(is.na(blutzucker__sum_values), 1273.84702761, blutzucker__sum_values)
     predict <- predict +  -5.83171788527 * x
     x <- ifelse(is.na(blutzucker__median), 12.6743706642, blutzucker__median)
     predict <- predict +  2.44169440610 * x
     x <- ifelse(is.na(blutzucker__root_mean_square), 12.7636608893, blutzucker__root_mean_square)
     predict <- predict +  582.095088800 * x
     x <- ifelse(is.na(blutzucker__standard_deviation), .546336385623, blutzucker__standard_deviation)
     predict <- predict +  -6.93187273221 * x
     x <- ifelse(is.na(blutzucker__variance), .706988613177, blutzucker__variance)
     predict <- predict +  -17.5350663833 * x
     x <- ifelse(is.na(Insulin_glargin__minimum), 18093.2038835, Insulin_glargin__minimum)
     predict <- predict +  .709187297340E-04 * x
     x <- ifelse(is.na(Insulin_glargin__standard_deviation), 1367.46289495, Insulin_glargin__standard_deviation)
     predict <- predict +  .538152509781E-03 * x
     x <- ifelse(is.na(Insulin_glargin__variance), 6632224.42718, Insulin_glargin__variance)
     predict <- predict +  .323454301186E-06 * x
     x <- ifelse(is.na(Insulin_glargin__sum_values), 2481524.27184, Insulin_glargin__sum_values)
     predict <- predict +  .183611100942E-03 * x
     x <- ifelse(is.na(Insulin_glargin__root_mean_square), 24953.3736377, Insulin_glargin__root_mean_square)
     predict <- predict +  -.210235467563E-01 * x
     x <- ifelse(is.na(sys__minimum), 127.181576514, sys__minimum)
     predict <- predict +  .926779060641E-03 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__minimum), 2308.25242718, Metformin_hydrochlorid__minimum)
     predict <- predict +  -.122403501204E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__standard_deviation), 2572.57289645, Insulin__normal_(human)__standard_deviation)
     predict <- predict +  .400309871938E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__variance), 42781562.9126, Insulin__normal_(human)__variance)
     predict <- predict +  -.170289425429E-07 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__mean), 2596.01941748, Metformin_hydrochlorid__mean)
     predict <- predict +  .515713707738 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__root_mean_square), 2614.67527260, Metformin_hydrochlorid__root_mean_square)
     predict <- predict +  -.539132036975 * x
     x <- ifelse(is.na(Insulin__normal_(human)__absolute_maximum), 16850.9708738, Insulin__normal_(human)__absolute_maximum)
     predict <- predict +  .114672339612E-04 * x
     x <- ifelse(is.na(Insulin__normal_(human)__root_mean_square), 11241.2241812, Insulin__normal_(human)__root_mean_square)
     predict <- predict +  -.434274477482E-02 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__median), 2612.86407767, Metformin_hydrochlorid__median)
     predict <- predict +  .166464087801E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__mean), 10184.9417476, Insulin__normal_(human)__mean)
     predict <- predict +  .211214377910E-02 * x
     x <- ifelse(is.na(Insulin_glargin__median), 25042.7184466, Insulin_glargin__median)
     predict <- predict +  -.169110512763E-03 * x
     x <- ifelse(is.na(Insulin__normal_(human)__median), 9719.41747573, Insulin__normal_(human)__median)
     predict <- predict +  -.451442865336E-04 * x
     x <- ifelse(is.na(blutzucker__minimum), 11.8825560473, blutzucker__minimum)
     predict <- predict +  -.637430728305 * x
     x <- ifelse(is.na(Insulin_lispro__root_mean_square), 59438.8460532, Insulin_lispro__root_mean_square)
     predict <- predict +  .166101313638E-02 * x
     x <- ifelse(is.na(Insulin_lispro__median), 57342.7184466, Insulin_lispro__median)
     predict <- predict +  -.267419789702E-04 * x
     x <- ifelse(is.na(Insulin_lispro__mean), 57779.5728155, Insulin_lispro__mean)
     predict <- predict +  -.174729239393E-02 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__absolute_maximum), 2679.61165049, Metformin_hydrochlorid__absolute_maximum)
     predict <- predict +  -.899508528163E-02 * x
     x <- ifelse(is.na(Insulin__normal_(human)__minimum), 6837.37864078, Insulin__normal_(human)__minimum)
     predict <- predict +  .105222063407E-03 * x
     x <- ifelse(is.na(Insulin_lispro__absolute_maximum), 86359.2233010, Insulin_lispro__absolute_maximum)
     predict <- predict +  -.929193168922E-05 * x
     x <- ifelse(is.na(Insulin_lispro__variance), 161444769.786, Insulin_lispro__variance)
     predict <- predict +  -.201691287013E-07 * x
     x <- ifelse(is.na(Insulin_lispro__standard_deviation), 7518.91477624, Insulin_lispro__standard_deviation)
     predict <- predict +  .279685449431E-03 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__standard_deviation), 102.868769801, Metformin_hydrochlorid__standard_deviation)
     predict <- predict +  -.178368165522E-01 * x
     x <- ifelse(is.na(Metformin_hydrochlorid__variance), 86981.7961165, Metformin_hydrochlorid__variance)
     predict <- predict +  .974982317179E-04 * x
     x <- ifelse(is.na(Insulin_lispro__minimum), 42284.4660194, Insulin_lispro__minimum)
     predict <- predict +  .630985389196E-05 * x
     x <- ifelse(is.na(sys__sum_values), 13705.1118239, sys__sum_values)
     predict <- predict +  -.313203484939 * x
     x <- ifelse(is.na(sys__root_mean_square), 137.323251416, sys__root_mean_square)
     predict <- predict +  31.3821381671 * x
     x <- ifelse(is.na(Insulin_glargin__absolute_maximum), 26172.8155340, Insulin_glargin__absolute_maximum)
     predict <- predict +  .584074150478E-04 * x
     x <- ifelse(is.na(gewicht__variance), .734136565040, gewicht__variance)
     predict <- predict +  -.130778394400E-01 * x
     x <- ifelse(is.na(gewicht__standard_deviation), .770651855876, gewicht__standard_deviation)
     predict <- predict +  .377792768898E-01 * x
     x <- ifelse(is.na(gewicht__minimum), 102.090625618, gewicht__minimum)
     predict <- predict +  .243402790327E-01 * x
     x <- ifelse(is.na(sys__standard_deviation), 8.31922858841, sys__standard_deviation)
     predict <- predict +  .132732073952 * x
     x <- ifelse(is.na(sys__variance), 75.2032276193, sys__variance)
     predict <- predict +  -.121330707970 * x
     x <- ifelse(is.na(sys__maximum), 156.433368007, sys__maximum)
     predict <- predict +  -.282088888260E-01 * x
     x <- ifelse(is.na(gewicht__mean), 103.494660097, gewicht__mean)
     predict <- predict +  .278430856135E-01 * x
     x <- ifelse(is.na(gewicht__median), 103.514838819, gewicht__median)
     predict <- predict +  -.669519878410E-01 * x
     predict <- min(max(predict, 10.0000000000),17.0000000000)
   }
 } else {
   nodeid <- 3
   predict <- 11.9355936120
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
    blutzucker__absolute_maximum <- as.numeric(newdata$blutzucker__absolute_maximum[i])
    blutzucker__sum_values <- as.numeric(newdata$blutzucker__sum_values[i])
    blutzucker__median <- as.numeric(newdata$blutzucker__median[i])
    blutzucker__root_mean_square <- as.numeric(newdata$blutzucker__root_mean_square[i])
    blutzucker__standard_deviation <- as.numeric(newdata$blutzucker__standard_deviation[i])
    blutzucker__variance <- as.numeric(newdata$blutzucker__variance[i])
    Insulin_glargin__minimum <- as.numeric(newdata$Insulin_glargin__minimum[i])
    Insulin_glargin__standard_deviation <- as.numeric(newdata$Insulin_glargin__standard_deviation[i])
    Insulin_glargin__variance <- as.numeric(newdata$Insulin_glargin__variance[i])
    Insulin_glargin__sum_values <- as.numeric(newdata$Insulin_glargin__sum_values[i])
    Insulin_glargin__root_mean_square <- as.numeric(newdata$Insulin_glargin__root_mean_square[i])
    sys__minimum <- as.numeric(newdata$sys__minimum[i])
    Metformin_hydrochlorid__minimum <- as.numeric(newdata$Metformin_hydrochlorid__minimum[i])
    Insulin__normal_(human)__standard_deviation <- as.numeric(newdata$Insulin__normal_(human)__standard_deviation[i])
    Insulin__normal_(human)__variance <- as.numeric(newdata$Insulin__normal_(human)__variance[i])
    Metformin_hydrochlorid__mean <- as.numeric(newdata$Metformin_hydrochlorid__mean[i])
    Metformin_hydrochlorid__root_mean_square <- as.numeric(newdata$Metformin_hydrochlorid__root_mean_square[i])
    Insulin__normal_(human)__absolute_maximum <- as.numeric(newdata$Insulin__normal_(human)__absolute_maximum[i])
    Insulin__normal_(human)__root_mean_square <- as.numeric(newdata$Insulin__normal_(human)__root_mean_square[i])
    Metformin_hydrochlorid__median <- as.numeric(newdata$Metformin_hydrochlorid__median[i])
    Insulin__normal_(human)__mean <- as.numeric(newdata$Insulin__normal_(human)__mean[i])
    Insulin_glargin__median <- as.numeric(newdata$Insulin_glargin__median[i])
    Insulin__normal_(human)__median <- as.numeric(newdata$Insulin__normal_(human)__median[i])
    blutzucker__minimum <- as.numeric(newdata$blutzucker__minimum[i])
    Insulin_lispro__root_mean_square <- as.numeric(newdata$Insulin_lispro__root_mean_square[i])
    Insulin_lispro__median <- as.numeric(newdata$Insulin_lispro__median[i])
    Insulin_lispro__mean <- as.numeric(newdata$Insulin_lispro__mean[i])
    Metformin_hydrochlorid__absolute_maximum <- as.numeric(newdata$Metformin_hydrochlorid__absolute_maximum[i])
    Insulin__normal_(human)__minimum <- as.numeric(newdata$Insulin__normal_(human)__minimum[i])
    Insulin_lispro__absolute_maximum <- as.numeric(newdata$Insulin_lispro__absolute_maximum[i])
    Insulin_lispro__variance <- as.numeric(newdata$Insulin_lispro__variance[i])
    Insulin_lispro__standard_deviation <- as.numeric(newdata$Insulin_lispro__standard_deviation[i])
    Metformin_hydrochlorid__standard_deviation <- as.numeric(newdata$Metformin_hydrochlorid__standard_deviation[i])
    Metformin_hydrochlorid__variance <- as.numeric(newdata$Metformin_hydrochlorid__variance[i])
    Insulin_lispro__minimum <- as.numeric(newdata$Insulin_lispro__minimum[i])
    sys__sum_values <- as.numeric(newdata$sys__sum_values[i])
    sys__root_mean_square <- as.numeric(newdata$sys__root_mean_square[i])
    Insulin_glargin__absolute_maximum <- as.numeric(newdata$Insulin_glargin__absolute_maximum[i])
    gewicht__variance <- as.numeric(newdata$gewicht__variance[i])
    gewicht__standard_deviation <- as.numeric(newdata$gewicht__standard_deviation[i])
    gewicht__minimum <- as.numeric(newdata$gewicht__minimum[i])
    sys__standard_deviation <- as.numeric(newdata$sys__standard_deviation[i])
    sys__variance <- as.numeric(newdata$sys__variance[i])
    sys__maximum <- as.numeric(newdata$sys__maximum[i])
    sys__absolute_maximum <- as.numeric(newdata$sys__absolute_maximum[i])
    gewicht__mean <- as.numeric(newdata$gewicht__mean[i])
    gewicht__median <- as.numeric(newdata$gewicht__median[i])
    tmp <- predicted()
    len <- length(tmp)
    node <- c(node,as.numeric(tmp[1]))
    pred <- c(pred,tmp[2])
}
