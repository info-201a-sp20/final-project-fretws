choiceValues <- c(
   # "average",
   "grocery_and_pharmacy_percent_change_from_baseline",
   "parks_percent_change_from_baseline",
   "retail_and_recreation_percent_change_from_baseline",
   "transit_stations_percent_change_from_baseline",
   "workplaces_percent_change_from_baseline")

choiceNames <- choiceValues %>%
      str_replace("_percent_change_from_baseline", "") %>%
      str_replace_all("_", " ") %>%
      str_to_title() %>%
      str_replace_all("And", "and")


# define variable for sidebar panel for second page
side_bar <- sidebarPanel(
   # widgets
   checkboxGroupInput(
      inputId = "trav_cat",
      label = "Travel Category",
      choiceNames = choiceNames,
      choiceValues = choiceValues
   ),
   dateRangeInput(
      inputId = "date_range",
      label = h3("Date Range"),
      min = "2020-02-15",
      start = "2020-02-15",
      max = "2020-05-07",
      end = "2020-05-07",
      format = "yyyy-mm-dd"
   )
)

#define variable for main panel for second page
main_panel = mainPanel(
   # plot(s)
   plotOutput(
      outputId = "pg2plot"
   )
)

#define variable to maneuver content for second page
page_two <- tabPanel(
   title = "Question",
   sidebarLayout(
      sidebarPanel = side_bar,
      mainPanel = main_panel
   )
)