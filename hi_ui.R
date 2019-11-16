# Information page
page_one <- tabPanel(
  "About us",
  titlePanel("Purpose"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Team members"),
      h4("David", style = "color:red"),
      h4("Thomas"),
      h4("Vivianna"),
      h4("Bryanna"),
      img(src = "test.jpg", height = 100, width = 100)
    ),
    
    mainPanel(
      h3("Health insurance coverage in U.S"),
      p("Plots, data tables, etc. would go here"),
      img(src = "test.jpg", height = 500, width = 500)
    )
  )
)

# Data visualization page
page_two <- tabPanel(
  "Visualizations",
  titlePanel("DataVisualization"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create bar charts with information from states insurance coverage"),
      
      selectInput("category",
                  label = "Choose a category to compare",
                  choices = c("Uninsured.Rate..2010.", "Uninsured.Rate..2015.", "Average.Monthly.Tax.Credit..2016."),
                  selected = "Uninsured.Rate..2010.")
    ),
    
    mainPanel(
      plotOutput("barChart"),
    )
  )
)

# Interpretation Page
page_three <- tabPanel(
  "Insights"
)

# Technical report page
page_four <- tabPanel(
  "Techniques"
)


ui <- navbarPage(
  theme = shinythemes::shinytheme("flatly"),
  "Health Insurance Report",
  page_one,
  page_two,
  page_three,
  page_four
)
