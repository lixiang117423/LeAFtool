tabItem(
  tabName = "tabUpload",
  fluidRow(
    box(
      title = "Input Your Name and Upload Your File😎",
      status = "success",
      solidHeader = TRUE,
      collapsible = TRUE,
      width = 12,
      
      # input name
      column(
        width = 3,
        offset = 0.5,
        h3("Input Your Name"),
        align = "center",
        br(),
        textInput(
          inputId = "username",
          label = "",
          width = "200px"
        )
      ),
      
      # upload data
      column(
        width = 3,
        offset = 1,
        h3("Upload Your Data"),
        align = "center",
        br(),
        fileInput(
          inputId = "uploadfile",
          label = "",
          accept = ".zip",
          buttonLabel = "View...",
          width = "200px"
        )
      ),
      
      # submit
      column(
        width = 3,
        offset = 1,
        h3("Submit"),
        align = "center",
        br(),
        br(),
        actionButton(
          inputId = "submituser",
          label = "",
          width = "200px",
          icon = icon("arrow-up")
        )
      )
    ),
    
    br(),
    br(),
    
    # 输入dpi并下载数据
    box(
      title = "Input Images’ dpi and Download Your Results🚀",
      status = "success",
      solidHeader = TRUE,
      collapsible = TRUE,
      width = 12,

      # image dpi
      column(
        width = 2,
        offset = 0.4,
        h3("Input dpi of Images"),
        align = "center",
        br(),
        numericInput(
          inputId = "imagedpi",
          label = "",
          value = 600,
          step = 1,
          width = "200px"
        )
      ),
      
      # submit dpi
      column(
        width = 2,
        offset = 1,
        h3("Submit"),
        align = "center",
        br(),
        br(),
        actionButton(
          inputId = "submitdpi",
          label = "",
          width = "200px",
          icon = icon("arrow-up")
        )
      ),
      
      # download data as excel
      column(
        width = 3,
        offset = 1,
        h3("Download Your Results (Excel)"),
        align = "center",
        br(),
        br(),
        downloadButton(
          outputId = "downloadresults",
          width = "400px"
        )
      ),
      # download data all
      column(
        width = 2,
        offset = 1,
        h3("Download Your Results (All)"),
        align = "center",
        br(),
        br(),
        downloadButton(
          outputId = "downloadresultsall",
          width = "400px"
        )
      )
    )
  )
)