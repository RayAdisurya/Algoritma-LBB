library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(plotly)
library(readr)

vids <- read.csv("youtubetrends.csv")
vids$channel_title <- as.factor(vids$channel_title)
vids$category_id <- as.factor(vids$category_id)
vids$timetotrend <-  as.factor(vids$timetotrend)

theme_tabs <- theme(
  axis.title.x = element_blank(),
  axis.title.y = element_blank(),
  plot.title = element_text(hjust = 0.5),
  legend.position = "none")
