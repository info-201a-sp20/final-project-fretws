library("dplyr")
library("ggplot2")
library("plotly")

usa <- map_data(map = "state") %>%
   mutate(region = stringr::str_to_title(region))

pg3plot <- function(data, date_select, category_select) {
   # How have travel habits changed by location in response to the COVID-19
   # stay-at-home orders? Map from midpoint deliverable, but you can change
   # time frame date range widget. Include a paragraph explaining the dates
   # for stay at home orders, so the user knows what time frames to look up.

   # Filter filter and clean dataset
   data <- data %>%
      filter(country_region_code == "US") %>%
      filter(sub_region_1 != "") %>%
      # filter to the given date range
      filter(date > date_select[1], date < date_select[2]) %>%
      # get average of all categories as another column
      mutate(all_categories =
                (grocery_and_pharmacy_percent_change_from_baseline +
                    parks_percent_change_from_baseline +
                    retail_and_recreation_percent_change_from_baseline +
                    transit_stations_percent_change_from_baseline +
                    workplaces_percent_change_from_baseline +
                    residential_percent_change_from_baseline) / 6) %>%
      # remove useless columns
      select(-sub_region_2, -country_region, -country_region_code) %>%
      select(sub_region_1, date, !! as.name(category)) %>%
      # average teh selected category across the given time frame
      group_by(sub_region_1) %>%
      summarise(percent_change_from_baseline = mean(!!as.name(category),
                                                    na.rm = T))

   # join with usa dataset for plotting geometry
   data <- left_join(usa, data, by = c("region" = "sub_region_1"))

   plot <- ggplot(data = data) +
      geom_polygon(mapping = aes(
         x = long,
         y = lat,
         group = group,
         fill = percent_change_from_baseline),
         color = "white") +
      labs(x = "Longitude", y = "Latitude",
           title = "Mobility by State")
   lyplot <- ggplotly(plot)
   lyplot
}

