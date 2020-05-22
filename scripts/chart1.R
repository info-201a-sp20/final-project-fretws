# A file with a function that returns your first chart

# Change over time by travel category
plot_1 <- function(data) {
  data_test <- data %>%
    select(-sub_region_1) %>%
    mutate(week = lubridate::week(lubridate::ymd(date))) %>%
    group_by(week) %>%
    summarise(
      r_and_r = round(
        mean(retail_and_recreation_percent_change_from_baseline, na.rm = TRUE)),
      g_and_p = round(
        mean(grocery_and_pharmacy_percent_change_from_baseline, na.rm = TRUE)),
      parks = round(
        mean(parks_percent_change_from_baseline, na.rm = TRUE)),
      transit = round(
        mean(transit_stations_percent_change_from_baseline, na.rm = TRUE)),
      workplace = round(
        mean(workplaces_percent_change_from_baseline, na.rm = TRUE)),
      residential = round(
        mean(residential_percent_change_from_baseline, na.rm = TRUE))
    ) %>%
    gather(
      key = travel_category,
      value = percent_change,
      -week
    ) %>%
    group_by(week, travel_category)

  ggplot(data = data_test) +
    geom_hline(yintercept = 0, size = 1) +
    geom_line(aes(x = week, y = percent_change, color = travel_category),
              size = 1.25) +
    labs(x = "Week of the Year", y = "Percent Change from Baseline",
         title = "2020 Trends in USA Travel by Category",
         color = "Travel Category") +
    scale_color_ordinal(labels =
                          c("Grocery and Pharmacy", "Parks and Recreation",
                            "Retail and Recreation", "Residential",
                            "Transit Stations", "Workplaces"))
}
