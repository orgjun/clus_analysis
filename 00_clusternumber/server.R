library(shiny)
library(multcomp)

shinyServer(
  
  function(input, output,session) {
    
#panel 1 Kmeans
    source("0num_server.R", local=TRUE,encoding = "utf-8")$value
    
    ##########----------##########----------##########
    
#    observe({
#      if (input$close > 0) stopApp()                             # stop shiny
#    })
    
  }
)
