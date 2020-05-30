# Define a function that takes in a cleaned dataset of mobility data and plots
# trends in the given travel category over the given time frame.
library("stringr")

pg2plot <- function(data, categories, date_range) {
   # If no categories have been selected, default to all categories
   if (length(categories) == 0) {
      categories <- c(
         "retail_and_recreation_percent_change_from_baseline",
         "grocery_and_pharmacy_percent_change_from_baseline",
         "parks_percent_change_from_baseline",
         "transit_stations_percent_change_from_baseline",
         "workplaces_percent_change_from_baseline",
         "residential_percent_change_from_baseline")
   }

   grouped <- data %>%
      mutate(date = ymd(date)) %>%
      filter((date > date_range[1]) & (date < date_range[2])) %>%
      mutate(week = week(date)) %>%
      group_by(week)

   averages <- grouped %>%
      select(week) %>%
      unique.data.frame()

   # Add averaged columns for each category selected by the user
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

   # Clean up category names for use in labels
   legend <- categories %>%
      str_replace("_percent_change_from_baseline", "") %>%
      str_replace_all("_", " ") %>%
      str_to_title() %>%
      str_replace_all("And", "and")

   ggplot(averages) +
      geom_hline(yintercept = 0, size = 1) +
      geom_line(aes(x = week, y = avg_percent_change, color = travel_category),
                size = 1.25) +
      theme_dark() +
      scale_color_brewer(
         type = "qual",
         limits = categories,
         labels = legend) +
      labs(x = "Week of the Year (2020)", y = "Percent Change from Baseline",
           title = "2020 Trends in USA Travel by Category",
           color = "Travel Category")
}