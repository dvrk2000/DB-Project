# Information page
source("analysis.R")
page_one <- tabPanel(
  "About us",
  titlePanel("Purpose"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Team members"),
      h4("David", style = "color:red"),
      h4("Thomas"),
      h4("Viviannie"),
      h4("Bryanna"),
      img(src = "test.jpg", height = 100, width = 100)
    ),
    
    mainPanel(
      h3("Diabetes Report"),
      p("Plots, data tables, etc. would go here"),
      img(src = "test.jpg", height = 500, width = 500)
    )
  )
)

vis1 <- tabPanel(
  "Diabetes Info",
  sidebarLayout(
    sidebarPanel(
      helpText("Create bar charts with information from states insurance coverage"),
      selectInput("state_d",
                  label = "Choose a category to compare",
                  choices = c("United States", unique(diabetes_df$State)),
                  selected = "United States")
    ),
    mainPanel(
      plotOutput("map_d"),
      plotlyOutput("barchart_d")
    )
  )
)

vis2 <- tabPanel(
  "Physical Inactivity Info",
  sidebarLayout(
    sidebarPanel(
      helpText("Create bar charts with information from states insurance coverage"),
      
      selectInput("state_p",
                  label = "Choose a category to compare",
                  choices = c("United States", unique(inactivity_df$State)),
                  selected = "United States")
    ),
    mainPanel(
      plotOutput("map_p"),
      plotlyOutput("barchart_p")
    )
  )
)

vis3 <- tabPanel(
  "Obesity Info",
  sidebarLayout(
    sidebarPanel(
      helpText("Create bar charts with information from states insurance coverage"),
      
      selectInput("state_o",
                  label = "Choose a category to compare",
                  choices = c("United States", unique(obesity_df$State)),
                  selected = "United States")
    ),
    mainPanel(
      plotOutput("map_o"),
      plotlyOutput("barchart_o")
    )
  )
)

vis4 <- tabPanel(
  "Compare",
  sidebarLayout(
    sidebarPanel(
      helpText("Choose one"),
      
      selectInput("state1",
                  label = "Choose a category to compare",
                  choices = c("D", "P", "O"),
                  selected = "D"),
      selectInput("state2",
                  label = "Choose a category to compare",
                  choices = c("D", "P", "O"),
                  selected = "P"),
      selectInput("state3",
                  label = "Choose a category to compare",
                  choices = c("D", "P", "O"),
                  selected = "O")
    ),
    mainPanel(
      plotOutput("s1"),
      plotOutput("s2"),
      plotOutput("s3")
    )
  )
)

# Data visualization page
page_two <- navbarMenu(
  "Visualizations",
  vis1,
  vis2,
  vis3,
  vis4
)


# Interpretation Page
page_three <- tabPanel(
  "Insights",
  plotOutput("scat1"),
  plotOutput("scat2"),
  plotOutput("scat3")
)

# Technical report page
page_four <- tabPanel(
  "Techniques"
)


ui <- navbarPage(
  theme = shinythemes::shinytheme("flatly"),
  "Diabetes Report",
  page_one,
  page_two,
  page_three,
  page_four
)
