sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV文件",
             helpText("文件输入的帮助文本"),
             fileInput('KM_file','CSVファイルを指定してください',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             numericInput('KM_clusternumber', '聚类数', 1, 2, 10,1),
             uiOutput('clu_vari'),
             conditionalPanel(condition="input.clu_vari.length > 2",
                              selectInput(#这里要继续加
                                "breaks", "是否可视化",
                                c("不生成图片",
                                  "取前两维向量",
                                  "PCA降维",
                                  "T-SNE降维"))),
#             uiOutput('plot_x'),
#             uiOutput('plot_y'),

             actionButton("KM_clear","clear")
                       
      )
    )),
  mainPanel(
#    h4('Plot:'),
#    plotOutput('plot1'),
    uiOutput('condi_plot'),
    h4('Input Confirm:'),
    dataTableOutput('KM_table'),
    h4('Results:'),
    verbatimTextOutput("KM_results"),
    h4('Download:'),
    downloadButton('KM_download', 'Download')
  )
)

