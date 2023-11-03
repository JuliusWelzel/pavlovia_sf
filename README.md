# Pavlovia Data FischerLab

## Data Cleaning and Extraction Script

### Description
This R script is designed to perform data cleaning and extraction tasks on a CSV file. It utilizes the tidyverse package for data manipulation and reading/writing CSV files. The primary purpose of this script is to prepare and extract relevant data reaction time data (rt) from the input CSV file.

### Instructions
1. **Package Loading**: The script starts by loading the required packages from the tidyverse.

2. **Data Reading**: It reads the input data from the CSV file located at the specified path. Make sure to update the file path to match your file location.

3. **Data Cleaning**:
   - Duplicate rows are removed from the dataset using the `distinct` function.
   - The `InfoScreenWorld.started` column is removed from the cleaned data.

4. **Data Extraction**:
   - A new table, `clean_data_rt`, is created by selecting specific columns. This table includes the "participant" column as the first column and any columns with "rt" in their name (excluding those starting with "__participant"). This step is designed for data extraction.

5. **Data Writing**:
   - The cleaned data is written to a new CSV file named `db_clean.csv` at the specified path.
   - The extracted data (cleaned RT data) is written to another CSV file named `db_clean_rt.csv` at the specified path.

## Author
[Julius Welzel](mailto:j.welzel@neurologie.uni-kiel.de)

## Data responsible person
[Sebastian Fischer](Sebastian.Fischer@hshl.de)