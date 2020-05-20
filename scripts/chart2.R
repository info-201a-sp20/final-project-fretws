# A file with a function that returns your second chart

# total excess deaths by state (in 2020)

plot_2 <- function(df) {
  df <- df %>%
    filter(Year == 2020, State != "United States", State != "District of Columbia")%>%
    group_by(State) %>%
    distinct(State, Total.Excess.in.2020) %>%
    summarise(
      excess = sum(Total.Excess.in.2020, na.rm = TRUE)
    )
  ggplot(data = df) +
    geom_col(mapping = aes(x = State, y = excess, fill = State)) +
    coord_flip() +
    ggtitle("Excess Death by State in 2020") +
    xlab("States") +
    ylab("Number of Deaths") +
    labs(legend = "Travel Catagory")
}