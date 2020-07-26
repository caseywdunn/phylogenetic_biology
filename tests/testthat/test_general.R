library(tidyverse)
source( "../../functions.R" )

epsilon = 0.1

context("testing framework")

test_that("Testing works", {
  expect_equal( 1, 1 )
})

context("simulate_jc")

# run replicates simulations
mu = 0.1
t = 100
replicates = 100
x = lapply( rep("A", 500), function(x){sim_jc( mu = 0.1, t = 100, n = 1000, first =  x )} )

replacements = lapply( x, nrow  ) %>% unlist() 
replacements = replacements - 1 # The first replacement isn't really a replacement, it is just the initialization

test_that("The number of replacements is close to mu*t", {
  expect_lt( abs( mu * t - mean(replacements)), mu * t * epsilon )
})

test_that("There is a single entry if mu=0", {
  expect_equal( 1, nrow( sim_jc(mu=0) )  )
})

test_that("There is a single entry if t=0", {
  expect_equal( 1, nrow( sim_jc(t=0) )  )
})