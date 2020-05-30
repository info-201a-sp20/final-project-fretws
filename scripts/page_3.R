library("shiny")
library("plotly")

page_three <- tabPanel(
  "Page Three",
  dateInput(
    "date_page_3",
    label = "Select Date",
    start = as.Date("2020-02-15"),
    min = as.Date("2020-02-15"),
    max = as.Date("2020-05-07")
  ),
  plotlyOutput(
    "chart3"
  )
)

# pg3plot <- plot_3(average_table)
#define variable for sidebar panel for third page

#define variable for main panel for third page

#define variable to maneuver panel for third page