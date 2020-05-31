
library(shiny)
library("dplyr")
library(stringr)

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
death_and_mobility <- function(df) {
   df_1 <- df %>%
      group_by(region) %>%
      summarise(
         mean(Excess_Death = Percent.Excess),
         mean(Mobility = mobility_average)
      ) %>%
   ggplot(data = df) +
      geom_bar(aes(x = region, y = Mobility,
                             fill = Percent.Excess)) +
                  labs( x = "Region", y = "Excess Death and Average Mobility", 
                        title = "Excess Death and Mobility by Region") 
}
   
death_and_mobility(mobility_deaths)

# Practice Function 
mobility <- function(df, date_range, region) {
   df_2 <- df %>%
      filter(date == date_range) %>%
      
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
