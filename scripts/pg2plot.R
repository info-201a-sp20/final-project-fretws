# Define a function that takes in a cleaned dataset of mobility data and plots
# trends in the given travel category over the given time frame.

pg2plot <- function(data, categories)
   grouped <- data %>%
      mutate(week = week(ymd(date))) %>%
      group_by(week)

   averages <- grouped %>%
      select(week) %>%
      unique.data.frame()

   for (col in categories) {
      averages[[col]] = grouped %>%
         summarise(avg = mean(!! as.name(col), na.rm = T)) %>%
         pull(avg)
   }

   averages <- gather(averages,
      key = travel_category,
      value = avg_percent_change,
      -week
    )


   ggplot(averages) +
      geom_line(aes(x = week, y = avg_percent_change, color = travel_category),
                size = 1.25) +
      labs(x = "Week of the Year (2020)", y = "Percent Change from Baseline",
           title = "2020 Trends in USA Travel by Category",
           color = "Travel Category") +
      scale_color_ordinal(labels =
                            c("Grocery and Pharmacy", "Parks and Recreation",
                              "Retail and Recreation", "Residential",
                              "Transit Stations", "Workplaces"))
