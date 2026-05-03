mod_ui_12 <- function(id) {
  ns <- NS(id)
  tagList(
    textInput(ns("data1_no"), "输入测试1未患病数据", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "输入测试1患病数据", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "输入测试2未患病数据", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "输入测试2患病数据", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    numericInput(ns("e1"), "输入部分区域的FPR下限", value = 0),
    numericInput(ns("e2"), "输入部分区域的FPR上限", value = 1),
    numericInput(ns("alpha"), "输入显著性水平", value = 0.05),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}
