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
      createPlotlybar(df, "Diabetes percentage by county", "darkred")
    }
  })
  output$barchart_p <- renderPlotly({
    if (input$state_p != "United States") {
      df <- get_specific_state(input$state_p, inactivity_df)
      createPlotlybar(df, "Inactivity percentage by county", "navyblue")
    }
  })
  output$barchart_o <- renderPlotly({
    if (input$state_o != "United States") {
      df <- get_specific_state(input$state_o, inactivity_df)
      createPlotlybar(df, "Obesity percentage by county", "gold")
    }
  })

  output$scat1 <- renderPlot(
    createScatplot(d_p_df) +
      theme(plot.title = element_text(size = 20),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14)) +
      labs(title = "Relationship between Diabetes and Physical Inactivity",
           x = "Physical Inactivity Rate",
           y = "Diabetes Rate")
  )

  output$scat2 <- renderPlot(
    createScatplot(d_o_df) +
      theme(plot.title = element_text(size = 20),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14)) +
      labs(title = "Relationship between Diabetes and Obesity",
           x = "Obesity Rate",
           y = "Diabetes Rate")
  )

  output$scat3 <- renderPlot(
    createScatplot(p_o_df) +
      theme(plot.title = element_text(size = 20),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14)) +
      labs(title = "Relationship between Physical Inactivity and Obesity",
           x = "Physical Inactivity Rate",
           y = "Obesity Rate")
  )

  output$specific_d <- renderTable({
    if (input$state_d != "United States") {
      target <- agrep(input$county_d, diabetes_df$County, ignore.case = T)
      df <- diabetes_df[target, ]
      createSearchtable(df)
    }
  })

  output$specific_p <- renderTable({
    if (input$state_p != "United States") {
      target <- agrep(input$county_p, inactivity_df$County, ignore.case = T)
      df <- inactivity_df[target, ]
      createSearchtable(df)
    }
  })

  output$specific_o <- renderTable({
    if (input$state_o != "United States") {
      target <- agrep(input$county_o, obesity_df$County, ignore.case = T)
      df <- obesity_df[target, ]
      createSearchtable(df)
    }
  })

  output$search_d <- renderUI({
    if (input$state_d != "United States") {
      textInput("county_d",
                label = "Quick Search by county name",
                value = "Miami")
    }
  })

  output$search_p <- renderUI({
    if (input$state_p != "United States") {
      textInput("county_p",
                label = "Quick Search by county name",
                value = "Miami")
    }
  })

  output$search_o <- renderUI({
    if (input$state_o != "United States") {
      textInput("county_o",
                label = "Quick Search by county name",
                value = "Miami")
    }
  })
}
