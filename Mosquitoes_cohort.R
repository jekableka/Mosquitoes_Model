##Computational Model of Morin and Comrie
## Pulliam Lab Exercise
## Omar, Brooke, Jess, Burt
## September 2013


##Clear All
rm(list=ls())

## Set Random Number Generator to First Seed

set.seed(1)

#######################
## Table of Parameters
#######################

parameters.table <- matrix(0,nrow=30,ncol=6)
parameters.table[,1] <- runif(30,13,32) ## temperature in Celsius
parameters.table[,2] <- parameters.table[,1] + 274.5 ## temperature in Kelvin
parameters.table[,3] <- runif(30,0,2) ## water level value
parameters.table[,4][parameters.table[,1] < 13] <- .97
parameters.table[,4][parameters.table[,1] >=13 & parameters.table[,1] <19] <- 54.259*exp(-.3114*parameters.table[,1])
parameters.table[,4][parameters.table[,1] >=19 & parameters.table[,1] <30] <- 0.22
parameters.table[,4][parameters.table[,1] >=30 & parameters.table[,1] <50 ] <- 0.0876*parameters.table[,1]

##########################################
## Mean Daily temperatures
##########################################

## Temperature in Celsius
temp.C <- 30

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
##if(temp.C < 13) egg.mortality <- .97 
##else if(13<= temp.C <=19) egg.mortality <- 54.259*exp(-.3114*temp)
##else if( 19 <=temp.C <= 30) egg.mortality <- .22
##else( temp.C >= 30) egg.mortality <- (.0876*temp - 2.3577)

s.eggs <- (.0876*temp.C - 2.3577)


##  Eggs 

## Day 0
n.eggs.0 <- 100

##Day 1
n.eggs.1 <- s.eggs*n.eggs.0

l.e.1 <- .0037*temp.C^2 - .1661*temp.C + 2.5198

if(water.1 >water.threshold) {
  v.egg.1 <- (1/ l.e.1)
} else {
  v.egg.1 <- 0}

## Day 2

n.eggs.2 <-s.eggs*n.eggs.1

l.e.2 <- .0037*temp.C^2 - .1661*temp.C + 2.5198

if(water.2 >water.threshold) {
  v.egg.2 <- (1/ l.e.1)
} else {
  v.egg.2 <- 0}

mosquitoes <- ()



