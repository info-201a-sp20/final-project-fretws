#load shiny library
library("shiny")

source("intro_page")
source("summary_page")
source("page_two")
source("page_three")
source("page_four")
source("summary_page")

ui <- navbarPage(
  "App Title Goes Here",
  intro_page,
  summary_page,
  page_two,
  page_three,
  page_four,
  summary_page
)
