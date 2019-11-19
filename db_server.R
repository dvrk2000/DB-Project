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
  
  output$barchart_d <- renderPlot({
    if (input$state_d != "United States") {
      df <- get_specific_state(input$state_d, diabetes_df)
      if (nrow(df) >12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Diabetes percentage by county", "darkred")
    }
  })
  output$barchart_p <- renderPlot({
    if (input$state_p != "United States") {
      df <- get_specific_state(input$state_p, inactivity_df)
      if (nrow(df) > 12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Inactivity percentage by county", "navyblue")
    }
  })
  output$barchart_o <- renderPlot({
    if (input$state_o != "United States") {
      df <- get_specific_state(input$state_o, inactivity_df)
      if (nrow(df) > 12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Obesity percentage by county", "gold")
    }
  })
  
  # Testttttttt
  output$s1 <- renderPlot({
    if (input$state_d != "United States") {
      df <- get_specific_state(input$state_d, diabetes_df)
      if (nrow(df) >12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Diabetes percentage by county", "darkred")
    }
  })
  output$s2 <- renderPlot({
    if (input$state_d != "United States") {
      df <- get_specific_state(input$state_d, diabetes_df)
      if (nrow(df) >12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Diabetes percentage by county", "darkred")
    }
  })
  output$s3 <- renderPlot({
    if (input$state_d != "United States") {
      df <- get_specific_state(input$state_d, diabetes_df)
      if (nrow(df) >12) {
        df <- sample_n(df, 12)
      }
      creatBarChart(df, "Diabetes percentage by county", "darkred")
    }
  })
}