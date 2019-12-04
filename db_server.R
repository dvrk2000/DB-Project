# Server page
library(ggplot2)
source("analysis.R")
server <- function(input, output) {
  output$map_d <- renderPlot({
    df <- get_specific_state(input$state_d, diabetes_df)
    if (input$state_d == "United States") {
      df <- diabetes_df
    }
    createHeatMap(df, "Diabetes rate (2016)", "red")
  })
  output$map_p <- renderPlot({
    df <- get_specific_state(input$state_p, inactivity_df)
    if (input$state_p == "United States") {
      df <- inactivity_df
    }
    createHeatMap(df, "Inactivity rate (2016)", "blue")
  })
  output$map_o <- renderPlot({
    df <- get_specific_state(input$state_o, obesity_df)
    if (input$state_o == "United States") {
      df <- obesity_df
    }
    createHeatMap(df, "Obesity rate (2016)", "Orange")
  })

  output$barchart_d <- renderPlotly({
    if (input$state_d != "United States") {
      df <- get_specific_state(input$state_d, diabetes_df)
      if (nrow(df) > 12) {
        df <- sample_n(df, 12)
      }
      createPlotlybar(df, "Diabetes percentage by county", "darkred")
    }
  })
  output$barchart_p <- renderPlotly({
    if (input$state_p != "United States") {
      df <- get_specific_state(input$state_p, inactivity_df)
      if (nrow(df) > 12) {
        df <- sample_n(df, 12)
      }
      createPlotlybar(df, "Inactivity percentage by county", "navyblue")
    }
  })
  output$barchart_o <- renderPlotly({
    if (input$state_o != "United States") {
      df <- get_specific_state(input$state_o, inactivity_df)
      if (nrow(df) > 12) {
        df <- sample_n(df, 12)
      }
      createPlotlybar(df, "Obesity percentage by county", "gold")
    }
  })

  output$scat1 <- renderPlot(
    createScatplot(d_p_df) +
      labs(x = "Physical Inactivity Rate", y = "Diabetes Rate") +
      ggtitle("Relationship between Diabetes and Physical Inactivity")
  )

  output$scat2 <- renderPlot(
    createScatplot(d_o_df) +
      labs(x = "Obesity Rate", y = "Diabetes Rate") +
      ggtitle("Relationship between Diabetes and Obesity") +
      theme_classic()
  )

  output$scat3 <- renderPlot(
    createScatplot(p_o_df) +
      labs(x = "Physical Inactivity Rate", y = "Obesity Rate") +
      ggtitle("Relationship between Phyical Inactivity and Obesity") +
      theme_minimal()
  )

  # Test for final:
  # output$s1 <- renderPlot({
  #   if (input$state_d != "United States") {
  #     df <- get_specific_state(input$state_d, diabetes_df)
  #     if (nrow(df) >12) {
  #       df <- sample_n(df, 12)
  #     }
  #     creatBarChart(df, "Diabetes percentage by county", "darkred")
  #   }
  # })
  # output$s2 <- renderPlot({
  #   if (input$state_d != "United States") {
  #     df <- get_specific_state(input$state_d, diabetes_df)
  #     if (nrow(df) >12) {
  #       df <- sample_n(df, 12)
  #     }
  #     creatBarChart(df, "Diabetes percentage by county", "darkred")
  #   }
  # })
  # output$s3 <- renderPlot({
  #   if (input$state_d != "United States") {
  #     df <- get_specific_state(input$state_d, diabetes_df)
  #     if (nrow(df) >12) {
  #       df <- sample_n(df, 12)
  #     }
  #     creatBarChart(df, "Diabetes percentage by county", "darkred")
  #   }
  # })
}