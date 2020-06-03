# load the sever and ui
source("app_ui.R")
source("app_server.R")

# load libraries
library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")
library("stringr")

shinyApp(ui = ui, server = server)

# For testing ui only
# shinyApp(ui = ui, server = function(input, output){})
