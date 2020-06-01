
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
      choices = list("East" = "Northeast",
                     "North" = "North Central",
                     "West" = "West",
                     "South" = "South"
      )
   ),
   dateInput(
      inputId = "sel_date",
      label = "Select Date Range",
      min = "2020-01-01",
      max = "2020-01-07",
      format = "yyyy-mm-dd"
   )
)

# define variable for main panel for fourth page
fourth_main_content <- mainPanel(plotOutput("pg4plot"),
                                 p("To better understand the gravity of how travel effects the pandemic, we used a bar chart representing
     the states of each region of the US. The week can be selected to show the excess deaths by state each week
     so that the user can gain a better understanding of how the mobility trends have effected the death toll."))

# define a variable for a panel to hold the content for the fourth page
page_four <- tabPanel(
   "Death Impact",
   sidebarLayout(
      fourth_sidebar_content,
      fourth_main_content)
)
