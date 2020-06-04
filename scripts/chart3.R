# A file with a function that returns your third chart

# Map of mobility per state

#load function to pass lint check
library("dplyr")
library("plotly")
library("ggplot2")

plot_3 <- function(data, date_select) {

   usa <- map_data(map = "state") %>%
      select(-subregion) %>%
      mutate(region = stringr::str_to_title(region))
   df <- left_join(usa, data, by = c("region" = "sub_region_1")) %>%

      mutate(all_categories =
                grocery_and_pharmacy_percent_change_from_baseline +
                parks_percent_change_from_baseline +
                retail_and_recreation_percent_change_from_baseline +
                transit_stations_percent_change_from_baseline +
                workplaces_percent_change_from_baseline / 5)

   plot <- ggplot(df) +
      # Suppress warning from using text argument for tooltip
      suppressWarnings(
      geom_polygon(
         aes(x = long, y = lat, group = group, text = paste0(region,
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
         color = "white")) +
      labs(x = "Longitude", y = "Latitude",
           title = "Mobility by State", fill = "All Categories")
   ggplotly(plot, tooltip = "text")
}

plot_3(mobility, as.Date("2020-02-15"))
