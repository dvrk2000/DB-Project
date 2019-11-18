library(dplyr)
library(tidyr)

# Get the states insrance coverage data frame
diabetes_df <- read.csv("data/diagnosed_diabetes.csv", stringsAsFactors = F, skip = 2)

get_specific_state <- function(state) {
  diabetes_states <- diabetes_df %>%
    filter(State == state)
}

target_state <- get_specific_state("Washington")
