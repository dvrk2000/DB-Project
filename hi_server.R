library(ggplot2)
source("analysis.R")

server <- function(input, output) {
  
  output$heatMap <- renderPlot({
    ggplot(get_specific_state(input$state), aes(x = County, y = Percentage)) +
      geom_col() +
      geom_errorbar(aes(ymin = Lower.Limit, ymax = Upper.Limit), width = .2,
                    position = position_dodge(.9)) +
      coord_flip() +
      ggtitle("Test plot")
  })
  
  output$xx <- renderPlot({
    data(county.fips)
    
    ## Set up fake df_pop_county data frame
    df_pop_county <- data.frame(region=county.fips$fips)
    df_pop_county$value <- county.fips$fips
    y <- df_pop_county$value
    df_pop_county$color <- gray(y / max(y))
    
    ## merge population data with county.fips to make sure color column is
    ## ordered correctly.
    counties <- county.fips %>% left_join(df_pop_county, by=c('fips'='region'))
    map("county", fill=TRUE, col=counties$color)
  })
  
}