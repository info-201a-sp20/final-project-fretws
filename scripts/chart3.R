
plot_3 <- function(data) {

   usa <- map_data(map = "state") %>%
      select(-subregion) %>%
      mutate(region = stringr::str_to_title(region))
   df <- left_join(usa, data, by = c("region" = "sub_region_1"))
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
            round(workplaces_percent_change_from_baseline, 2))),
         fill = "blue", color = "white")) +
      labs(x = "Longitude", y = "Latitude", title = "Mobility by State")
   ggplotly(plot, tooltip = "text")
}
