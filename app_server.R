library("dplyr")
library("tidyr")
library("lubridate")
library("stringr")

source("scripts/pg2plot.R")
source("scripts/pg4plot.R")

mobility <- read.csv("data/Global_Mobility_Report.csv")
average_table <- aggregated_table(mobility)

server <- function(input, output) {

   output$pg2plot <- renderPlot({
      pg2plot(data = mobility,
              categories = input$trav_cat,
              date_range = input$date_range)
   })

   output$chart3 <- renderPlotly({
      # It makes more sense to call plot_3 here, right?
      plot_3(data = average_table,
             date_select = input$date_page_3)
      # pg3plot
   })
   output$pg4plot <- renderPlot({
      build_bar(data = deaths,
                region_input = input$sel_reg,
                day = input$sel_date)
   })
}
