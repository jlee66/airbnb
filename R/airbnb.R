library(readr)

neighborhood_average <- function(city_data){
  if( is.null(city_data$price) ||  is.null(city_data$neighborhood)) stop("Both neighborhood and price columns must exist, and written accordingly.")
  # get rid of missing neighborhoods
  cleanr <- subset(city_data, !is.na(neighborhood))

  # get means by neighborhood, deal with missing prices
  listed_means <- aggregate(cleanr$price, list(cleanr$neighborhood), mean, na.rm = TRUE)

  # sort list from cheapest to most expensive
  sorted_list <- listed_means[order(listed_means$x, decreasing = FALSE), ]

  # add name to columns
  colnames(sorted_list) <- c("Neighborhood", "Average Price")
  return(sorted_list)
}

airbnb_listing <- function(data, num_bedrooms, budget, range=budget*0.2){
  if(budget < min(data$price) || budget > max(data$price)) stop("Budget out of limit of price range")
  if(num_bedrooms < 0 || num_bedrooms > max(data$bedrooms)) stop("Bedrooms cannot be negative or out of the range")
  #filter by bedrooms
  bedroom_listing <- subset(data, bedrooms == num_bedrooms, select = c(name, price))

  #filter by price

  price_listing <- subset(bedroom_listing, (budget - range <= price) & (price <= budget + range), select = c(name, price))

  return (price_listing)
}

