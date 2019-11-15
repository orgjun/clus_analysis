pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris)),
    selectInput('ycol', 'Y Variable', names(iris),
                selected=names(iris)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9),
    conditionalPanel(condition="input.clusters == 2",
                     selectInput(
                       "breaks", "Breaks",
                       c("Sturges",
                         "Scott",
                         "Freedman-Diaconis",
                         "[Custom]" = "custom"))
                     )
  ),
  mainPanel(
    plotOutput('plot1'),
    uiOutput('plot')
    )
  
)


#  mainPanel(
#plotOutput('plot1'),
#conditionalPanel(condition="input.clusters == 4",
#                 plotOutput('plot2')
#)
#)
#)
