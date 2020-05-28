library("dplyr")

mobility <- read.csv("Global_Mobility_Report.csv")

server <- function(input, output) {


   output$pg2plot <- renderPlot({
      cat <- input$trav_cat
      data <- mobility %>% select(!! as.name(cat), date)


   })


   output$chart3 <- renderPlot({
      plot_3(average_table)
   })
}
