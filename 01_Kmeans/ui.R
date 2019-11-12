library(shiny)
if(!require("stringr")) install.packages("stringr")
library("stringr")

shinyUI(navbarPage(
    "Cluster analysis",

#panel 1 K-means
    tabPanel("K-means",
             titlePanel("K-means"),
             source("1Kmeans_ui.R", local=TRUE,encoding = "utf-8")$value) 
  )

)

