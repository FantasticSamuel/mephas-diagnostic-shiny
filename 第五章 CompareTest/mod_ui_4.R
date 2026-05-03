mod_ui_4_boxcox <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Box-Cox 转换"),
    textInput(ns("data0"), "未患病个体的测试结果:", value = "136,286,281,23,200,146,220,96,100,60,17,27,126,100,253,70,40,6,46"),
    textInput(ns("data1"), "患病个体的测试结果:", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1370,543,913,230,463,60,509,576,671,80,490,156,356,350,323,1560,120,216,443,523,76,303,353,206"),
    actionButton(ns("submit"), "提交"),
    hr(),
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("boxcox_result"))
    )
  )
}
mod_ui_4_compare_unpaired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("未配对敏感度比较"),
    textInput(ns("data1_no"), "测试 1 未患病个体的测试结果:", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "测试 1 患病个体的测试结果:", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "测试 2 未患病个体的测试结果:", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "测试 2 患病个体的测试结果:", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    textInput(ns("SP"), "特异性 (SP):", value = "0.9"),
    textInput(ns("alpha"), "显著性水平 (α):", value = "0.05"),
    actionButton(ns("submit"), "提交"),
    hr(),
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("compare_unpaired_result"))
    )
  )
}
mod_ui_4_compare_paired <- function(id) {
  ns <- NS(id)
  tagList(
    h3("配对敏感度比较"),
    textInput(ns("data1_no"), "测试 1 未患病个体的测试结果:", value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "测试 1 患病个体的测试结果:", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "测试 2 未患病个体的测试结果:", value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "测试 2 患病个体的测试结果:", value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    textInput(ns("SP"), "特异性 (SP):", value = "0.9"),
    textInput(ns("alpha"), "显著性水平 (α):", value = "0.05"),
    actionButton(ns("submit"), "提交"),
    hr(),
    mainPanel(
      h4("分析结果"),
      verbatimTextOutput(ns("compare_paired_result"))
    )
  )
}

