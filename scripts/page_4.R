
library(shiny)
library("dplyr")
library(stringr)
library(plotly)
library(ggplot2)

# define variable for sidebar panel for fourth page
fourth_sidebar_content <- sidebarPanel(
   selectInput(
      "barcheck",
      inputId = "sel_reg",
      label = "Select Region",
      choices = list("Northeast" = "Northeast",
                     "MidWest" = "North Central",
                     "West" = "West",
                     "South" = "South"
      )
   ),
   dateInput(
      inputId = "sel_date",
      label = "Select Date Range",
      start = "2020-01-04",
      min = "2020-01-01",
      max = "2020-01-07",
      format = "mm/dd/yyyy"
   )
)

# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   plotOutput("pg4plot")
)

# define a variable for a panel to hold the content for the fourth page
page_four <- tabPanel(
   "bar",
   titlePanel("Death Impact"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_main_content)
)