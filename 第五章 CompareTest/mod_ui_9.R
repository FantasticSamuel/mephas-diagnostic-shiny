mod_ui_9_ordinal_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据 - 非配对设计: 使用Logit Transformation比较面积和部分面积"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1, step = 0.01),
    numericInput(ns("e1"), "FPR下限 (e1):", value = 0),
    numericInput(ns("e2"), "FPR上限 (e2):", value = 0.2),
    h5("未患病个体 - 测试 1 数据:"),
    textInput(ns("data1_no"), "数据:", value = "38,25,15,19,4"),
    h5("患病个体 - 测试 1 数据:"),
    textInput(ns("data1_yes"), "数据:", value = "1,2,3,14,42"),
    h5("未患病个体 - 测试 2 数据:"),
    textInput(ns("data2_no"), "数据:", value = "70,7,5,7,12"),
    h5("患病个体 - 测试 2 数据:"),
    textInput(ns("data2_yes"), "数据:", value = "8,2,2,2,48"),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}

mod_ui_9_ordinal_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h4("有序数据 - 配对设计: 使用Logit Transformation比较面积和部分面积"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1, step = 0.01),
    numericInput(ns("e1"), "FPR下限 (e1):", value = 0),
    numericInput(ns("e2"), "FPR上限 (e2):", value = 0.2),
    h5("未患病个体 - 测试结果矩阵 (data0):"),
    textInput(ns("data0_row1"), "行 1:", value = "36,20,8,6,0"),
    textInput(ns("data0_row2"), "行 2:", value = "0,3,3,1,0"),
    textInput(ns("data0_row3"), "行 3:", value = "0,1,0,4,0"),
    textInput(ns("data0_row4"), "行 4:", value = "0,0,2,3,2"),
    textInput(ns("data0_row5"), "行 5:", value = "2,1,2,5,2"),
    h5("患病个体 - 测试结果矩阵 (data1):"),
    textInput(ns("data1_row1"), "行 1:", value = "1,2,2,2,1"),
    textInput(ns("data1_row2"), "行 2:", value = "0,0,0,0,2"),
    textInput(ns("data1_row3"), "行 3:", value = "0,0,0,2,0"),
    textInput(ns("data1_row4"), "行 4:", value = "0,0,0,2,0"),
    textInput(ns("data1_row5"), "行 5:", value = "0,0,1,8,39"),
    actionButton(ns("run"), "运行分析"),
    verbatimTextOutput(ns("result"))
  )
}