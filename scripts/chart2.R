# A file with a function that returns your second chart

# total excess deaths by state (in 2020)

library("dplyr")
library("ggplot2")

plot_1 <- function(df) {
  df <- df %>%
    filter(Year == 2020, State != "United States",
           State != "District of Columbia") %>%
    group_by(State) %>%
    distinct(State, Total.Excess.in.2020) %>%
    summarise(
      excess = sum(Total.Excess.in.2020, na.rm = TRUE)
    )
  ggplot(data = df) +
    geom_col(mapping = aes(x = State, y = excess, fill = State)) +
    coord_flip()
}
