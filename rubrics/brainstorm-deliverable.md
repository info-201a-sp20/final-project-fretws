# Brainstorm Rubric

This rubric is intended to help guide expectations and increase transparency. However, it is not necessarily fully exhaustive. Make sure to read the detailed explanation on [Canvas](https://canvas.uw.edu/courses/1373081/assignments/5314195).

## Project set up (2 points)
- Successfully creates repository and adds all group members to the repo. (**1 point**)
- Uses well formatted markdown throughout this document (headers for each section, lists where appropriate, hyperlinked words, etc.) (**1 point**)

## Domain of Interest (13 points)
- Why are you interested in this field/domain? Describes in at least 2 - 3 sentences why the group is interested in this area. May be personal, or related to pertinence of the domain. (**1 point**)

During the strange and uncertain times we are currently living in, our group thought it fitting to use data related to the COVID-19 outbreak and try to understand how it has impacted (directly or indirectly) people around the world. Due to the stay-at-home orders issued around the world, many people find themselves at home for much longer than usual. We are collecting data on **Energy Usage**, **Mobility Trends**, and **Death Rates**. We will unpack these data sets to analyze both the environmental impact that COVID-19 (and the following human behavior) had, and the excess deaths beyond those attributed to COVID-19. By studying these data sets, we hope to learn more about how the COVID-19 outbreak has impacted the world beyond just how many are sick or dead because of the virus.

- Examples of other data driven projects related to this domain (**6 points**, 2 points each)?
    - Provides link to a data driven projects (**1 point**)
    - Briefly describes the project in 1 - 2 sentences (**1 points**)

- Examples of other projects:
  - [Cuebiq's COVID-19 Mobility Insights](https://help.cuebiq.com/hc/en-us/articles/360041285051-Reading-Cuebiq-s-COVID-19-Mobility-Insights#h_4e44ff71-27e9-4b83-977e-d18911b21817)
provides graphics depicting an analysis of shelter in place. Counties are ranked by stay home percentage and illustrated by color.

  - [COVID-19 Community Mobility Reports](https://www.google.com/covid19/mobility/) provides insight on how closly the stay-at-home orders around the world are being followed. The report charts movement over time by location across different catagories like retial, recreation, or groceries and pharmacies.

- What data-driven questions do you hope to answer about this domain (**6 points**, 2 points each)
    - Question is related to the field (**1 point**)
    - Describes how the question can be answered using data (e.g., a specific comparison within or analysis of the data that answers the question) (**1 point**)
- How the tracking data effect the compliance with the stay home order? Does the release of the data increase the effectiveness of the order?

We hope to analyze the effects of the change in mobility due to the Covid 19 quarantine. We would like to look at the effects on transportation from the stay home order. We may due this by looking at data from oil consumption and prices. Geolocation data from cell phone usage can provide an idea of the effectiveness of the stay home order. This can be compared to normal transportation trends and difference in the change in automotive fatalities.

## Finding Data (**15 points**, 5 points each)
For each identified data source,
- Link to URL where data is from, and download the data into the project repo in a `data/` folder (**1 point**)?
- Description of how was the data collected or generated (**1 point**)?
- How many observations (rows) and features (columns) are in your data(**1 point**)?
- What questions (from above) can be answered using the data in this dataset(**1 point**)?

- Apple mobility data: 
    - ![_Kaggle Apple Trends_)(https://www.kaggle.com/yushg123/covid-19-mobility-trends-apple-maps) The data was released by Apple after removing identifying user information. The data was generated through geolocation tracking from use of Apple hardware and software.
    - 1158 rows
    - 112 columns
    - This is useful in analysing the movements of the population in necessary versus unnecessary travel.

- Death counts from Jan, 2017 to Apr. 2020:
    - From [the CDC's dataset library](https://data.cdc.gov/NCHS/Excess-Deaths-Associated-with-COVID-19/xkkf-xrst), collected as reports from U.S. counties to the National Center for Health Statistics. It is important to note that these reports can be expected to come in one to two weeks after the deaths that they are reporting.
    - 36464 rows
    - 12 columns
    - We can use this to assess mortality rates due to the coronavirus and compare overall death rates now against death rates in years we did not have active quarantine procedures.

- Today in Energy Data:
    - [Today in Energy data](https://www.eia.gov/petroleum/gasdiesel/) was collected based on national and worldwide energy/fuel pricing and consumption. These numbers are updated on a regular basis, approximately once a week, to understand the effects of issues such as COVID 19 on energy trends.
    - 1554 rows
    - 28 columns
    - This data is helpful in comprehending the effect of COVID 19 on current energy trends compared to historical ups and downs of fuel pricing.
