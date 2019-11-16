library(ggplot2)
source("analysis.R")

server <- function(input, output) {
  
  output$barChart <- renderPlot({
    ggplot(data = focus, aes(x = State, y = !!as.name(input$category))) +
      geom_col() +
      coord_flip() +
      ggtitle("Test plot")
  })
  
}