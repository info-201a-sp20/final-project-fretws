### Death Rates by State
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

##### Total Excess in 2020
The sum of the excess deaths from the first week of 2020 to the given row's
week of the year. Theese values are copied to the corresponding weeks of the
other years included in this dataset, i.e. the value of 'Total Excess in 2020'
in week 5 of 2020 is copied to week 5 of 2017, 2018, and 2019.




This data was discovered in a report analyzing the [decrease of petroleum/fuel](https://www.eia.gov/todayinenergy/detail.php?id=43455) consumption and pricing due to COVID-19. The full raw data set originates from [Today in Energy](https://www.eia.gov/petroleum/gasdiesel/). The source, today in energy, specifically looks at trends associated with energy news that is updated on a regular basis to remain relevant and accurate. Specifically providing information on the increase and decrease of fuel pricing in relation to worldwide consumption for analysis. The source is composed of 28 columns describing weekly cost per gallon by region for the regular all formulations retail pricing, and 1554 rows that consist of dates from 1994 to 2020 to express the pricing changes from the past to recent effects.