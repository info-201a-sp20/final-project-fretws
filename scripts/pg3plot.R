pg_3_plot <- function(data, date_page_3){
  # How have travel habits changed by location in response to the COVID-19
  # stay-at-home orders? Map from midpoint deliverable, but you can change
  # time frame date range widget. Include a paragraph explaining the dates
  # for stay at home orders, so the user knows what time frames to look up.

  # filter mobility dataset
  # add long, lat, and region = sub_region_1 to mobility
  usa <- map_data(map = "state") %>%
    select(-subregion, -group, -order) %>%
    mutate(region = stringr::str_to_title(region)) %>%
    group_by(region) %>%
    summarise(
      lat = mean(lat, na.rm = TRUE),
      long = mean(long, na.rm = TRUE)
    )

  mobility_small <- data %>%
    filter(country_region == "United States") %>%
    filter(sub_region_1 != "") %>%
    mutate(region = sub_region_1) %>%
    select(-sub_region_2, -sub_region_1)

  df <- left_join(mobility_small, usa, by = "region")


}

test_mob <- pg_3_plot(mobility, as.Date("2020-02-15"))
