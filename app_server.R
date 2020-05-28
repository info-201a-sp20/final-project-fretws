library("dplyr")

server <- function(input, output) {
  output$chart3 <- renderPlot({
    plot <- plot_3(average_table)
  })
}
