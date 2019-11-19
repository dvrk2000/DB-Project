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
  output$barchart <- renderPlot({
    if (input$state != "United States") {
      ggplot(sample_n(get_specific_state(input$state), 12), aes(x = County, y = Percentage)) +
        geom_col() +
        geom_errorbar(aes(ymin = Lower.Limit, ymax = Upper.Limit), width = .2,
                      position = position_dodge(.9)) +
        ggtitle("Diabetes percentage by county")
    }
  })
  
  output$map1 <- renderPlot({
    df <- get_specific_state(input$state1)
    if (input$state1 == "United States") {
      df <- inactivity_df
    }
    plot_usmap( #input$State1
      data = df, values = "Percentage", include = df$State, color = "red"
    ) + 
      scale_fill_continuous(
        low = "white", high = "red", name = "Inactivity (2016)", label = scales::comma
      ) + 
      labs(title = paste("Inactivity in", input$state1)) +
      theme(legend.position = "right")
  })
  output$barchart1 <- renderPlot({
    if (input$state1 != "United States") {
      data <- get_specific_state(input$state1)
      if (nrow(data) > 12) {
        data <- sample_n(data, 12)
      }
      ggplot(data, aes(x = County, y = Percentage)) +
        geom_col() +
        geom_errorbar(aes(ymin = Lower.Limit, ymax = Upper.Limit), width = .2,
                      position = position_dodge(.9)) +
        ggtitle("Inactivity percentage by county")
    }
  })
  
  
}