library(dplyr)
library(tidyr)
library(stringr)
library(usmap)
library(plotly)

# ----------------------------------------------------------
# Functions:
# ----------------------------------------------------------
# Create consistent and usable dataframe
get_df <- function(df_name) {
  df <- read.csv(paste0("data/", df_name), stringsAsFactors = F, skip = 2)
  df$Percentage <- as.double(df$Percentage)
  df$Lower.Limit <- as.double(df$Lower.Limit)
  df$Upper.Limit <- as.double(df$Upper.Limit)
  df$County <- str_replace(df$County, " County", "")
  colnames(df)[3] <- "fips"
  return(df)
}

# Take out the info in a target state
get_specific_state <- function(state, df) {
  df %>%
    filter(State == state)
}

# Comnine two datasets
join_datasets <- function(df1, df2) {
  left_join(df1, df2, by = "fips") %>%
    select(County = County.x, D_Percentage = Percentage.x,
           P_Percentage = Percentage.y)
}

# Create heatmap according to the given settings
createHeatMap <- function(df, title, color) {
  plot_usmap(
    data = df, values = "Percentage", include = df$State, color = color
  ) +
    scale_fill_continuous(
      low = "white", high = color, name = title, label = scales::comma
    ) +
    theme(legend.position = "right")
}

# Create barchart according to the given settings
createPlotlybar <- function(df, title, color) {
  plot_ly(
    data = df,
    x = ~County,
    y = ~Percentage,
    type = "bar",
    error_y = ~list(array = (Upper.Limit - Lower.Limit) / 2, color = I(color)),
    color = I(color),
    alpha = 0.7,
    hovertext = paste0("Max = ", df$Upper.Limit,
                       "<br>",
                       "Min = ", df$Lower.Limit)
  ) %>%
    layout(
      title = title
    )
}

# Create scatplot according to the given settings
createScatplot <- function(df) {
  ggplot(df, aes(x = P_Percentage, y = D_Percentage)) +
    geom_point() +
    geom_smooth(method = "lm")
}

# Construct table for text search
createSearchtable <- function(df) {
  df <- df %>% select(-fips) %>%
    select(County, State, Rate = Percentage)
  df$Rate <- paste0(df$Rate, "%")
  df
}

# ----------------------------------------------------------
# Extract data:
# ----------------------------------------------------------
diabetes_df <- get_df("diagnosed_diabetes.csv")
inactivity_df <- get_df("physical_inactivity.csv")
obesity_df <- get_df("obesity_rate.csv")

d_p_df <- join_datasets(diabetes_df, inactivity_df)
d_o_df <- join_datasets(diabetes_df, obesity_df)
p_o_df <- join_datasets(inactivity_df, obesity_df)
