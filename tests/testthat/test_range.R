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


