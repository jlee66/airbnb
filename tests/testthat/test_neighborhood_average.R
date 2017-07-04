library(readr)
library(testthat)

# data used for testing
amsterdam <- read_csv("airbnb_amsterdam.csv")
sample <- head(amsterdam, n = 10)



context("Neighborhood Average")

test_that("Single item's mean is correct", {
  res <- neighborhood_average(sample)
  final_res <- res[which(neighborhood_average(sample)$Neighborhood == "Westerpark"), 2]
  expect_equal(final_res, 77 )
})


test_that("Multiple items' mean is correct", {
  res <- neighborhood_average(sample)
  final_res <- res[which(neighborhood_average(sample)$Neighborhood == "Oud Noord"), 2]
  expect_equal(final_res, 46 )
})

test_that("Missing values are handled", {

  sample[1, 14] = NA
  res <- neighborhood_average(sample)
  final_res <- res[which(neighborhood_average(sample)$Neighborhood == "Westerpark"), 2]
  expect_equal(final_res, NaN )
})
