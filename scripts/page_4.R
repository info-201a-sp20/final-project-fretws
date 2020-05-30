
library(shiny)
library("dplyr")


# define variable for sidebar panel for fourth page
fourth_sidebar_content_one <- sidebarPanel(
   checkboxInput(
      "barcheck",
      label = "Select State",
      value = list("Alabama", "Alaska", "Arizona", "Arkansa", "California",
                   "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida",
                   "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
                   "Kentucky", "Louisana", "Maine", "Maryland", "Massachusetts", "Michigan",
                   "Minnesota", "Mississppi", "Missouri", "Montana", "Nebraska", "Nevada",
                   "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
                   "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
                   "South Carolina", "South Dakota", "Tennesse", "Texas", "Utah", "Vermont",
                   "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
      )
   )
)
fourth_sidebar_content_two <- sidebarPanel(
   dateRangeInput(
   label = "Select Date Range",
   start = "01/04/2020",
   min = "2020-02-15",
   max = "2020-05-07",
   format = "yyyy-mm-dd"
   )
)
# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   "Page Three",
   plotlyOutput("bar")
)

# define a variable for a panel to hold the content for the fourth page
page_4 <- tabPanel(
   "bar",
   titlePanel("State Effectiveness"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_sidebar_content_two,
      fourth_main_content)
)

   # Function for bar chart
death_and_mobility <- function(df_1, df_2) {
   df_one <- df_1 %>%
      df_two <- df_2 %>%
         filter(Year == 2020, State != "United States",
                State != "District of Columbia", country_region = "United States", ) %>%
         group_by(State) %>%
         distinct(State, Total.Excess.in.2020) %>%
         summarise(
            excess = sum(Total.Excess.in.2020, na.rm = TRUE)
         )
      ggplot(data = df_1, df_2) +
         geom_col(mapping = aes(x = State, y = excess, fill = State)) +
         coord_flip() +
         ggtitle("Excess Death and Mobility by State in 2020") +
         xlab("Region") +
         ylab("Number of Deaths and Mobility")
}


mobility <- read.csv("Global_Mobility_Report.csv",
                     stringsAsFactors = F) %>%
   filter(country_region_code == "US") %>%
   filter(sub_region_1 != "") %>%
   select(-country_region_code, -country_region, -sub_region_2, -residential_percent_change_from_baseline, -parks_percent_change_from_baseline) %>%
   rename(State = sub_region_1) %>%
   rowwise() %>%
   mutate(mobility_average = mean(c(grocery_and_pharmacy_percent_change_from_baseline,
                                    transit_stations_percent_change_from_baseline,
                                    retail_and_recreation_percent_change_from_baseline,
                                    workplaces_percent_change_from_baseline))) %>%
   select(State, date, mobility_average)


region <- as.data.frame(list(state.name, state.region)) %>%
   rename(State = c..Alabama....Alaska....Arizona....Arkansas....California....Colorado...) %>%
   rename(region = structure.c.2L..4L..4L..2L..4L..4L..1L..2L..2L..2L..4L..4L..3L..)

mobility_regions <- left_join(mobility, region)


deaths <- read.csv("Excess_Deaths_Associated_with_COVID-19.csv",
                   stringsAsFactors = F) %>%
   select(State, Percent.Excess)

mobility_deaths <- left_join(mobility_regions, deaths) %>%
   select(-State)
