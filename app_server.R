library("dplyr")
library("tidyr")
library("lubridate")

source("scripts/pg2plot.R")
source("scripts/chart3.R")

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
      plot_3(average_table)
      # pg3plot
   })
}
