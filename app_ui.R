#load shiny library
library("shiny")

source("intro_page.R")
source("summary_page.R")
source("page_2.R")
source("page_3.R")
source("page_4.R")
source("summary_table.R")

ui <- navbarPage(
  "App Title Goes Here",
  intro_page,
  summary_page,
  page_two,
  page_three,
  page_four,
  summary_table
)
