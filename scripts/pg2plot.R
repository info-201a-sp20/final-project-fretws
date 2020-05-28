# Define a function that takes in a cleaned dataset of mobility data and plots
# trends in the given travel category over the given time frame.

pg2plot <- function(data, categories)
   grouped <- mobility %>%
      mutate(week = week(ymd(date))) %>%
      group_by(week)

   for(col in categories){
      grouped[[paste0("avg_", col)]] = grouped %>%
         summarise(avg = mean(!! as.name(col), na.rm = T)) %>%
         pull(avg)
   }


   # for (col in choices) {
   #    # print(as.name(col))
   #    df2 <- summarise(data, avg = mean(!! as.name(choices), na.rm = T))
   # }

   ggplot(data) +
      geom_smooth(aes(x = week, y = avg))