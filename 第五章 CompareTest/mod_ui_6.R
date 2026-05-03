mod_ui_6_continuous_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    textInput(ns("data1_no"), "Test 1 未患病个体的结果:", "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "Test 1 患病个体的结果:", "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "Test 2 未患病个体的结果:", "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "Test 2 患病个体的结果:", "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    actionButton(ns("analyze"), "分析"),
    verbatimTextOutput(ns("result"))
  )
}
mod_ui_6_continuous_paired <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    textInput(ns("data1_no"), "Test 1 未患病个体的结果:", "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "Test 1 患病个体的结果:", "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "Test 2 未患病个体的结果:", "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "Test 2 患病个体的结果:", "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    actionButton(ns("analyze"), "分析"),
    verbatimTextOutput(ns("result"))
  )
}
mod_ui_6_ordinal_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    textInput(ns("data1_no"), "Test 1 未患病个体的结果:", "38,25,15,19,4"),
    textInput(ns("data1_yes"), "Test 1 患病个体的结果:", "1,2,3,14,42"),
    textInput(ns("data2_no"), "Test 2 未患病个体的结果:", "70,7,5,7,12"),
    textInput(ns("data2_yes"), "Test 2 患病个体的结果:", "8,2,2,2,48"),
    actionButton(ns("analyze"), "分析"),
    verbatimTextOutput(ns("result"))
  )
}
mod_ui_6_ordinal_paired <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    h5("未患病个体的数据矩阵 (data0):"),
    textInput(ns("data0_row1"), "行 1:", value = "36,20,8,6,0"),
    textInput(ns("data0_row2"), "行 2:", value = "0,3,3,1,0"),
    textInput(ns("data0_row3"), "行 3:", value = "0,1,0,4,0"),
    textInput(ns("data0_row4"), "行 4:", value = "0,0,2,3,2"),
    textInput(ns("data0_row5"), "行 5:", value = "2,1,2,5,2"),
    h5("患病个体的数据矩阵 (data1):"),
    textInput(ns("data1_row1"), "行 1:", value = "1,2,2,2,1"),
    textInput(ns("data1_row2"), "行 2:", value = "0,0,0,0,2"),
    textInput(ns("data1_row3"), "行 3:", value = "0,0,0,2,0"),
    textInput(ns("data1_row4"), "行 4:", value = "0,0,0,2,0"),
    textInput(ns("data1_row5"), "行 5:", value = "0,0,1,8,39"),
    actionButton(ns("analyze"), "分析"),
    verbatimTextOutput(ns("result"))
  )
}
