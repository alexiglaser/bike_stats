# Generates Recommendation for Next Bikeshare Station 

# (Historical Data) Modifies the start and end stations to be place and area rather than 1 string 
hx_bike_stats <- read.csv('02aJourneyDataExtract07Fe16-20Feb2016.csv')

# hx_bike_stats <- head(hx_bike_stats) # for testing

hx_bike_stats$st_station_place = strsplit(as.character(hx_bike_stats$StartStation.Name), ",")[[1]][1]
hx_bike_stats$st_station_area = strsplit(as.character(hx_bike_stats$StartStation.Name), ",")[[1]][2]

hx_bike_stats$end_station_place = strsplit(as.character(hx_bike_stats$EndStation.Name), ",")[[1]][1]
hx_bike_stats$end_station_area = strsplit(as.character(hx_bike_stats$EndStation.Name), ",")[[1]][2]

write.table(hx_bike_stats, file = "historical_data.csv")

nrow(hx_bike_stats)
head(hx_bike_stats)

# Use Mike's Script to parse the live feed - Next Step is to get the live data 
#library(RJSONIO)
#live_data <- fromJSON('april_30_8am_snapshot.json')

#live_data <- lapply(live_data, function(x) {
#  x[sapply(x, is.null)] <- NA
#    unlist(x)
#    })
#live_stats <- do.call("rbind", live_data)
#nrow(live_stats)

#write.table(live_stats, file = "live_data.csv")

docks <- read.csv('docks.csv')
nrow(docks)


# Seperate Date and Time
docks$date <- strsplit(as.character(docks$date_time), " ")[[1]][1]
docks$date <- as.Date(docks$date)

docks$time <- strsplit(as.character(docks$date_time), " ")[[1]][2]
docks$time <- as.Date(

hd <- head(docks,2)
tl <- tail(docks,2)
mini_docks <- rbind(hd, tl)


