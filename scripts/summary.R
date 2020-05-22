# A file with a function that calculates summary information
# to be included in your report

#load library to pass lint check
library("dplyr")

summary_info <- function(df, col_name1, col_name2) {
  column_name_1 <- df %>% pull(col_name1)
  column_name_2 <- df %>% pull(col_name2)
  return(list(number_rows <- nrow(df),
               number_cols <- ncol(df),
               column_names <- colnames(df),
               avg_mobility_essential <- mean(column_name_1, na.rm = TRUE),
               avg_mobility_nonessential <- mean(column_name_2, na.rm = TRUE)))
}