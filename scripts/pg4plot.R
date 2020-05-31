#create data frame with regions for states
region <- as.data.frame(list(state.name, state.region)) %>%
  rename(State = c..Alabama....Alaska....Arizona....Arkansas....California....Colorado...) %>%
  rename(region = structure.c.2L..4L..4L..2L..4L..4L..1L..2L..2L..2L..4L..4L..3L..)

#load deaths dataset
deaths <- read.csv("Excess_Deaths_Associated_with_COVID-19.csv", stringsAsFactors = FALSE)

#combine add regions to deaths dataset and filter unneeded columns
deaths <- deaths %>%
  left_join(region) %>%
  select(Week.Ending.Date, State, region, Excess)

# function that outputs a bar graph for each state for the selected region
# depicting the number of deaths for the week selected
build_bar <- function(data, region, day) {
  data <- data %>%
    # filter to only display states in the selected region
    filter(region == region) %>%
    group_by(State) %>%
    distinct(State, Excess) %>%
    summarise(
      excess = sum(Excess, na.rm = TRUE)
    )%>%
  #filter to the week of selected input rounding to nearest saturday
    mutate(date = as.Date(day)) %>% #getting error message
    filter(day) #still needs to filter to closest day
  
  #plot the selected data  
  ggplot(data) +
    geom_col(mapping = aes(x = State, y = excess, fill = State)) +
    coord_flip()+
    ggtitle("Excess Death by State in 2020") +
    xlab("States") +
    ylab("Number of Deaths")
}
build_bar(deaths, North, "2020-01-04")
