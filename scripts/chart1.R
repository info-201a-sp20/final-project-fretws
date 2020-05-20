# A file with a function that returns your first chart

# Change over time by travel catagory

library("dplyr")
library("ggplot2")
library("tidyr")
library("styler")

data <- read.csv("../data/Global_Mobility_Report.csv")

data_test <- data %>%
  select(
    -country_region_code,
    -country_region,
    -sub_region_1,
    -sub_region_2
  ) %>%
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
  geom_line(mapping = aes(x = week, y = mean_percent_change, color = travel_category))

# NOTE* copy code block above into function below when its finished

plot_1 <- function(df) {
  df <- df %>%
    select(
      country_region, date,
      retail_and_recreation_percent_change_from_baseline,
      grocery_and_pharmacy_percent_change_from_baseline,
      parks_percent_change_from_baseline,
      transit_stations_percent_change_from_baseline,
      workplaces_percent_change_from_baseline,
      residential_percent_change_from_baseline
    ) %>%
    group_by(date, country_region) %>%
    summarise(
      r_and_r = round(mean(retail_and_recreation_percent_change_from_baseline, na.rm = TRUE)),
      g_and_p = round(mean(grocery_and_pharmacy_percent_change_from_baseline, na.rm = TRUE)),
      parks = round(mean(parks_percent_change_from_baseline, na.rm = TRUE)),
      transit = round(mean(transit_stations_percent_change_from_baseline, na.rm = TRUE)),
      workplace = round(mean(workplaces_percent_change_from_baseline, na.rm = TRUE)),
      residential = round(mean(residential_percent_change_from_baseline, na.rm = TRUE))
    )
}
