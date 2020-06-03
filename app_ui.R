#load shiny library
library("shiny")
library("dplyr")
library("stringr")

source("scripts/intro_page.R")
source("scripts/page_2.R")
source("scripts/page_3.R")
source("scripts/page_4.R")
source("scripts/summary_page.R")

# Control + Shift + C to uncomment
# ui <- navbarpage(
#   "app title goes here",
#   intro_page,
#   summary_page,
#   page_two,
#   page_three,
#   page_four,
#   summary_page
# )

ui <- navbarPage(
  title = strong("Final Deliverable"),
  intro_page,
  page_two,
  page_three,
  page_four,
  summary_page,
  inverse = T)

