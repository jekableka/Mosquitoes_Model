##Computational Model of Morin and Comrie
## Pulliam Lab Exercise
## Omar, Brooke, Jess, Burt
## September 2013


##Clear All
rm(list=ls())

## Set Random Number Generator to First Seed

set.seed(1)

##########################################
## Mean Daily temperatures
##########################################

## Temperature in Celsius
temp.C <- c(2,23)

##runif(30, 30, 35) ## currently just a randomly generated vector

## Temperature in Kelvin
temp.K <- temp.C+ 274.15

##########################################
## Mean Daily Water Levels and Threshold
##########################################

## Water Threshold
water.threshold <- 1 ## completely arbitrary

## Total Water

water.1 <- 2
water.2 <- 2

#runif(30, 0, 2) ## currently just a randomly generated vector

##########################################
## Mean Daily Egg Survival
##########################################

## Not sure how to get this to work for vectors  

#This creates an empty vector for egg.mortality and s.eggs
#since these vectors needs to be initialized. I only 2 days just to test 
# the code. 

egg.mortality<-rep(0,2)
s.eggs<-rep(0,2)

#Here is the start of the for loop. 
for (i in 1:2){
if (temp.C[i] <= 13){
  egg.mortality[i] <- .97
 }else if (13<= temp.C[i] & temp.C[i]<=19) {
        egg.mortality[i] <- 54.259*exp(-.3114*temp.C[i])
}else if( 19 <=temp.C[i] & temp.C[i] <= 30) { 
  egg.mortality[i] <- .22
}else if( temp.C[i] >= 30) {
 egg.mortality[i] <- (.0876*temp.C[i] - 2.3577)
 }


s.eggs[i]<- (.0876*temp.C[i] - 2.3577)


##  Eggs 

## Day 0
n.eggs.0 <- 100

#n.eggs.1<-rep(0,2)
##Day 1
n.eggs.1 <- s.eggs*n.eggs.0

l.e.1 <- .0037*temp.C^2 - .1661*temp.C + 2.5198


if(water.1 >water.threshold) {
  v.egg.1 <- (1/ l.e.1)
}else {
  v.egg.1 <- 0
 }


## Day 2

n.eggs.2 <-s.eggs*n.eggs.1


l.e.2 <- .0037*temp.C^2 - .1661*temp.C + 2.5198

if(water.2 >water.threshold) {
  v.egg.2 <- (1/ l.e.1)
} else {
  v.egg.2 <- 0}
}