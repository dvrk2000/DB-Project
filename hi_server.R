library(ggplot2)
library(maps)
library(ggmap)
source("analysis.R")

server <- function(input, output) {

  output$map <- renderPlot({
    df <- get_specific_state(input$state)
    if (input$state == "United States") {
      df <- diabetes_df
    }
    plot_usmap(
      data = df, values = "Percentage", include = df$State, color = "red"
    ) + 
      scale_fill_continuous(
        low = "white", high = "red", name = "Diabetes (2016)", label = scales::comma
      ) + 
      labs(title = paste("Diabetes in", input$state)) +
      theme(legend.position = "right")
  })
  
  # Show barchart of random 20 counties with the selected state 
  output$barchart <- renderPlot({
    if (input$state != "United States") {
      ggplot(sample_n(get_specific_state(input$state), 12), aes(x = County, y = Percentage)) +
        geom_col() +
        geom_errorbar(aes(ymin = Lower.Limit, ymax = Upper.Limit), width = .2,
                      position = position_dodge(.9)) +
        ggtitle("Diabetes percentage by county")
    }
  })
  
  
}