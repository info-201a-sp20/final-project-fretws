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

   # Filter down to only data in the user-selected timeframe
   filtered <- data %>%
      mutate(date = ymd(date)) %>%
      filter((date > date_range[1]) & (date < date_range[2]))

   # If the date range is small enough, plot the data by day instead of by
   # week.
   coarse_data <- yday(date_range[2]) - yday(date_range[1]) > 15
   # coarse_data <- T

   if (coarse_data) {
      grouped <- filtered %>%
         mutate(time = week(date)) %>%
         group_by(time)
      x_axis <- "Week of the Year (2020)"
   } else {
      grouped <- filtered %>%
         mutate(time = date) %>%
         group_by(time)
      x_axis <- "Day of the Year (2020)"
   }

   # Initialize a dataframe to then add averages to
   averages <- grouped %>%
      select(time) %>%
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
      -time
   )

   # Clean up category names for use in labels
   legend <- categories %>%
      str_replace("_percent_change_from_baseline", "") %>%
      str_replace_all("_", " ") %>%
      str_to_title() %>%
      str_replace_all("And", "and")

   # Plot data
   plt <- ggplot(averages) +
      geom_hline(yintercept = 0, size = 1) +
      geom_line(aes(x = time, y = avg_percent_change, color = travel_category),
                size = 1.25) +
      theme_dark() +
      scale_color_brewer(
         type = "qual",
         limits = categories,
         labels = legend) +
      labs(x = x_axis, y = "Percent Change from Baseline",
           title = "2020 Trends in USA Travel by Category",
           color = "Travel Category")

   if (coarse_data) {
      apple_data_release <- week(ymd("2020-4-14"))
      google_data_release <- week(ymd("2020-4-03"))
   } else {
      apple_data_release <- ymd("2020-4-14")
      google_data_release <- ymd("2020-4-03")
   }
   # Plot lines and text labels for the dates that Google and Apple mobility
   # data were released
   plt +
      geom_vline(xintercept = apple_data_release,
                 color = "white", size = 0.75) +
      geom_vline(xintercept = google_data_release,
                 color = "white", size = 0.75) +
      geom_text(mapping = aes(x = apple_data_release, y = 0,
                    label = "Apple Initial Data Release"),
                color = "white", angle = 90, vjust = -0.75) +
      geom_text(mapping = aes(x = google_data_release, y = 0,
                    label = "Google Initial Data Release"),
                color = "white", angle = 90, vjust = -0.75)
}
