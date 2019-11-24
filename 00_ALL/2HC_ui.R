sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV file",
             helpText("help text"),
             fileInput('HC_file','Upload your CSV file here',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             checkboxInput("HC_scale", "Scale", FALSE),
             numericInput('HC_clusternumber', 'clusting number', 2, 2, 10,1),
             uiOutput('clu_v_HC_out'),

			 selectInput("dist_method","hist method",c("euclidean", "maximum", "manhattan", "canberra", "binary","minkowski"),selected ="euclidean"),
			 selectInput("hclust_method","hclust method",c("complete","ward.D", "ward.D2", "single", "average", "mcquitty", "median","centroid"),selected ="complete"),

             actionButton("HC_clear","clear")
                       
      )
    )),
  mainPanel(
    h4('Plot:'),
    plotOutput('plot_HC'),
#    uiOutput('condi_plot'),
#    uiOutput('test'),
    h4('Input Confirm:'),
    dataTableOutput('HC_table'),
    h4('Results:'),
    verbatimTextOutput("HC_results"),
    h4('Download:'),
    downloadButton('HC_download', 'Download')
  )
)

