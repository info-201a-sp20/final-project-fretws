
library(shiny)
library("dplyr")
library(stringr)

# define variable for sidebar panel for fourth page
fourth_sidebar_content_one <- sidebarPanel(
   selectInput(
      "barcheck",
      label = "Select Region",
      value = list("North", "NorthEast", "NorthCentral", "West", "East", "South"
      )
   )
)
fourth_sidebar_content_two <- sidebarPanel(
   dateInput(
   label = "Select Date Range",
   start = "01/04/2020",
   min = "2020-02-15",
   max = "2020-05-07",
   format = "yyyy-mm-dd"
   )
)
# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   "Page Four",
   plotlyOutput("bar")
)

# define a variable for a panel to hold the content for the fourth page
page_4 <- tabPanel(
   "bar",
   titlePanel("State Effectiveness"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_sidebar_content_two,
      fourth_main_content)
)

#create data frame with regions for states
region <- as.data.frame(list(state.name, state.region)) %>%
   rename(State = c..Alabama....Alaska....Arizona....Arkansas....California....Colorado...) %>%
   rename(region = structure.c.2L..4L..4L..2L..4L..4L..1L..2L..2L..2L..4L..4L..3L..)

#load deaths dataset
deaths <- read.csv("Excess_Deaths_Associated_with_COVID-19.csv", stringsAsFactors = FALSE)

#combine add regions to deaths dataset and filter unneeded columns
deaths <- deaths %>%
   left_join(region) %>%
   select(Week.Ending.Date, State, region, Excess)
