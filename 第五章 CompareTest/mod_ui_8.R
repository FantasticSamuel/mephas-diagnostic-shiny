mod_ui_8_ordinal_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据 - 非配对设计: 比较面积和部分面积"),
    textInput(ns("data1_no"), "测试 1 中未患病个体的测试结果（逗号分隔）:", value = "38,25,15,19,4"),
    textInput(ns("data2_no"), "测试 2 中未患病个体的测试结果（逗号分隔）:", value = "70,7,5,7,12"),
    textInput(ns("data1_yes"), "测试 1 中患病个体的测试结果（逗号分隔）:", value = "1,2,3,14,42"),
    textInput(ns("data2_yes"), "测试 2 中患病个体的测试结果（逗号分隔）:", value = "8,2,2,2,48"),
    numericInput(ns("e1"), "FPR下限:", value = 0),
    numericInput(ns("e2"), "FPR上限:", value = 0.2),
    numericInput(ns("alpha"), "显著性水平:", value = 0.05),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}

mod_ui_8_continuous_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("连续数据 - 非配对设计: 比较面积和部分面积"),
    textInput(ns("data1_no"), "测试 1 中未患病个体的测试结果（逗号分隔）:", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data2_no"), "测试 2 中未患病个体的测试结果（逗号分隔）:", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data1_yes"), "测试 1 中患病个体的测试结果（逗号分隔）:", value = "140,1087,230,183,1256,700,16,800,253,740"),
    textInput(ns("data2_yes"), "测试 2 中患病个体的测试结果（逗号分隔）:", value = "323,671,350,156,1560,543,443,509,60,230"),
    numericInput(ns("e1"), "FPR下限:", value = 0),
    numericInput(ns("e2"), "FPR上限:", value = 0.2),
    numericInput(ns("alpha"), "显著性水平:", value = 0.05),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}

mod_ui_8_ordinal_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据 - 配对设计: 比较面积和部分面积"),
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
    
    h4("显著性水平"),
    numericInput(ns("alpha"), "Alpha 值:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    h4("部分面积下限与上限"),
    numericInput(ns("e1"), "部分面积的FPR下限:", value = 0),
    numericInput(ns("e2"), "部分面积的FPR上限:", value = 0.2),
    actionButton(ns("run"), "运行分析"),
    h4("结果"),
    verbatimTextOutput(ns("result"))
  )
}

mod_ui_8_continuous_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("连续数据 - 配对设计: 比较面积和部分面积"),
    textInput(ns("data1_no"), "测试 1 中未患病个体的测试结果（逗号分隔）:", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data2_no"), "测试 2 中未患病个体的测试结果（逗号分隔）:", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data1_yes"), "测试 1 中患病个体的测试结果（逗号分隔）:", value = "140,1087,230,183,1256,700,16,800,253,740"),
    textInput(ns("data2_yes"), "测试 2 中患病个体的测试结果（逗号分隔）:", value = "323,671,350,156,1560,543,443,509,60,230"),
    numericInput(ns("e1"), "FPR下限:", value = 0),
    numericInput(ns("e2"), "FPR上限:", value = 0.2),
    numericInput(ns("alpha"), "显著性水平:", value = 0.05),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}