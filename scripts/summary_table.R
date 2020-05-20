# A file with a function that returns a table of summary information included
# in your report
library("dplyr")
library("tidyr")
google_data <- read.csv("data/Global_Mobility_Report.csv", stringsAsFactors = FALSE)

google_data <- Global_Mobility_Report %>%
   filter(country_region_code == "US")
average_table <- google_data %>%
   group_by(sub_region_1) %>%
   summarize(workplaces_percent_change_from_baseline = mean(workplaces_percent_change_from_baseline, na.rm = TRUE),
             parks_percent_change_from_baseline = mean(parks_percent_change_from_baseline, na.rm = TRUE),
             grocery_and_pharmacy_percent_change_from_baseline = mean(grocery_and_pharmacy_percent_change_from_baseline, na.rm = TRUE),
             retail_and_recreation_percent_change_from_baseline = mean(retail_and_recreation_percent_change_from_baseline, na.rm = TRUE),
             transit_stations_percent_change_from_baseline = mean(transit_stations_percent_change_from_baseline, na.rm = TRUE))

aggregated_table <- gather(average_table,
                          key = Category,
                          value = Average,
                          -sub_region_1,
                          )
kable(aggregated_table)