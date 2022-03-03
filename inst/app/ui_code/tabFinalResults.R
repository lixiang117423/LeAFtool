#####################################################################################################
#
# Copyright 2019 CIRAD-INRA
# Xiang LI add this function.
#####################################################################################################

tabItem(
  # Tab for Training input/output
  tabName = "tabFinalResults",

  # BOX input
  fluidRow(
    box(
      title = "Get Final Table and Statistical Figure Input",
      status = "success", solidHeader = TRUE, collapsible = TRUE, width = 12,
      column(
        5,
        withTags(
          div(
            class = "TrainingTXT",
            p("Just select a folder of results and input the DPI of image(s), you can get the user-friendly results."),
            p("The final results include:"),
            ul(
              li("Table with .xlsx format."),
              li("Some statistical figures (Later).")
            )
          )
        )
      ),
      column(
        3,
        fluidRow(
          class = "spaceRow",
          fileInput(
            inputId = "uploadfilwithpixel",
            label = "Upload the file merge_ResumeCount.csv in the results folder",
            accept = NULL,
            buttonLabel = "View..."
          ) %>%
            helper(
              icon = "question",
              type = "markdown",
              content = "dirFinalResults"
            )
        ),
        fluidRow(
          numericInput(
            inputId = "inputDPI",
            label = "DPI of Image(s)",
            value = 600,
            step = 1
          ) %>%
            helper(
              icon = "question",
              type = "markdown",
              content = "inputMethod"
            )
        )
      ),
      column(
        offset = 1,
        2,
        br(),
        br(),
        fluidRow(
          class = "spaceRow",
          actionButton(
            "submit_final",
            label = "Submit",
            width = "150px",
            icon = icon("arrow-up")
          )
        ),
        br(),
        br(),
        fluidRow(
          downloadButton(
            "download_excel",
            label = "Download",
            width = "150px"
          )
        )
      )
    )
  ),
  # BOX RESULT
  fluidRow(
    box(
      column(
        width = 12,
        dataTableOutput(
          outputId = "finalxlsx",
          width = "100%",
          height = "auto"
        )
      )
    )
  )
)
