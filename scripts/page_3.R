library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")

choice_values <- c(
   "all_categories",
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

#define variable for the sidebar of the third page
third_sidebar_content <-
   sidebarPanel(
      dateRangeInput(
         inputId = "date_page_3",
         label = h3("Date Range"),
         min = "2020-02-15",
         start = "2020-02-15",
         max = "2020-05-07",
         end = "2020-05-07",
         format = "yyyy-mm-dd"
      ),
      radioButtons(
         inputId = "pg3_category",
         label = h3("Travel Category"),
         choiceNames = choice_names,
         choiceValues = choice_values
      )
   )

#define a variable for the main panel of the third page
third_main_content <- mainPanel(
   plotlyOutput(
      outputId = "pg3plot"
   ),

   p("In order to better understand how the travel habits changed by location,
     we paired a date widget with an interactive map. The stay at home order beginning__,
     the changes can be seen by location."))

#define a variable that takes in the contents for the third page
page_three <- tabPanel(
   h1("Map for Covid Movement in US"),
   sidebarLayout(
      third_sidebar_content,
      third_main_content
   )
)