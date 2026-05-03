# Continuous Unpaired Sensitivity Test
mod_ui_5_continuous_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("连续数据和非配对设计的敏感性比较"),
    textInput(ns("data1_no"), "未患病个体的测试1结果 (data1_no):", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data2_no"), "未患病个体的测试2结果 (data2_no):", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data1_yes"), "患病个体的测试1结果 (data1_yes):", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_yes"), "患病个体的测试2结果 (data2_yes):", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    numericInput(ns("e"), "假阳性率 (FPR):", value = 0.1, min = 0, max = 1),
    actionButton(ns("submit"), "运行"),
    verbatimTextOutput(ns("result"))
  )
}

# Continuous Paired Sensitivity Test
mod_ui_5_continuous_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("连续数据和配对设计的敏感性比较"),
    textInput(ns("data1_no"), "未患病个体的测试1结果 (data1_no):", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data2_no"), "未患病个体的测试2结果 (data2_no):", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data1_yes"), "患病个体的测试1结果 (data1_yes):", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_yes"), "患病个体的测试2结果 (data2_yes):", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    numericInput(ns("e"), "假阳性率 (FPR):", value = 0.1, min = 0, max = 1),
    actionButton(ns("submit"), "运行"),
    verbatimTextOutput(ns("result"))
  )
}

# Ordinal Unpaired Sensitivity Test
mod_ui_5_ordinal_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据和非配对设计的敏感性比较"),
    textInput(ns("data1_no"), "未患病个体的测试1结果 (data1_no):", value = "38,25,15,19,4"),
    textInput(ns("data2_no"), "未患病个体的测试2结果 (data2_no):", value = "70,7,5,7,12"),
    textInput(ns("data1_yes"), "患病个体的测试1结果 (data1_yes):", value = "1,2,3,14,42"),
    textInput(ns("data2_yes"), "患病个体的测试2结果 (data2_yes):", value = "8,2,2,2,48"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    numericInput(ns("e"), "假阳性率 (FPR):", value = 0.1, min = 0, max = 1),
    actionButton(ns("submit"), "运行"),
    verbatimTextOutput(ns("result"))
  )
}

# Ordinal Paired Sensitivity Test
mod_ui_5_ordinal_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据和配对设计的敏感性比较"),
    textInput(ns("data0_row1"), "未患病个体的数据矩阵 (data0) 行 1:", value = "36,20,8,6,0"),
    textInput(ns("data0_row2"), "行 2:", value = "0,3,3,1,0"),
    textInput(ns("data0_row3"), "行 3:", value = "0,1,0,4,0"),
    textInput(ns("data0_row4"), "行 4:", value = "0,0,2,3,2"),
    textInput(ns("data0_row5"), "行 5:", value = "2,1,2,5,2"),
    textInput(ns("data1_row1"), "患病个体的数据矩阵 (data1) 行 1:", value = "1,2,2,2,1"),
    textInput(ns("data1_row2"), "行 2:", value = "0,0,0,0,2"),
    textInput(ns("data1_row3"), "行 3:", value = "0,0,0,2,0"),
    textInput(ns("data1_row4"), "行 4:", value = "0,0,0,2,0"),
    textInput(ns("data1_row5"), "行 5:", value = "0,0,1,8,39"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    numericInput(ns("e"), "假阳性率 (FPR):", value = 0.1, min = 0, max = 1),
    actionButton(ns("submit"), "运行"),
    verbatimTextOutput(ns("result"))
  )
}
