
plot_3 <- function(data) {
   data = data %>% select(-sub_region_2)
   usa <- map_data(map = "state") %>% select(-subregion)
   df <- left_join(usa, data, by = c("region" = "sub_region_1"))
   # TODO: Swap out dummy data for real summary dataset
   plot <- ggplot(df) +
      # Suppress warning from using text argument for tooltip
      suppressWarnings(
      geom_polygon(aes(x = long, y = lat, group = group, text = paste0(
         "State: ", region, "\n",
         "Parks: ", parks_percent_change_from_baseline)),
                   fill = "blue", color = "white"))
   ggplotly(plot, tooltip = "text")
}