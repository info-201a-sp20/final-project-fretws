
library(shiny)

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
   min = "01/04/2020",
   max = ""
   )
)
# define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   "Page Three",
   plotlyOutput("bar")
)

# define a variable for a panel to hold the content for the fourth page
fourth_panel <- tabPanel(
   "bar",
   titlePanel("State Effectiveness"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_sidebar_content_two,
      fourth_main_content)
)

# Function for bar chart 
death_and_mobility <- function(df) {
   df <- df %>%
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









