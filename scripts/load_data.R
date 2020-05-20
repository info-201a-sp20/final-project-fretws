# Set your working directory to project directory, so that these paths will
# work without the `../`
# We have to have all of our file paths originate from the project directory,
# so that everything will work for the grader; if the paths have the `../` then
# it will cause errors when the grader tries to knit the index.Rmd file

# If setting your working directory to the project directory doesn't work for
# you, let me know and we can figure it out together --Shane
mobility <- read.csv("data/Global_Mobility_Report.csv",
                     stringsAsFactors = F) %>%
      filter(country_region_code == "US") %>%
      select(-country_region_code, -country_region, -sub_region_2)

deaths <- read.csv("data/Excess_Deaths_Associated_with_COVID-19.csv",
                   stringsAsFactors = F)
