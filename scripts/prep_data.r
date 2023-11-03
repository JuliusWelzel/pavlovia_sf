
# Load required packages
library(tidyverse)

# Read data from file
data <- read_csv("C:\\Users\\User\\Desktop\\kiel\\pavlovia_sf\\db\\db_test.csv")

# Clean data
clean_data <- data %>%
    # Remove any duplicate rows
    distinct()

# remove the column InfoScreenWorld.started
clean_data <- clean_data %>%
    select(-InfoScreenWorld.started)

# create a new table which onlyx contains the columns which have rt in their name and the "participant" column but not the "__participant" column
# the "participant" column shghould be the first in the table
clean_data_rt <- clean_data %>%
    select("participant", contains("rt"), -starts_with("__participant"))

# Write clean data to file
write_csv(clean_data, "C:\\Users\\User\\Desktop\\kiel\\pavlovia_sf\\db\\db_clean.csv")

# Write clean rt data to file
write_csv(clean_data_rt, "C:\\Users\\User\\Desktop\\kiel\\pavlovia_sf\\db\\db_clean_rt.csv")
