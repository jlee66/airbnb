library(readr)
airbnb <- read_csv("C:/Users/jlee66/Downloads/airbnb_amsterdam.csv")
View(airbnb)

devtools::use_data(airbnb, overwrite = TRUE)
