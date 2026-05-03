mod_ui_17 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        textInput(ns("data0"), "输入非患病组的测试结果（用逗号分隔）", value = "136,286,281,23,200,146,220,96,100,60,17,27,126,100,253,70,40,6,46"),
        textInput(ns("data1"), "输入患病组的测试结果（用逗号分隔）", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1370,543,913,230,463,60,509,576,671,80,490,156,356,350,323,1560,120,216,443,523,76,303,353,206"),
        numericInput(ns("SP"), "固定特异度 (SP)", value = 0.9, min = 0.01, max = 0.99),
        numericInput(ns("alpha"), "显著性水平 (α)", value = 0.05, min = 0.001, max = 0.1),
        actionButton(ns("submit"), "计算")
      ),
      mainPanel(
        h4("估计结果"),
        verbatimTextOutput(ns("estimate"))
      )
    )
  )
}
