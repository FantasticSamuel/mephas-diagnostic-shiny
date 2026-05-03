mod_ui_continuous_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("未配对连续数据 ROC Test"),
    
    # 输入未患病个体的测试1数据
    h5("未患病个体的测试1数据 (data1_no):"),
    textInput(ns("data1_no"), "输入数据:", value = "136,286,281,23,200,146,220,96,100"),
    
    # 输入未患病个体的测试2数据
    h5("未患病个体的测试2数据 (data2_no):"),
    textInput(ns("data2_no"), "输入数据:", value = "60,126,100,40,253,46,70,17,27"),
    
    # 输入患病个体的测试1数据
    h5("患病个体的测试1数据 (data1_yes):"),
    textInput(ns("data1_yes"), "输入数据:", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    
    # 输入患病个体的测试2数据
    h5("患病个体的测试2数据 (data2_yes):"),
    textInput(ns("data2_yes"), "输入数据:", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    
    # 输入显著性水平
    h5("显著性水平 (alpha):"),
    numericInput(ns("alpha"), "输入 alpha:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    # 提交按钮
    actionButton(ns("submit"), "提交"),
    
    # 显示结果
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("roctest_continuous_unpaired_result"))
    )
  )
}

mod_ui_ordinal_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("未配对有序数据 ROC Test"),
    h5("未患病个体的测试1数据 (data1_no):"),
    textInput(ns("data1_no"), "输入数据:", value = "38,25,15,19,4"),
    
    h5("未患病个体的测试2数据 (data2_no):"),
    textInput(ns("data2_no"), "输入数据:", value = "70,7,5,7,12"),
    
    h5("患病个体的测试1数据 (data1_yes):"),
    textInput(ns("data1_yes"), "输入数据:", value = "1,2,3,14,42"),
    
    h5("患病个体的测试2数据 (data2_yes):"),
    textInput(ns("data2_yes"), "输入数据:", value = "8,2,2,2,48"),
    
    h5("显著性水平 (alpha):"),
    numericInput(ns("alpha"), "输入 alpha:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    actionButton(ns("submit"), "提交"),
    
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("roctest_ordinal_unpaired_result"))
    )
  )
}
mod_ui_continuous_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("配对连续数据 ROC Test"),
    h5("未患病个体的测试1数据 (data1_no):"),
    textInput(ns("data1_no"), "输入数据:", value = "136,286,281,23,200,146,220,96,100"),
    
    h5("患病个体的测试1数据 (data1_yes):"),
    textInput(ns("data1_yes"), "输入数据:", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    
    h5("未患病个体的测试2数据 (data2_no):"),
    textInput(ns("data2_no"), "输入数据:", value = "60,126,100,40,253,46,70,17,27"),
    
    h5("患病个体的测试2数据 (data2_yes):"),
    textInput(ns("data2_yes"), "输入数据:", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    
    h5("显著性水平 (alpha):"),
    numericInput(ns("alpha"), "输入 alpha:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    actionButton(ns("submit"), "提交"),
    
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("roctest_continuous_paired_result"))
    )
  )
}
mod_ui_ordinal_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("配对有序数据 ROC Test"),
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
    
    h5("显著性水平 (alpha):"),
    numericInput(ns("alpha"), "输入 alpha:", value = 0.05, min = 0, max = 1, step = 0.01),
    
    actionButton(ns("submit"), "提交"),
    
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("roctest_ordinal_paired_result"))
    )
  )
}


