library("dplyr")
library("lubridate")

mobility <- read.csv("data/Global_Mobility_Report.csv")

server <- function(input, output) {


   output$pg2plot <- renderPlot({
      cat <- input$trav_cat
      data <- mobility %>%
         select(!! as.name(cat), date) %>%
         mutate(week = week(ymd(date))) %>%
         group_by(week) %>%
         summarise(avg = mean(!! as.name(cat)))

      data <- mobility %>%
         mutate(week = week(ymd(date))) %>%
         group_by(week)

      for (col in choices) {
         # print(as.name(col))
         df2 <- summarise(data, avg = mean(!! as.name(choices), na.rm = T))
      }

      ggplot(data) +
         geom_smooth(aes(x = week, y = avg))

   })


   output$chart3 <- renderPlot({
      plot_3(average_table)
   })
}
