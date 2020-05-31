
library(shiny)
library("dplyr")
library(stringr)
library(plotly)
library(ggplot2)

# define variable for sidebar panel for fourth page
fourth_sidebar_content <- sidebarPanel(
   selectInput(
      "barcheck",
      inputId = "sel_reg",
      label = "Select Region",
      choices = list("Northeast" = "Northeast",
                     "MidWest" = "North Central",
                     "West" = "West",
                     "South" = "South"
      )
   ),
   dateInput(
      inputId = "sel_date",
      label = "Select Date Range",
      start = "2020-01-04",
      min = "2020-01-01",
      max = "2020-01-07",
      format = "mm/dd/yyyy"
   )
)

# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   plotOutput("pg4plot")
)

# define a variable for a panel to hold the content for the fourth page
page_four <- tabPanel(
   "bar",
   titlePanel("Death Impact"),
   sidebarLayout(
      fourth_sidebar_content,
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
)
