library(readr)

neighborhood_average <- function(city_data){

  # get rid of missing neighborhoods
  cleanr <- subset(city_data, !is.na(neighborhood))

  # get means by neighborhood, deal with missing prices
  listed_means <- aggregate(cleanr$price, list(cleanr$neighborhood), mean, na.rm = TRUE)

  # sort list from cheapest to most expensive
  sorted_list <- listed_means[order(listed_means$x, decreasing = TRUE), ]

  # add name to columns
  colnames(sorted_list) <- c("Neighborhood", "Average Price")
  return(sorted_list)
}

airbnb_listing <- function(data, num_bedrooms, budget, range=budget*0.2){
  #filter by bedrooms
  bedroom_listing <- subset(data, bedrooms == num_bedrooms, select = c(name, price))

  #filter by price

  price_listing <- subset(bedroom_listing, (budget - range <= price) & (price <= budget + range), select = c(name, price))

  return (price_listing)
}

