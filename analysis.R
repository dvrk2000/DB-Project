library(dplyr)
library(tidyr)
library(stringr)
library(usmap)

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


diabetes_df <- get_df("diagnosed_diabetes.csv")
inactivity_df <- get_df("physical_inactivity.csv")
obesity_df <- get_df("obesity_rate.csv")
