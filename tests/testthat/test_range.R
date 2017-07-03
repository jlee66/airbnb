library(readr)
amsterdam <- read_csv("airbnb_amsterdam.csv")
sample <- head(amsterdam, n = 30)

context("Price Range Listing")

test_that("Range function works", {
  for(i in 1:20){
    x <- sample(1:10, 1)
    y <- sample(1:10, 1)
    if(x>y){
      expect_that(nrow(airbnb_listing(sample,1,50,x)) >= nrow(airbnb_listing(sample,1,50,y)), is_true())
    } else if(x<y){
      expect_that(nrow(airbnb_listing(sample,1,50,x)) <= nrow(airbnb_listing(sample,1,50,y)), is_true())
    } else if(x==y){
      expect_that(nrow(airbnb_listing(sample,1,50,x)) == nrow(airbnb_listing(sample,1,50,y)), is_true())
    }
  }
})

test_that("Price Limit Testing", {
  #Testing when price entered is below the min of the price
  expect_equal(nrow(airbnb_listing(sample, 2, 9)), 0)
  #Testing when price entered is above the max of the price
  expect_equal(nrow(airbnb_listing(sample, 2, 10000)), 0)
})

test_that("Bedrooms Limit Testing", {
  #Testing when the number of bedrooms entered is above the max of that of bedrooms
  expect_equal(nrow(airbnb_listing(sample, 11, 1000)), 0)
})




