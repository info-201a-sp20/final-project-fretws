#define variable for sidebar panel for fourth page
fourth_sidebar_content_one <- sidebarPanel(
   checkboxInput(
      "barcheck",
      label = "Select State",
      value = list()
   )
)
fourth_sidebar_content_two <- sidebarPanel(
   dateRangeInput(

   )
)
#define variable for main panel for fourth page
fourth_main_content <- mainPanel(
   plotlyOutput("bar")
)

#define a variable for a panel to hold the content for the fourth page
fourth_panel <- tabPanel(
   "bar",
   titlePanel("State Effectiveness"),
   sidebarLayout(
      fourth_sidebar_content,
      fourth_sidebar_content_two,
      fourth_main_content)
)

build_bar <- function(data, bar_var){

}