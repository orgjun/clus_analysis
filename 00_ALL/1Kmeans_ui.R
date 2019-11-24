sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV file",
             helpText("help text"),
             fileInput('KM_file','Upload your CSV file here',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             checkboxInput("KM_scale", "Scale", FALSE),
             numericInput('KM_clusternumber', 'clusting number', 1, 2, 10,1),
             uiOutput('clu_vari_out'),
             conditionalPanel(condition="input.clu_vari.length > 2",
                              selectInput(#
                                "to2dimension", "Data Visualization",
                                c("no pictures"="no_pic",
                                  "the first two dimensions"="two",
                                  "PCA"="pca",
                                  "T-SNE"="tsne"))),

             actionButton("KM_clear","clear")
                       
      )
    )),
  mainPanel(

    uiOutput('condi_plot'),
    h4('Input Confirm:'),
    dataTableOutput('KM_table'),
    h4('Results:'),
    verbatimTextOutput("KM_results"),
    h4('Download:'),
    downloadButton('KM_download', 'Download')
  )
)

