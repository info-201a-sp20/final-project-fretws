#load shiny library
library("shiny")

<<<<<<< HEAD
#source scripts for pages

ui <- navbarPage(

=======
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
>>>>>>> 899ffe9cc7ad486b13762375182492a641f7b0d5
)
