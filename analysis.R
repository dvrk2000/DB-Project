library(dplyr)
library(tidyr)
# Get the states insrance coverage data frame
insurance_coverage_df <- read.csv("data/states_insurance_coverage.csv")

focus <- insurance_coverage_df %>%
  select(State, Uninsured.Rate..2010., Uninsured.Rate..2015., Uninsured.Rate.Change..2010.2015.,
         Health.Insurance.Coverage.Change..2010.2015., Employer.Health.Insurance.Coverage..2015., Average.Monthly.Tax.Credit..2016.)
