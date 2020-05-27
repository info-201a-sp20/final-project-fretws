#define variable for sidebar panel for fourth page
fourth_sidebar_content <- sidebarPanel(
   checkboxInput(
      "barcheck",
      label = "Select State",
      vvalue = list()
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
      fourth_main_content)
)