library("shiny")
library("plotly")

#define variable for the sidebar of the third page
third_sidebar_content <-
   sidebarPanel(
      dateRangeInput(
         "date_page_3",
         label = "Select Date",
         start = as.Date("2020-02-15"),
         min = as.Date("2020-02-15"),
         max = as.Date("2020-05-07")
      )
   )

#define a variable for the main panel of the third page
third_main_content <- mainPanel(
   plotlyOutput(
      "chart3"
   ),

   p("In order to better understand how the travel habits changed by location,
     we paired a date widget with an interactive map. The stay at home order beginning__,
     the changes can be seen by location."))


#define a variable that takes in the contents for the third page
page_three <- tabPanel(
   "Map for Covid Movement in US",
   sidebarLayout(
      third_sidebar_content,
      third_main_content
   )
)
