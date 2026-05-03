mod_ui_19 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        numericInput(ns("A0"), "输入零假设下的面积或部分面积 (A0):", value = 0.5, min = 0, max = 1, step = 0.01),
        numericInput(ns("A"), "输入估计的面积或部分面积 (A):", value = 0.9297, min = 0, max = 1, step = 0.01),
        numericInput(ns("variance"), "输入面积或部分面积的估计方差:", value = 0.00045369, min = 0, step = 0.0000001),
        numericInput(ns("alpha"), "输入显著性水平 (alpha):", value = 0.05, min = 0, max = 1, step = 0.01),
        actionButton(ns("submit"), "检验假设")
      ),
      mainPanel(
        verbatimTextOutput(ns("test_result"))
      )
    )
  )
}
