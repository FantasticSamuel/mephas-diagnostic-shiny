mod_ui_11 <- function(id) {
  ns <- NS(id)
  
  tagList(
    textInput(ns("data1_no"), "测试1未患病个体的结果:", value = "38,25,15,19,4"),
    textInput(ns("data1_yes"), "测试1患病个体的结果:", value = "1,2,3,14,42"),
    textInput(ns("data2_no"), "测试2未患病个体的结果:", value = "70,7,5,7,12"),
    textInput(ns("data2_yes"), "测试2患病个体的结果:", value = "8,2,2,2,48"),
    numericInput(ns("alpha"), "显著性水平 α:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    actionButton(ns("submit"), "提交"),
    hr(),
    
    verbatimTextOutput(ns("result"))
  )
}
