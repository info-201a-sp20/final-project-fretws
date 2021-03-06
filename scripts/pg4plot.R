
library("dplyr")
library("lubridate")
library("ggplot2")
# create data frame with regions for states

usa_regions <- as.data.frame(list(state.name, state.region)) %>%
  `colnames<-`(c("State", "Region"))

# load deaths dataset
deaths <- read.csv("data/Excess_Deaths_Associated_with_COVID-19.csv",
      stringsAsFactors = FALSE)

# combine add regions to deaths dataset and filter unneeded columns
deaths <- deaths %>%
  left_join(usa_regions, by = "State") %>%
  select(Week.Ending.Date, State, Region, Excess) %>%
  mutate(date = mdy(Week.Ending.Date))

# function that outputs a bar graph for each state for the selected region
# depicting the number of deaths for the week selected
build_bar <- function(data, region_input, day_input) {
  filtered <- data %>%
    # filter to only display states in the selected region
    filter(Region == region_input) %>% # filter the selected region
    dplyr::filter(date == day_input) %>% # filter the selected input day
    group_by(State) %>%
    summarise(
      excess = sum(Excess, na.rm = TRUE)
    )

  # plot the selected data
  p <- ggplot(filtered) +
    geom_col(mapping = aes(x = State, y = excess, fill = State)) +
    coord_flip() +
    ggtitle("Excess Death by State in 2020") +
    xlab("States") +
    ylab("Number of Deaths")
  return(p)
}
