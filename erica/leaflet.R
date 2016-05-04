suppressMessages({
  suppressWarnings({
    library(leaflet)
    library(plyr)
    library(dplyr)
  })
})
bike_data <- read.csv("bikes.csv", stringsAsFactors = FALSE, header = T)
# Remove irrelevant rowa
bike_data <- bike_data[!str_detect(bike_data$lat, 'lat'),]
bike_data <- bike_data[bike_data$lat != '0.0' | bike_data$lat != '0.0',]
bike_data$lat <- bike_data$lat %>% as.numeric
bike_data$lon <- bike_data$lon %>% as.numeric
bike_data <- bike_data[!is.na(bike_data$lat) | !is.na(bike_data$lat),]
bike_docks <- bike_data %>% select(id, lat, lon) %>% unique

# Leaflet code
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=bike_docks$lon, lat=bike_docks$lat)
m  # Print the map
