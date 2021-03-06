#file data input
HC_X<-reactive({
  
  inFile<-input$HC_file
  
  if (is.null(inFile)){#file or data
    datatb<-iris[1:30,1:4]
  }else{
    datatb <- read.csv(
      inFile$datapath,
      header = T)
  }

  return(datatb)
})



#ui select variables (cluster)
output$clu_v_HC_out = renderUI({
  selectInput( ##type(list) length
    'clu_vari_HC',
    h5('参与聚类的特征'),
    selected = c(names(HC_X())),
    choices = c(names(HC_X())),
    multiple = TRUE
  )
})




#new Database
new_HC_X<-function(){
  new_inFile<-HC_X()
  if(input$HC_scale){
    new_inFile<-data.frame(scale(new_inFile))}
  if(is.null(input$clu_vari_HC)){
    return(new_inFile)
  }else{
    return(new_inFile[input$clu_vari_HC])
  }
}

#plot bool用于判断是否显示图片窗格
# plot_bool<-reactive({
  # if(length(input$clu_vari_HC)<2 || is.null(input$clu_vari_HC)){return(0)}
  # else if(length(input$clu_vari_HC)==2){return(1)}
  # else{
    # if(input$to2dimension == 'no_pic'){return(0)}
    # else if(input$to2dimension == 'two'){return(1)}
    # else if(input$to2dimension == 'pca'){return(2)}
    # else if(input$to2dimension == 'tsne'){return(3)}
    # else{print("wrong in plot bool")}
    
  # }
# })


#ui select variables (plot)
# output$condi_plot = renderUI({
  # conditionalPanel(condition= plot_bool(),  #  "input.clu_vari_HC.length == 2",#
                   # h4('PLOT:'),
                   # plotOutput('KM_plot')
  # )
# })



#cluster function
HC_clusters<-reactive({
  clusters <- hclust(dist(new_HC_X(),method=input$dist_method),method=input$hclust_method)
  return(clusters)
})
HC_cuttree<-reactive({
  fenlei<-cutree(HC_clusters(),input$HC_clusternumber)
  return(fenlei)
})

HC_clusters_result <- reactive({
  li<-c(HC_clusters(),list("clusting vector"=HC_cuttree()))
  sink("result.txt")
  print(li)
  sink()
  return(li)
#  return(clusters)
})

#建立降维后的数据集 isolate避免一上传数据就运行


#生成图片plot 疑问点：是否应该加入条件判断 
output$plot_HC<-renderPlot({
  fviz_dend(HC_clusters(), k = input$HC_clusternumber, 
#          cex = 0.5, 
#          k_colors = c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
#            "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"),
#          color_labels_by_k = TRUE, 
          rect = TRUE          
)
})

#output datatable
output$HC_table <- renderDataTable({new_HC_X()}, options = list(pageLength = 5))#

#output result
output$HC_results<-renderPrint({
  if (is.data.frame(new_HC_X()))
  {tryCatch({HC_clusters_result()},
            error = function(e){HTML("Error in your data!")})}
  else{return("No outputs!")}#或可改成无实验组X
  
})

#下载文件
output$HC_download <- downloadHandler(
  filename = function() { 
    'result.txt' 
  },
  content = function(file) {
    file.copy("result.txt", file)
  }
)

observeEvent(input$HC_clear,{session$reload()})