# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(arrow)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)
library(fresh)

# READ IN DATA ----
lake_data <- read_parquet("data/lake_data_processed.parquet")
