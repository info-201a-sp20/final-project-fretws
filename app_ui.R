#load shiny library
library("shiny")

source("intro_page.R")
source("summary_page.R")
source("page_two.R")
source("page_three.R")
source("page_four.R")
source("summary_page.R")

ui <- navbarPage(
  "App Title Goes Here",
  intro_page,
  summary_page,
  page_two,
  page_three,
  page_four,
  summary_page
)
