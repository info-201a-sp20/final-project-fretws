# define variable for sidebar panel for second page
side_bar <- sidebarPanel(
   # widgets

)

#define variable for main panel for second page
main_panel = mainPanel(
   # plot(s)

)

#define variable to maneuver content for second page
page_two <- tabPanel(
   title = "Question",
   sidebarLayout(
      sidebarPanel = side_bar,
      mainPanel = main_panel
   )
)