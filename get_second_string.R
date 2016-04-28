df <- read.csv('02aJourneyDataExtract07Fe16-20Feb2016.csv')

hd <- head(df)

df$st_station_place = strsplit(as.character(df$StartStation.Name), ",")[[1]][1]
df$st_station_area = strsplit(as.character(df$StartStation.Name), ",")[[1]][2]

df$end_station_place = strsplit(as.character(df$EndStation.Name), ",")[[1]][1]
df$end_station_area = strsplit(as.character(df$EndStation.Name), ",")[[1]][2]

write.table(df, file = "bike_data.csv")

