library("dplyr")
library("tidyr")
library("lubridate")
library("stringr")

source("scripts/pg2plot.R")
source("scripts/pg3plot.R")
source("scripts/pg4plot.R")

mobility <- read.csv("data/Global_Mobility_Report.csv")

server <- function(input, output) {
  output$pg2plot <- renderPlot({
    pg2plot(
      data = mobility,
      categories = input$trav_cat,
      date_range = input$date_range
    )
   })


  output$pg3plot <- renderPlotly({
    pg3plot(
      data = mobility,
      date_select = input$date_page_3,
      category = input$pg3_category
    )
  })


  output$pg4plot <- renderPlot({
    build_bar(
      data = deaths,
      region_input = input$sel_reg,
      day = input$sel_date
    )
  })
}
