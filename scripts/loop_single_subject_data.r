library(tidyverse)

# Set the directory path to the "data" folder
data_folder <- "C:/Users/User/Desktop/kiel/pavlovia_sf/data"


# Get the list of CSV files in the data folder
csv_files <- list.files(path = data_folder, pattern = "\\.csv$", full.names = TRUE)


# Create an empty list to store the loaded dataframes
data_list <- list()

# Loop through each CSV file
for (file in csv_files) {
    # Load the CSV file into a dataframe
    df <- read.csv(file)

    # Select the specified variables
    selected_vars <- c("ï..Target",
                        "trials.thisRepN", "trials.thisTrialN",
                        "trials.thisN", "trials.thisIndex",
                        "trials_2.thisRepN", "trials_2.thisTrialN",
                        "trials_2.thisN", "trials_2.thisIndex",
                        "mouse.time", "mouse.corr", "mouse.clicked_name",
                        "furcht.response", "liebenswert.response", "rated_image",
                        "age.text", "gender.response",
                        "pc_frequency.response", "reaction_games_frequency.response",
                        "neuro_1_rev.response", "neuro_2.response", "neuro_3.response", "neuro_4_rev.response",
                        "specific_fear_spider.response", "specific_fear_snake.response")
    
    selected_df <- df[selected_vars]
    
    # Add the dataframe to the list
    data_list[[file]] <- selected_df
}

# Merge all dataframes into one big dataframe with an additional "id" column
big_df <- do.call(rbind, data_list)
big_df$id <- strsplit(basename(names(data_list)), "_")[[1]][1]
big_df$date <- strsplit(basename(names(data_list)), "_")[[1]][3]

# rename "ï..Target" to target
big_df <- big_df %>%
    rename(target = "ï..Target")

# save the big dataframe to a csv file
write.csv(big_df, file = "C:/Users/User/Desktop/kiel/pavlovia_sf/data/merged_data.csv", row.names = FALSE)
