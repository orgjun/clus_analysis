sidebarLayout(
  sidebarPanel(
    tabsetPanel(     
    tabPanel("CSV文件",
             helpText("文件输入的帮助文本"),
             fileInput('HC_file','CSVファイルを指定してください',
                       accept=c(
                         'text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
             checkboxInput("HC_scale", "标准化 (X)", FALSE),
             numericInput('HC_clusternumber', '聚类数', 2, 2, 10,1),
             uiOutput('clu_v_HC_out'),#选择参与聚类的数据
             # conditionalPanel(condition="input.clu_vari.length > 2",
                              # selectInput(#这里要继续加
                                # "to2dimension", "是否可视化",
                                # c("不生成图片"="no_pic",
                                  # "取前两维向量"="two",
                                  # "PCA降维"="pca",
                                  # "T-SNE降维"="tsne"))),
#             uiOutput('plot_x'),
#             uiOutput('plot_y'),
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

