choice_values <- c(
   # "average",
   "retail_and_recreation_percent_change_from_baseline",
   "grocery_and_pharmacy_percent_change_from_baseline",
   "parks_percent_change_from_baseline",
   "transit_stations_percent_change_from_baseline",
   "workplaces_percent_change_from_baseline",
   "residential_percent_change_from_baseline")

choice_names <- choice_values %>%
      str_replace("percent_change_from_baseline", "") %>%
      str_replace_all("_", " ") %>%
      str_to_title() %>%
      str_replace_all("And", "and")


# define variable for sidebar panel for second page
side_bar <- sidebarPanel(
   # widgets
   checkboxGroupInput(
      inputId = "trav_cat",
      label = h3("Travel Category"),
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
   ),
   p("In order to analyze the trends in movement after the stay at home order, we thought it best to be
     able to select which category and time frame to view. By comparing the different categories, the contrast
     in essential movements becomes apparent. These trends can be more specifically understood by selecting the
     a specific timeframe and can show whether the release of the geolocation data had any effect on the individual
     behavior.")
)

#define variable to maneuver content for second page
page_two <- tabPanel(
   title = h1("Categorical Changes in Movement"),
   sidebarLayout(
      sidebarPanel = side_bar,
      mainPanel = main_panel
   )
)