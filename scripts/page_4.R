
library(shiny)
library("dplyr")
library(stringr)

# define variable for sidebar panel for fourth page
fourth_sidebar_content_one <- sidebarPanel(
   checkboxInput(
      "barcheck",
      label = "Select State",
      value = list("Alabama", "Alaska", "Arizona", "Arkansa", "California",
                   "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida",
                   "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
                   "Kentucky", "Louisana", "Maine", "Maryland", "Massachusetts", "Michigan",
                   "Minnesota", "Mississppi", "Missouri", "Montana", "Nebraska", "Nevada",
                   "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
                   "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
                   "South Carolina", "South Dakota", "Tennesse", "Texas", "Utah", "Vermont",
                   "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
      )
   )
)
fourth_sidebar_content_two <- sidebarPanel(
   dateRangeInput(
   label = "Select Date Range",
   start = "01/04/2020",
   min = "2020-02-15",
   max = "2020-05-07",
   format = "yyyy-mm-dd"
   )
)
# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   "Page Three",
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
