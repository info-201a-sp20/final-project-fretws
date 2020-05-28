#load shiny library
library("shiny")

source("scripts/intro_page.R")
source("scripts/summary_page.R")
source("scripts/page_2.R")
source("scripts/page_3.R")
#source("scripts/page_4.R")
source("scripts/summary_table.R")

ui <- navbarPage(
  "App Title Goes Here",
  intro_page,
  summary_page,
  page_two,
  page_three,
  #page_four,
  summary_page
)
