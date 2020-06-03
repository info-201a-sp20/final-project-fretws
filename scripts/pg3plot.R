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
    mutate(region = stringr::str_to_title(region))

  data <- read.csv("data/Global_Mobility_Report.csv")
  data <- data %>%
    filter(country_region_code == "US") %>%
    filter(sub_region_1 != "") %>%
    mutate(all_categories =
             (grocery_and_pharmacy_percent_change_from_baseline +
             parks_percent_change_from_baseline +
             retail_and_recreation_percent_change_from_baseline +
             transit_stations_percent_change_from_baseline +
             workplaces_percent_change_from_baseline +
             residential_percent_change_from_baseline) / 6) %>%
    select(-sub_region_2, -country_region, -country_region_code) %>%
    # filter to the given date range
    group_by(sub_region_1) %>%
    summarise(all_categories =
                mean(all_categories, na.rm = T)
              ,
              grocery =
                mean(grocery_and_pharmacy_percent_change_from_baseline,
                     na.rm = T),
              parks =
                mean(parks_percent_change_from_baseline, na.rm = T),
              retail =
                mean(retail_and_recreation_percent_change_from_baseline,
                     na.rm = T),
              transit =
                mean(transit_stations_percent_change_from_baseline, na.rm = T),
              workplaces =
                mean(workplaces_percent_change_from_baseline, na.rm = T),
              residential =
                mean(residential_percent_change_from_baseline, na.rm = T)
              )

  data <- left_join(usa, data, by = c("region" = "sub_region_1"))

  plot <- ggplot(data = data) +
    geom_polygon(mapping = aes(
      x = long,
      y = lat,
      group = group,
      # text = paste0(region,
      #               "\nGrocery and Pharmacy: ", round(grocery, 2),
      #               "\nParks and Recreation: ", round(parks, 2),
      #               "\nRetail and Recreation: ", round(retail, 2),
      #               "\nTransit Stations: ", round(transit, 2),
      #               "\nResidential: ", round(residential, 2),
      #               "\nWorkplaces: ", round(workplaces, 2)),
      fill = all_categories),
      color = "white") +
    labs(x = "Longitude", y = "Latitude",
         title = "Mobility by State")
  # ggplotly(plot, tooltip = "text")
  lyplot <- ggplotly(plot)
  lyplot
}

# test_mob <- pg3plot(mobility, as.Date("2020-02-15"))

