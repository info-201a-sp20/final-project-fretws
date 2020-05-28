#load shiny library
library("shiny")

ui <- navbarPage(
  "App Title Goes Here",
  intro_page,
  summary_page,
  page_two,
  page_three,
  page_four,
  summary_page
)
