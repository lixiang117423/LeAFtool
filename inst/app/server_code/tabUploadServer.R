# 先创建用户目录
observeEvent(input$submituser, {
  if (input$submituser > 0) {
    # 创建目录
    path_file = paste0("/home/shiny/", input$username, "-",Sys.Date())
    dir.create(path = path_file)
    
    # 上传数据
    file.copy(from = input$uploadfile$datapath,
              to = path_file)
    
    # 解压文件
    paste0("unzip ",path_file,"/0.zip -d ",path_file,"/") %>% 
      as.data.frame() %>% 
      data.table::fwrite(file = paste0(path_file,"/run.sh"),
                         col.names = FALSE, row.names = FALSE)
    
    system2(command = "sh", args = paste0(" ",path_file,"/run.sh"))
    system2(command = "rm", args = paste0(" ",path_file,"/run.sh"))
    system2(command = "rm", args = paste0(" ",path_file,"/0.zip"))
  }
})

# 下载结果
observeEvent(input$submitdpi, {
  if (input$submitdpi > 0) {
    path_file2 = paste0("/home/shiny/", input$username, "-",Sys.Date(),"/results/merge_ResumeCount.csv")
    data.table::fread(
      path_file2,
      header = TRUE,
      stringsAsFactors = TRUE,
      encoding = "UTF-8"
    ) %>% 
      dplyr::mutate(
        leaf.surface = leaf.surface/((input$imagedpi/2.54)^2),
        lesion.surface = lesion.surface/((input$imagedpi/2.54)^2),
        lesion.per.cm2 = (lesion.nb/leaf.surface)
      ) %>% 
      dplyr::select(image,
                    leaf.number,leaf.surface,
                    lesion.nb,lesion.surface,
                    pourcent.lesions,
                    lesion.per.cm2) %>% 
      as.data.frame() %>% 
      xlsx::write.xlsx(file = paste0("/home/shiny/", input$username, "-",Sys.Date(),"/results/merge_ResumeCount.xlsx"),
                       row.names = FALSE)
    
    # 压缩结果
    outputpath = paste0(" /home/shiny/", input$username, "-",Sys.Date(),"/all.results.zip")
    zippath = paste0(" /home/shiny/", input$username, "-",Sys.Date(),"/*")
    
    system2(command = "zip", args = paste0(" -r",outputpath, zippath))
  }
})

output$downloadresults <- downloadHandler(
  filename <- function(){
    paste0(input$username, "-",Sys.Date(),"-results.xlsx")
  },
  content <- function(file){
    file.copy(paste0("/home/shiny/", input$username, "-",Sys.Date(),"/results/merge_ResumeCount.xlsx"),file)
  }
)

output$downloadresultsall <- downloadHandler(
  filename <- function(){
    paste0(input$username, "-",Sys.Date(),"-results.zip")
  },
  content <- function(file){
    file.copy(paste0("/home/shiny/", input$username, "-",Sys.Date(),"/all.results.zip"),file)
  }
)














