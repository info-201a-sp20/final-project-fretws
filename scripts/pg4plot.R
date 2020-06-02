
library(dplyr)
library(lubridate)
library(ggplot2)
#create data frame with regions for states
us_regions <- as.data.frame(list(state.name, state.region)) %>%
  rename(State = c..Alabama....Alaska....Arizona....Arkansas....California....Colorado...) %>%
  rename(region = structure.c.2L..4L..4L..2L..4L..4L..1L..2L..2L..2L..4L..4L..3L..)

#load deaths dataset
deaths <- read.csv("data/Excess_Deaths_Associated_with_COVID-19.csv", stringsAsFactors = FALSE)

# combine add regions to deaths dataset and filter unneeded columns
deaths <- deaths %>%
  left_join(us_regions) %>%
  select(Week.Ending.Date, State, region, Excess) %>%
   mutate(Saturday = mdy(Week.Ending.Date))

# function that outputs a bar graph for each state for the selected region
# depicting the number of deaths for the week selected
build_bar <- function(data, region_input, day) {
   #date <- mdy(day)
   #dates <- seq.Date(as.Date("2020-01-01"), as.Date("2020-05-31"), by = 1), seq(date, date + 6, by='day')
   #week_end_date <- floor_date(date, unit = "week", week_start = 6)

   date <- as.Date(parse_date_time(day, "ymd"))
   next.days <- seq.Date(as.Date("2020-01-01"), as.Date("2020-05-31"), by = 1)
   week_end_date = next.days[weekdays(next.days)=='Saturday']

  data <- data %>%
     # filter to only display states in the selected region
     filter(region == region_input) %>%
     dplyr::filter(Saturday == week_end_date) %>%
     group_by(State) %>%
     distinct(State, Excess) %>%
     summarise(
        excess = sum(Excess, na.rm = TRUE)
     )

  #plot the selected data
  p <- ggplot(data) +
    geom_col(mapping = aes(x = State, y = excess, fill = State)) +
    coord_flip()+
    ggtitle("Excess Death by State in 2020") +
    xlab("States") +
    ylab("Number of Deaths")
  return(p)
}
build_bar(deaths, "South", "2020-01-04")
