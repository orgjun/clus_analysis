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
if(!require("umap")) install.packages("umap")
library("umap")

if (!requireNamespace("shiny", quietly = TRUE)) {install.packages("shiny")}; require("shiny",quietly = TRUE)
if (!requireNamespace("mephas.tools",quietly = TRUE)) {remotes::install_github("mephas/mephas.tools", upgrade="never")}; require("mephas.tools",quietly = TRUE)




shinyUI(
  tagList(
  
  includeCSS("../www/style.css"),
  stylink(),
  tabOF(),
  
  navbarPage(
    theme = shinythemes::shinytheme("cerulean"),
    #title = a("Cluster analysis", href = "https://alain003.phs.osaka-u.ac.jp/mephas/", style = "color:white;"),
    
    title ="Cluster analysis",
    collapsible = TRUE,
    #id="navbar",
    position="fixed-top",
    
    
#panel 0 num
    tabPanel("the optimal value of K ",
             titlePanel("the Optimal Number of Clusters"),
             
             conditionalPanel(
               condition = "input.explain_on_off",
             HTML(
               "    
<p>You can calculate the number of clusters to create by using this application.</p>

<h4><b> 1. What you can do on this page  </b></h4>
<ul>
<li> To determine the best 'k' for k-means clustering algorithm by the gap statistic
</ul>

<h4><b> 2. About your data </b></h4>

<ul>
<li>Your data should be numeric vectors.
<li>The values in the first row of your data should be feature names. Each row is a sample to be clustered.
</ul> 

<i><h4>Case Example</h4>
We selected the first four columns of the iris data as an example of cluster analysis.
</h4></i>
<h4> Please follow the <b>Steps</b>, and <b>Outputs</b> will give real-time analytical results.</h4>
    

    "
             )
             ),
             
             hr(),
             
             source("0num_ui.R", local=TRUE,encoding = "utf-8")$value),
#panel 1 Kmeans
tabPanel("Kmeans Clustering",
         titlePanel("Kmeans"),
         conditionalPanel(
           condition = "input.explain_on_off",
         HTML(
           "    
<p>You can  partition your data into k classes with k-means clustering.</p>

<h4><b> 1. What you can do on this page  </b></h4>
<ul>
<li> To partition your data into k classes with k-means clustering and visualize the results
</ul>

<h4><b> 2. About your data </b></h4>

<ul>
<li>Your data should be numeric vectors.
<li>The values in the first row of your data should be feature names. Each row is a sample to be clustered.
<li>If the optimal number of clusters is not clear, we recommend that you may first use [the optimal value of K] or[Hierarchical Clustering]to determine the best value of k.
</ul> 

<i><h4>Case Example</h4>
We selected the first four columns of the iris data as an example of cluster analysis.
</h4></i>
<h4> Please follow the <b>Steps</b>, and <b>Outputs</b> will give real-time analytical results.</h4>
    

    "
         )
         ),
         
         hr(),
         
         source("1Kmeans_ui.R", local=TRUE,encoding = "utf-8")$value),

#panel 2 Kmeans
tabPanel("Hierarchical Clustering",
         titlePanel("Hierarchical Clustering"),
         conditionalPanel(
           condition = "input.explain_on_off",
         HTML(
           "    
<p>You can partition your data with hierarchical clustering.</p>

<h4><b> 1. What you can do on this page  </b></h4>
<ul>
<li> To partition your data with hierarchical clustering and visualize the results
</ul>

<h4><b> 2. About your data </b></h4>

<ul>
<li>Your data should be numeric vectors.
<li>The values in the first row of your data should be feature names. Each row is a sample to be clustered.
<li>Please do not exceed 100 samples
</ul> 

<i><h4>Case Example</h4>
We selected the first four columns of the iris data as an example of cluster analysis.
</h4></i>
<h4> Please follow the <b>Steps</b>, and <b>Outputs</b> will give real-time analytical results.</h4>
    

    "
         )
           ),
         
         hr(),
         
         source("2HC_ui.R", local=TRUE,encoding = "utf-8")$value)

  ),

tabstop(),
tablink()
#navbarMenu("",icon=icon("link"))

))



