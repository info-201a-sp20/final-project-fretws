# A file with a function that returns a table of summary information included
# in your report

aggregated_table <- function(df) {
  sum_tab <- mobility %>%
    group_by(sub_region_1) %>%
    summarize(
      workplaces_percent_change_from_baseline =
        round(mean(workplaces_percent_change_from_baseline,
                   na.rm = TRUE), 2),
      parks_percent_change_from_baseline =
        round(mean(parks_percent_change_from_baseline,
                   na.rm = TRUE), 2),
      grocery_and_pharmacy_percent_change_from_baseline =
        round(mean(grocery_and_pharmacy_percent_change_from_baseline,
                   na.rm = TRUE), 2),
      retail_and_recreation_percent_change_from_baseline =
        round(mean(retail_and_recreation_percent_change_from_baseline,
                   na.rm = TRUE), 2),
      transit_stations_percent_change_from_baseline =
        round(mean(transit_stations_percent_change_from_baseline,
                   na.rm = TRUE), 2),
      residential_percent_change_from_baseline =
         round(mean(residential_percent_change_from_baseline,
                    na.rm = TRUE), 2)
    )
  return(sum_tab)
}
