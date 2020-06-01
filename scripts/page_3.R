library("shiny")
library("dplyr")
library("plotly")
library("ggplot2")

page_three <- tabPanel(
  "Page Three",
  dateInput(
    "date_page_3",
    label = "Select Date",
    start = as.Date("2020-02-15"),
    min = as.Date("2020-02-15"),
    max = as.Date("2020-05-07")
  ),
  plotlyOutput(
    "chart3"
  )
)

pg3plot <- shinyPlot_3(mobility)

#define variable for sidebar panel for third page

#define variable for main panel for third page

#define variable to maneuver panel for third page

shinyPlot_3 <- function(data, inputDate = as.Date("2020-02-15")) {
  
  usa <- map_data(map = "state") %>%
    select(-subregion) %>%
    mutate(region = stringr::str_to_title(region))
  df <- left_join(usa, data, by = c("region" = "sub_region_1")) %>%
    mutate(all_categories =
      grocery_and_pharmacy_percent_change_from_baseline +
      parks_percent_change_from_baseline +
      retail_and_recreation_percent_change_from_baseline +
      transit_stations_percent_change_from_baseline +
      workplaces_percent_change_from_baseline / 5) %>%
    filter(as.Date(date) == inputDate)
  
  plot <- ggplot(df) +
    # Suppress warning from using text argument for tooltip
    suppressWarnings(
      geom_polygon(
        aes(
          x = long,
          y = lat,
          group = group,
          text = paste0(region,
            "\nGrocery and Pharmacy: ",
            grocery_and_pharmacy_percent_change_from_baseline,
            "\nParks and Recreation: ",
            parks_percent_change_from_baseline,
            "\nRetail and Recreation: ",
            retail_and_recreation_percent_change_from_baseline,
            "\nTransit Stations: ",
            transit_stations_percent_change_from_baseline,
            "\nWorkplaces: ",
            workplaces_percent_change_from_baseline),
          fill = all_categories),
        color = "white")) +
    labs(x = "Longitude", y = "Latitude",
         title = "Mobility by State", fill = "All Categories")
  ggplotly(plot, tooltip = "text")
}
