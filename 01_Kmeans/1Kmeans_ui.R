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
             checkboxInput("KM_scale", "标准化 (X)", FALSE),
             numericInput('KM_clusternumber', '聚类数', 1, 2, 10,1),
             uiOutput('clu_vari_out'),
             conditionalPanel(condition="input.clu_vari.length > 2",
                              selectInput(#这里要继续加
                                "to2dimension", "是否可视化",
                                c("不生成图片"="no_pic",
                                  "取前两维向量"="two",
                                  "PCA降维"="pca",
                                  "T-SNE降维"="tsne"))),
#             uiOutput('plot_x'),
#             uiOutput('plot_y'),

             actionButton("KM_clear","clear")
                       
      )
    )),
  mainPanel(
#    h4('Plot:'),
#    plotOutput('plot1'),
    uiOutput('condi_plot'),
    uiOutput('test'),
    h4('Input Confirm:'),
    dataTableOutput('KM_table'),
    h4('Results:'),
    verbatimTextOutput("KM_results"),
    h4('Download:'),
    downloadButton('KM_download', 'Download')
  )
)

