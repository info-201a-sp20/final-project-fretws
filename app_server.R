library("dplyr")

mobility <- read.csv("Global_Mobility_Report.csv")
#for testing only
average_table <- aggregated_table(mobility)

server <- function(input, output) {


   output$pg2plot <- renderPlot({
      cat <- input$trav_cat
      data <- mobility %>% select(!! as.name(cat), date)


   })


   output$chart3 <- renderPlotly({
      pg3plot
   })
}
