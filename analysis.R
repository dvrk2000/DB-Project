library(dplyr)
library(tidyr)
library(stringr)
library(usmap)
library(plotly)
# create usable dataframe
get_df <- function(df_name) {
  df <- read.csv(paste0("data/", df_name), stringsAsFactors = F, skip = 2)
  df$Percentage <- as.double(df$Percentage)
  df$Lower.Limit <- as.double(df$Lower.Limit)
  df$Upper.Limit <- as.double(df$Upper.Limit)
  df$County <- str_replace(df$County, " County", "")
  colnames(df)[3] <- "fips"
  return(df)
}
get_specific_state <- function(state, df) {
  df %>%
    filter(State == state)
}

createHeatMap <- function(df, title, color) {
  plot_usmap(
    data = df, values = "Percentage", include = df$State, color = color
  ) +
    scale_fill_continuous(
      low = "white", high = color, name = title, label = scales::comma
    ) +
    theme(legend.position = "right")
}
creatBarChart <- function(df, title, color) {
  ggplot(df, aes(x = County, y = Percentage)) +
    geom_bar(fill = color, stat = "identity") +
    geom_errorbar(aes(ymin = Lower.Limit, ymax = Upper.Limit), width = .2,
                  position = position_dodge(.9), color = "orange", alpha = 0.9) +
    ggtitle(title) +
    theme_minimal()
}
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

diabetes_df <- get_df("diagnosed_diabetes.csv")
inactivity_df <- get_df("physical_inactivity.csv")
obesity_df <- get_df("obesity_rate.csv")

createPlotlybar(xxx, "Obesity percentage by county", "blue")
