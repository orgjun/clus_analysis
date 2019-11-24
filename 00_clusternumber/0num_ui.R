sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV文件",
             helpText("文件输入的帮助文本"),
             fileInput('NUM_file','CSVファイルを指定してください',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             checkboxInput("NUM_scale", "标准化 (X)", FALSE),
             numericInput('NUM_K_Max', '最大聚类数', 8, 2, 20,1),
             uiOutput('clu_v_NUM_out'),#选择参与聚类的数据

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

