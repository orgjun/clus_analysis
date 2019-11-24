library(shiny)
if(!require("stringr")) install.packages("stringr")
library("stringr")
if(!require("Rtsne")) install.packages("Rtsne")
library("Rtsne")
if(!require("ggplot2")) install.packages("ggplot2")
library("ggplot2")
if(!require("factoextra")) install.packages("factoextra")
library("factoextra")
#if(!require("ggfortify")) install.packages("ggfortify")
#library(ggfortify)
if(!require("cluster")) install.packages("cluster")
library("cluster")


shinyUI(navbarPage(
    "Cluster analysis",

#panel 0 num
    tabPanel("numbers",
             titlePanel("聚类数分析"),
             source("0num_ui.R", local=TRUE,encoding = "utf-8")$value),
#panel 1 Kmeans
tabPanel("Kmeans",
         titlePanel("Kmeans聚类"),
         source("1Kmeans_ui.R", local=TRUE,encoding = "utf-8")$value),
#panel 2 Kmeans
tabPanel("Hierarchical Clustering",
         titlePanel("层次聚类"),
         source("2HC_ui.R", local=TRUE,encoding = "utf-8")$value)

  )

)

