intro_page <- tabPanel(
  # I hope you don't mind Mariah, but I made some changes to the UI and this
  # file that I think make the app look a lot nicer.
  # I also think that this page would look really nice with an outline on the
  # left (like google docs, if you've seen the document outlines they do).
  # Just a thought; do whatever you want with it.
  title = h1("Covid Trends"),

  h2("The Effects of Mobility during the Covid Pandemic"),

  img("",
    src = "https://dkr0pu7ej5xex.cloudfront.net/wp-content/
    uploads/2020/04/03164956/Google-Map-Digital-Magazine-scaled.jpg",
    height = "50%", width = "50%", align = "right"
  ),

  p(
    "Covid 19 has changed life as we know it. In order to better
    understand the effectiveness of these changes, we evaluated the
    data released by",
    tags$a(href = "https://www.google.com/covid19/mobility/", "Google"), "to track user mobility trends. The release of geolocation
      data of this kind is a first and we were interested in the impact
      of public access would change societal behavior. This is why we
      chose to include in our analysis the time frame for the mobility trends,
      to glean a better understanding of the effects of this data being
      public knowledge. These insights combined with the information from the
      State death rates reveal the importance of individual habits on
      the greater good. The access to this type of information
      implies the future changes to our society."
  )
)
