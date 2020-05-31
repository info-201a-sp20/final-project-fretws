
library(shiny)
library("dplyr")
library(stringr)
library(plotly)
library(ggplot2)

# define variable for sidebar panel for fourth page
fourth_sidebar_content_one <- sidebarPanel(
   selectInput(
      "barcheck",
      inputId = "sel_reg",
      label = "Select Region",
      choices = list("North" = "North",
                     "NorthEast" = "NorthEast",
                     "MidWest" = "NorthCentral",
                     "West" = "West",
                     "East" = "East",
                     "South" = "South"
      )
   )
)

fourth_sidebar_content_two <- sidebarPanel(
   dateInput(
   inputId = "sel_date",
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
   titlePanel("Death Impact"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_sidebar_content_two,
      fourth_main_content)
)