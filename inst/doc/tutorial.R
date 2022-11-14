## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_salesforce_data.RData")

## ----setup--------------------------------------------------------------------
library(fetchSalesforceR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_salesforce_data <-
#    fetch_salesforce(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_salesforce_data)

## -----------------------------------------------------------------------------
ggplot(my_salesforce_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_salesforce_data, family = "poisson")
summary(lmod)

