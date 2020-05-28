library("dplyr")

server <- function(input, output) {


   output$pg2plot <- renderplot({

   })


   output$chart3 <- renderPlot({
      plot <- plot_3(average_table)
   })
}
