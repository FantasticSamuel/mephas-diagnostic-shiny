mod_ui_13 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        numericInput(ns("K"), "诊断结果分级数 (K):", value = 5, min = 1),
        numericInput(ns("I"), "类别数 (I):", value = 2, min = 1),
        actionButton(ns("generate"), "生成输入框"),
        uiOutput(ns("matrix_inputs1")),
        uiOutput(ns("matrix_inputs2")),
        numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05),
        actionButton(ns("submit"), "计算")
      ),
      mainPanel(
        verbatimTextOutput(ns("result_output"))
      )
    )
  )
}
