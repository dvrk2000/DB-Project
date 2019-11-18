library(dplyr)
library(tidyr)
library(stringr)
library(usmap)

get_df <- function(df_name) {
  df <- read.csv(paste0("data/", df_name), stringsAsFactors = F, skip = 2)
  df$Percentage <- as.double(df$Percentage)
  df$Lower.Limit <- as.double(df$Lower.Limit)
  df$Upper.Limit <- as.double(df$Upper.Limit)
  df$County <- str_replace(df$County, " County", "")
  colnames(df)[3] <- "fips"
  return(df)
}

diabetes_df <- get_df("diagnosed_diabetes.csv")

get_specific_state <- function(state) {
  diabetes_states <- diabetes_df %>%
    filter(State == state)
}
