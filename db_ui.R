# User Interface page
source("analysis.R")
page_one <- tabPanel(
  "About us",
  titlePanel("Purpose"),
  sidebarLayout(
    sidebarPanel(
      h4("Team members"),
      p("David"),
      img(src = "David.jpg", heigh = 40, width = 40),
      p("Thomas"),
      img(src = "Thomas.jpg", heigh = 40, width = 40),
      p("Viviannie"),
      img(src = "Viviannie.jpg", heigh = 40, width = 40),
      p("Bryanna"),
      img(src = "Bryanna.jpg", heigh = 40, width = 40)
    ),
    mainPanel(
      h3(strong("Background")),
      p("Every year the population of people with diabetes grows,
        and in recent years, this growth has increased rapidly [3].
        Approximately 9.4% of people in the U.S. have diabetes,
        which is about 30 million people [3]. There are two types
        of diabetes, Type I and Type II. Type I diabetes occurs
        when the individual???s pancreas is making little to no
        insulin [1]. Type II diabetes occurs when the pancreas
        overproduces insulin because the individual???s body is
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
        we can do is find ways to reduce people???s risk factors of getting
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
  p("As previously discussed, factors like physical inactivity
    and weight can make an impact on whether someone is
    diagnosed with diabetes, or how they are able to maintain the
    disease. By controlling these factors, people are able to reduce
    their likelihood of getting Type II diabetes. Further, those who
    are already diagnosed with diabetes could reduce their likelihood
    of experiencing complications of the disease through the management
    of their physical activity and weight. Diabetes is primarily managed
    by the person affected by it, so through careful lifestyle choices
    people with diabetes could help with controlling the disease. This
    group wants to understand that there is a correlational relationship
    between the rate of diabetes and the rate of physical inactivity and
    obesity to ensure that these factors have an impact on the rate of diabetes."),
  plotOutput("scat1"),
  p("This plot shows the relationship between the rate of diagnosed diabetes
    and the rate of physical inactivity. There is a positive correlation between
    these two variables. As the rate of physical inactivity increases, the rate
    of diabetes also increases. This is indicative that physical inactivity
    possibly has an impact on how many people in the U.S. have diabetes. If people
    that are less physically active are more likely to get diabetes, then increasing
    their activity could reduce their likelihood of a diabetes diagnosis."),
  plotOutput("scat2"),
  P("This plot shows the relationship between the rate of diabetes and the rate of
    obesity in the U.S. There is also a positive correlation shown here. As the rate
    of obesity increases, so does the rate of diabetes. Therefore, an assumption
    can be made about the rate of obesity, and that it can cause a greater likelihood
    of diabetes."),
  plotOutput("scat3"),
  p("This plot shows the relationship between the rate of physical inactivity
    and the rate of obesity. As the rate of physical inactivity increases, the
    rate of obesity increases. This shows that physical inactivity is a likely
    factor to the rate of obesity. If people are more physically active, then
    this could reduce the rate of obesity."),
  p("In conclusion, obesity and physical inactivity are risk factors to
    diabetes. Whether it causes diabetes or makes it harder to maintain, if people
    start making healthier lifestyle choices, then they could reduce the rate of
    diabetes in the U.S. First, the rate of obesity could decrease as the rate of
    physical inactivity decreases. The more active people are, the healthier they
    could become. In addition to physical inactivity, other lifestyle choices could
    help with weight, like healthier food choices and regular visits to a doctor.
    Also, overall physical activity could make an impact on the rate of diabetes.
    If people attempt to increase their physical activity, then the rate of diabetes
    could also decrease. This could be done with taking time out of their day to go
    on a walk, or even participating in recreational activities like biking.
    Controlling diabetes is not just about taking medication or insulin, people’s
    lifestyles also make an impact on their chances of becoming diabetic, and their
    ability to maintain it.")
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
  The libraries used were ???tidyverse,??? ???dplyr,??? ???stringr,??? ???ggplot2,???
  ???rsconnect, ??? ???shiny,??? ???usmap,??? ???tidyr,??? and ???shinytheme.??? These were all
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
