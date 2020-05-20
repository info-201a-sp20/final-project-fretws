
mobility <- read.csv("data/Global_Mobility_Report.csv") %>%
   filter(country_region_code == "US") %>%
   select(-country_region_code, -country_region)
