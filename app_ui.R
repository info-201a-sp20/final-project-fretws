# load shiny library
library("shiny")
library("dplyr")
library("stringr")

source("scripts/intro_page.R")
source("scripts/page_2.R")
source("scripts/page_3.R")
source("scripts/page_4.R")
source("scripts/summary_page.R")

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
    title = h1("Final Deliverable"),
    intro_page,
    page_two,
    page_three,
    page_four,
    summary_page,
    inverse = T
  )
)
