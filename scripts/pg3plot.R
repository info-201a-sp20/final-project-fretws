library("dplyr")
library("ggplot2")
library("plotly")

pg3plot <- function(data, date_select) {
  # How have travel habits changed by location in response to the COVID-19
  # stay-at-home orders? Map from midpoint deliverable, but you can change
  # time frame date range widget. Include a paragraph explaining the dates
  # for stay at home orders, so the user knows what time frames to look up.

  # filter mobility dataset
  # add long, lat, and region = sub_region_1 to mobility
  usa <- map_data(map = "state") %>%
    select(-subregion, -order) %>%
    mutate(region = stringr::str_to_title(region))

  mobility_small <- data %>%
    filter(country_region == "United States") %>%
    filter(sub_region_1 != "") %>%
    mutate(region = sub_region_1) %>%
    select(-sub_region_2, -sub_region_1) %>%
    mutate(all_categories =
             (grocery_and_pharmacy_percent_change_from_baseline +
             parks_percent_change_from_baseline +
             retail_and_recreation_percent_change_from_baseline +
             transit_stations_percent_change_from_baseline +
             workplaces_percent_change_from_baseline) / 5)

  df <- left_join(mobility_small, usa, by = "region")

  plot <- ggplot(data = df) +
    geom_polygon(mapping = aes(
      x = long,
      y = lat,
      text = paste0(region,
                    "\nGrocery and Pharmacy: ",
                    round(grocery_and_pharmacy_percent_change_from_baseline, 2),
                    "\nParks and Recreation: ",
                    round(parks_percent_change_from_baseline, 2),
                    "\nRetail and Recreation: ",
                    round(retail_and_recreation_percent_change_from_baseline, 2),
                    "\nTransit Stations: ",
                    round(transit_stations_percent_change_from_baseline, 2),
                    "\nWorkplaces: ",
                    round(workplaces_percent_change_from_baseline, 2)),
      fill = all_categories),
      color = "white"
    ) +
    labs(x = "Longitude", y = "Latitude",
         title = "Mobility by Date")
  ggplotly(plot, tooltip = "text")
}

# test_mob <- pg3plot(mobility, as.Date("2020-02-15"))
