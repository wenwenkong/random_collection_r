## ---------------------------
##
## Script name: download_GSOD_by_station.R
##
## Purpose of script: download individual GSOD stations and save as .csv file
##
## Author: Wenwen Kong
##
## Created: 2022-07-01
##
## ---------------------------
##
## Notes:
## -  Global Surface Summary of the Day (GSOD) consist of a dozen daily averages computed from Integrated Surface Database (ISD) data.
## -  The latest station history list can be found at:
##    https://www.ncei.noaa.gov/pub/data/noaa/isd-history.txt
##    https://www.ncei.noaa.gov/pub/data/noaa/isd-history.csv
##    If you do not see your station listed by its name, please
##    look for it using the USAF Station ID, or the WBAN number, and the
##    Latitude and Longitude. Station names will change from time to time
##    but these IDs and their corresponding Lat/Lons are more reliable.
##
## ---------------------------

## Setting the working directory
setwd("~/Downloads/")

## We will use the package GSODR and function get_GSOD 
library(GSODR)
help(get_GSOD)

# Create a list containing station IDs
stations_WBAN <- list("722950-23174","722880-23152","722886-23130")

# Create a list containing station names
stations_USAF <- list("KLAX", "KBUR", "KVNY")

# Define the time period of interest
year_Start <- 1973
year_End   <- 2021

# Create a for loop over the station list and save each station in one .csv file

for (i in 1:length(stations_WBAN)){
  temp <- get_GSOD(years = year_Start:year_End, station = stations_WBAN[i])
  write.csv(temp, paste0(stations_WBAN[i], "_", stations_USAF[i], "_", year_Start,"-",year_End,".csv"), row.names=FALSE)
}
