library("dplyr")
library("lubridate")

source()

mobility <- read.csv("data/Global_Mobility_Report.csv")
average_table <- aggregated_table(mobility)

server <- function(input, output) {


   output$pg2plot <- renderPlot({
      pg2plot(data = mobility, categories = input$trav_cat)
   })


   output$chart3 <- renderPlotly({
      pg3plot
   })
}
