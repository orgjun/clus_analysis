library(shiny)
if(!require("stringr")) install.packages("stringr")
library("stringr")
if(!require("Rtsne")) install.packages("Rtsne")
library("Rtsne")
if(!require("ggplot2")) install.packages("ggplot2")
library("ggplot2")
if(!require("umap")) install.packages("umap")
library("umap")
#if(!require("factoextra")) install.packages("factoextra")
#library("factoextra")
#if(!require("ggfortify")) install.packages("ggfortify")
#library(ggfortify)

shinyUI(navbarPage(
    "Cluster analysis",

#panel 1 K-means
    tabPanel("K-means",
             titlePanel("K-means"),
             source("1Kmeans_ui.R", local=TRUE,encoding = "utf-8")$value) 
  )

)

