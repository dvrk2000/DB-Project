# User Interface page
source("analysis.R")
page_one <- tabPanel(
  "About us",
  titlePanel("Purpose"),
  sidebarLayout(
    sidebarPanel(
      h3("Team members"),
      h4("David"),
      h4("Thomas"),
      h4("Viviannie"),
      h4("Bryanna"),
      img(src = "test.jpg", height = 100, width = 100)
    ),
    mainPanel(
      h3(strong("Background")),
      p("Overview of/background of diabetes in the U.S."),
      h3(strong("Why does this matter?")),
      p("Talk about why this is an issue and why it matters")
    )
  )
)

vis1 <- tabPanel(
  "Diabetes Info",
  sidebarLayout(
    sidebarPanel(
      helpText("Create bar charts with information
               from diabetes"),
      selectInput("state_d",
                  label = "Choose a state",
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
      helpText("Create bar charts with information
               from physical inactivity"),
      selectInput("state_p",
                  label = "Choose a state",
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
      helpText("Create bar charts with information
               from obesity"),
      selectInput("state_o",
                  label = "Choose a state",
                  choices = c("United States", unique(obesity_df$State)),
                  selected = "United States")
    ),
    mainPanel(
      plotOutput("map_o"),
      plotlyOutput("barchart_o")
    )
  )
)

# Test for final:
# vis4 <- tabPanel(
#   "Compare",
#   sidebarLayout(
#     sidebarPanel(
#       helpText("Choose one"),
#       selectInput("state1",
#                   label = "Choose a category to compare",
#                   choices = c("D", "P", "O"),
#                   selected = "D"),
#       selectInput("state2",
#                   label = "Choose a category to compare",
#                   choices = c("D", "P", "O"),
#                   selected = "P"),
#       selectInput("state3",
#                   label = "Choose a category to compare",
#                   choices = c("D", "P", "O"),
#                   selected = "O")
#     ),
#     mainPanel(
#       plotOutput("s1"),
#       plotOutput("s2"),
#       plotOutput("s3")
#     )
#   )
# )

# Data visualization page
page_two <- navbarMenu(
  "Visualizations",
  vis1,
  vis2,
  vis3
  # vis4
)


# Interpretation Page
page_three <- tabPanel(
  "Insights",
  p("From what we have so far, we can observe some relationships between the
    three datasets. For instance, there is a clear dark-colored area on the
    East Coast in all three datasets. In the future final project, we will
    create a compare option that takes two datasets and make a scatter plot
    to show the correlation. Now the counties are ten names that randomly
    taken from the dataset. We will also make a filter for the user to see
    how many counties are shown and search for a specific county. Our next
    goal is to find supporting evidence and make a detailed analysis. We will
    improve our visualization to make them more interactive. Now, we are still
    a little bit weak to show the causation so we will also address it. "),
  plotOutput("scat1"),
  plotOutput("scat2"),
  plotOutput("scat3")
)

# Technical report page
page_four <- tabPanel(
  "Techniques",
  p("The application was built first using an analysis.R file. This file holds
  four main functions in order to ease the process of creating visualizations.
  One function allows for consistency across each dataset that is uploaded for
  the project. This function changes string values to numerical values, provides
  the proper arguments when reading csv files, and renames a few columns. This
  is useful because all three of the datasets use the same column names and
  types of data. Another function allows us to create the heatmaps consistently
  as well. The same goes for a function to make the bar charts consistently.
  Finally, there is a function that obtains each state in the data."),
  p("The data was uploaded using the read_csv() function to read the csv files.
  The libraries used were “tidyverse,” “dplyr,” “stringr,” “ggplot2,”
  “rsconnect, ” “shiny,” “usmap,” “tidyr,” and “shinytheme.” These were all
  crucial to creating the Shiny application. The code was organized using four
  different R script files. The analysis.R file, as previously mentioned, is
  for the functions. The db_server.R is for the code related to creating the
  server. The db_ui.R file is for the code related to creating the user
  interface. Finally the app.R file is to run and launch the Shiny
  application."),
  p("For more information, visit our ", a("wiki.",
    href = "https://github.com/dvrk2000/DB-Project/wiki/Technical-Report"))
)

ui <- navbarPage(
  theme = shinythemes::shinytheme("flatly"),
  "Diabetes Report",
  page_one,
  page_two,
  page_three,
  page_four
)
