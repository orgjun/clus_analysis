sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV file",
             helpText("help text"),
             fileInput('NUM_file','Upload your CSV file here',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             checkboxInput("NUM_scale", "Scale", FALSE),
             numericInput('NUM_K_Max', 'the max clusting number', 8, 2, 20,1),
             uiOutput('clu_v_NUM_out'),

#			 selectInput("dist_method","hist method",c("euclidean", "maximum", "manhattan", "canberra", "binary","minkowski"),selected ="euclidean"),
#			 selectInput("hclust_method","hclust method",c("complete","ward.D", "ward.D2", "single", "average", "mcquitty", "median","centroid"),selected ="complete"),

             actionButton("NUM_clear","clear")
                       
      )
    )),
  mainPanel(
    h4('Plot:'),
    plotOutput('plot_NUM'),
#    uiOutput('condi_plot'),
#    uiOutput('test'),
    h4('Input Confirm:'),
    dataTableOutput('NUM_table'),
    h4('Results:'),
    verbatimTextOutput("NUM_results"),
    h4('Download:'),
    downloadButton('NUM_download', 'Download')
  )
)

