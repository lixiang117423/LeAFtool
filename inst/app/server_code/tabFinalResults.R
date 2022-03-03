# 输出结果
output$finalxlsx = renderDataTable(df_final_results(),
                                   options = list(pageLength = 10))

df_final_results = eventReactive(input$submit_final,{
  if (input$submit_final > 0) {
    df = data.table::fread(
      input$uploadfilwithpixel$datapath,
      header = TRUE,
      stringsAsFactors = TRUE,
      encoding = "UTF-8"
    ) %>% 
      dplyr::mutate(
        leaf.surface = (1/leaf.surface)*(input$inputDPI/2.54),
        lesion.surface = (1/lesion.surface)*(input$inputDPI/2.54),
        lesion.per.cm2 = (lesion.nb/leaf.surface)*(input$inputDPI/2.54)
      )
  }
  df
})