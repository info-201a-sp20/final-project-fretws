# Final Project
Use this `REAMDE.md` file to describe your final project (as detailed on Canvas).

## Domain of Interest:

During the strange and uncertain times we are currently living in, our group thought it fitting to use data related to the COVID-19 outbreak and try to understand how it has impacted (directly or indirectly) people around the world. Due to the stay-at-home orders issued around the world, many people find themselves at home for much longer than usual. We are collecting data on **Energy Usage**, **Mobility Trends**, and **Death Rates**. We will unpack these data sets to analyze both the environmental impact that COVID-19 (and the following human behavior) had, and the excess deaths beyond those attributed to COVID-19. By studying these data sets, we hope to learn more about how the COVID-19 outbreak has impacted the world beyond just how many are sick or dead because of the virus.

### Related Projects

  - [Cuebiq's COVID-19 Mobility Insights](https://help.cuebiq.com/hc/en-us/articles/360041285051-Reading-Cuebiq-s-COVID-19-Mobility-Insights#h_4e44ff71-27e9-4b83-977e-d18911b21817)
provides graphics depicting an analysis of shelter in place. Counties are ranked by stay home percentage and illustrated by color.

  - [COVID-19 Community Mobility Reports](https://www.google.com/covid19/mobility/) provides insight on how closly the stay-at-home orders around the world are being followed. The report charts movement over time by location across different catagories like retial, recreation, or groceries and pharmacies.
- []()

### Questions About This Domain
- 
- How does the dip in gas prices compare to previous dips in gas prices? Specifically, does the drop in demand fully account for the drop in price, or does there seem to be a more complex reason for the prices to drop as much as they have?
- Is there a correlation between how well people are sticking to the stay at home order and how many deaths are occurring in their area?

## Data Sets:

### Energy and Fuel Trends
- Today in Energy Data:
    - [Today in Energy data](https://www.eia.gov/petroleum/gasdiesel/) was collected based on national and worldwide energy/fuel pricing and consumption. These numbers are updated on a regular basis, approximately once a week, to understand the effects of issues such as COVID 19 on energy trends.
    - 1554 rows
    - 28 columns
    - This data is helpful in comprehending the effect of COVID 19 on current energy trends compared to historical ups and downs of fuel pricing.

### Mobility Trends
- Apple mobility data:
    - The data was released by Apple after removing identifying user information. The data was generated through geolocation tracking from use of Apple hardware and software.
    - 1158 rows
    - 112 columns
    - This is useful in analysing the movements of the population in necessary versus unnecessary travel.

### Death Rates by State
<<<<<<< HEAD
From [the CDC's dataset library](https://data.cdc.gov/NCHS/Excess-Deaths-Associated-with-COVID-19/xkkf-xrst)
This csv contains the number of deaths reported to the National Center for
Health Statistics each week from Jan 7, 2017 to Apr. 25, 2020. Each of these
weeks is split into rows for each of the 50 states, the District of Columbia,
the United States as a whole, and New York City. For each location in this
dataset, death counts are sums of the death counts from the counties that make
up that location.

#### Rows
Each of these week-location pairs are further split along two
more dimensions: whether or not the death counts include COVID-19 related
deaths, and whether or not the predictions for expected death counts for that
week-location are weighted.
The weighting process is used to get more accurate demographic information on
those burdened by COVID-19 mortality. In rows that are weighted, the death
counts from the counties that make up that row's geographic location have been
weighted by the percentage of COVID-19 related deaths that occurred in that
county. So, if 75% of COVID-19 related deaths from Alabama occurred in one
county, then the death counts from that county are weighted by 75%. This
process allows for more accurate reporting of how much different demographic
groups are burdened by COVID-19 mortality.
With respect to these four dimensions (week, location, whether to include
COVID-19 deaths, and weighted or unweighted) there are 36464 death counts that
make up the rows of this dataset.

#### Columns
There is a total of 12 columns. Aside from the columns already described (week,
location, death count, including COVID-19 deaths, and weighted or not) there
are columns named 'Threshold', 'Exceeds Threshold', 'Excess', 'Year', 'Total
Excess in 2020', 'Percent Excess', and 'Suppress'.

##### Threshold
The upper bound on the range of expected values for a location's
death count according to data from previous years. If you know statistical
terminology, a more precise description of this threshold is 'the upper bound
of the 95% Confidence Interval' for the location's death count in that week of
the year.

##### Exceeds Threshold
Represents whether the observed death count exceeded the threshold.

##### Excess
By how much the threshold was exceeded in absolute count

##### Percent Excess
The excess deaths as a percentage of the threshold. These percentages are in
decimal form, i.e. 1% is represented as 0.01 in this column.

<<<<<<< HEAD

=======
##### Total Excess in 2020
The sum of the excess deaths from the first week of 2020 to the given row's
week of the year. Theese values are copied to the corresponding weeks of the
other years included in this dataset, i.e. the value of 'Total Excess in 2020'
in week 5 of 2020 is copied to week 5 of 2017, 2018, and 2019.
>>>>>>> e70b1d2f848ffcf4d5ba0bf14a95c88b211ef893
=======
- Death counts from Jan, 2017 to Apr. 2020:
    - From [the CDC's dataset library](https://data.cdc.gov/NCHS/Excess-Deaths-Associated-with-COVID-19/xkkf-xrst), collected as reports from U.S. counties to the National Center for Health Statistics. It is important to note that these reports can be expected to come in one to two weeks after the deaths that they are reporting.
    - 36464 rows
    - 12 columns
    - We can use this to assess mortality rates due to the coronavirus and compare overall death rates now against death rates in years we did not have active quarantine procedures.
>>>>>>> 4f3691d316797b1f241ffa18b35d1b06ddcbebca
