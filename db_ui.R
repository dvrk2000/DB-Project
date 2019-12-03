# User Interface page
source("analysis.R")
page_one <- tabPanel(
  "About us",
  titlePanel("Purpose"),
  sidebarLayout(
    sidebarPanel(
      h4("Team members"),
      p("David"),
      p("Thomas"),
      p("Viviannie"),
      p(img(src = "bryanna.png", heigh = 40, width = 40), "Bryanna")
    ),
    mainPanel(
      h3(strong("Background")),
      p("Every year the population of people with diabetes grows,
        and in recent years, this growth has increased rapidly [3].
        Approximately 9.4% of people in the U.S. have diabetes,
        which is about 30 million people [3]. There are two types
        of diabetes, Type I and Type II. Type I diabetes occurs
        when the individual’s pancreas is making little to no
        insulin [1]. Type II diabetes occurs when the pancreas
        overproduces insulin because the individual’s body is
        abnormally responsive to insulin [2]."),
      p("Diabetes has become a prevalent disease to the U.S., and
        this is starting to cause issues with those who are impacted
        because deaths from the disease and the cost of the disease
        are both rising to a concerning state. This puts a burden on
        the individual that is diagnosed and their families because
        diabetes has become a more difficult disease to handle. One
        of the issues involving diabetes is the fatality rate of the
        disease. In 2015, diabetes was the seventh leading cause of
        death in the U.S. [3]. This is concerning considering how common
        diabetes is, and the fact that the U.S. is a leader in modern
        medicine. However, another issue with diabetes is the rising
        cost of the disease. It costs about $13,700 a year in medical
        expenses for people with diabetes, which is about 2.3 times more
        than people without diagnosed diabetes [3]. If the amount of people
        with diabetes continues to rapidly increase, then this could be
        detrimental to the U.S. population."),
      p("Two members of the group share a personal connection to family
        members with diabetes and have witnessed the difficulties of
        living with diabetes. While there is already political debate
        over reducing the cost of insulin, there is also concern about
        ways to prevent or maintain the disease by reducing the risk factors
        of diabetes. Individuals can do this by increasing their physical
        activity, or adopting other lifestyle changes to help people maintain
        their weight because this can cause Type II diabetes [5]."),
      h3(strong("Why does this matter?")),
      p("Diabetes is a fairly common illness in the U.S. The fact that it
        is a common form of death in the U.S. is concerning because there
        is a variety of ways for people to maintain their diabetes, mainly
        though the form of pills and/or insulin. Additionally, if diabetes
        is not controlled and treated, then it can lead to other serious
        conditions like blindness or end-stage renal failure [4]. However,
        the cost of maintaining diabetes has become very expensive, making
        medicine less attainable for people with diabetes [4]. Because the
        issue of the rising cost of healthcare and the increasing rate of
        deaths by diabetes concerns a much larger political issue, the least
        we can do is find ways to reduce people’s risk factors of getting
        diabetes through careful analysis of possible causes of diabetes, and
        causes to help maintain diabetes."),
      p(strong("References")),
      p("[1] Center for Disease Control. (n.d.) Type 1 Diabetes. Retrieved from",
        a("https://www.cdc.gov/diabetes/basics/type1.html",
          href = "https://www.cdc.gov/diabetes/basics/type1.html")),
      p("[2] Center for Disease Control. (n.d.) Type 2 Diabetes. Retrieved from",
        a("https://www.cdc.gov/diabetes/basics/type2.html",
          href = "https://www.cdc.gov/diabetes/basics/type2.html")),
      p("[3] Diabetes Research Institute Foundation. (n.d.).
      Diabetes Statistics. Retrieved from",
        a("https://www.diabetesresearch.org/diabetes-statistics",
          href = "https://www.diabetesresearch.org/diabetes-statistics")),
      p("[4] National Institute of Diabetes and
      Digestive and Kidney Diseases. (n.d.).
      Current Burden of Diabetes in the U.S.
        Retrieved from",
        a("https://www.niddk.nih.gov/health-information/
        communication-programs/ndep/
        health-professionals/
        practice-transformation-physicians-health-care-teams
        /why-transform/current-burden-diabetes-us",
          href = "    https://www.niddk.nih.gov/health-information/
        communication-programs/ndep/
        health-professionals/
        practice-transformation-physicians-health-care-teams
        /why-transform/current-burden-diabetes-us")),
      p("[5] National Institute of Diabetes and Digestive and Kidney Diseases.
      (n.d.). Symptoms & Causes of Diabetes. Retrieved from",
        a(" https://www.niddk.nih.gov/health-information/
        diabetes/overview/symptoms-causes",
          href = " https://www.niddk.nih.gov/health-information/
        diabetes/overview/symptoms-causes"))
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
