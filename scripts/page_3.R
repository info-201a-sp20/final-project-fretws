library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")

#define variable for the sidebar of the third page
third_sidebar_content <-
   sidebarPanel(
      dateRangeInput(
         "date_page_3",
<<<<<<< HEAD
         label = "Select Date",
         start = as.Date("2020-02-15"),
         end = as.Date("2020-05-07"),
         min = as.Date("2020-02-15"),
         max = as.Date("2020-05-07")
=======
         label = h3("Date Range"),
         min = "2020-02-15",
         start = "2020-02-15",
         max = "2020-05-07",
         end = "2020-05-07",
         format = "yyyy-mm-dd"
>>>>>>> 5887aaf53fef0716a85e95eb3bafbde700dd38cd
      )
   )

#define a variable for the main panel of the third page
third_main_content <- mainPanel(
   plotlyOutput(
<<<<<<< HEAD
      "pg3plot"
=======
      outputId = "chart3"
>>>>>>> 5887aaf53fef0716a85e95eb3bafbde700dd38cd
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