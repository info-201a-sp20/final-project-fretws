library("shiny")
library("plotly")

#define variable for the sidebar of the third page
third_sidebar_content <-
   sidebarPanel(
      dateInput(
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
   )
)

#define a variable that takes in the contents for the third page
page_three <- tabPanel(
   "Covid Map of US",
   sidebarLayout(
      third_sidebar_content,
      third_main_content
   )
)
