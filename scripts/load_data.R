
mobility <- read.csv("../data/Global_Mobility_Report.csv",
                     stringsAsFactors = F) %>%
      filter(country_region_code == "US") %>%
      select(-country_region_code, -country_region, -sub_region_2)

deaths <- read.csv("../data/Excess_Deaths_Associated_with_COVID-19.csv",
                   stringsAsFactors = F)
