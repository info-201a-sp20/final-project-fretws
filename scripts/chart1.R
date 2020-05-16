# A file with a function that returns your first chart

plot_1 <- function(df) {
   diamonds_sample <- sample_n(diamonds, 1000)

   ggplot(diamonds_sample) +
      geom_point(mapping = aes(x = carat, y = price))
}