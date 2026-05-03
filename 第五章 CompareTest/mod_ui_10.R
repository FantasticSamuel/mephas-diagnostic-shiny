mod_ui_10 <- function(id) {
  ns <- NS(id)
  tagList(
    hr(),
    
    # Zou_params_estimate 的输入
    h4("输入数据"),
    textInput(ns("data1_no"), "测试 1 中未患病个体的测试结果:", 
              value = "136,286,281,23,200,146,220,96,100"),
    textInput(ns("data1_yes"), "测试 1 中患病个体的测试结果:", 
              value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1360,543"),
    textInput(ns("data2_no"), "测试 2 中未患病个体的测试结果:", 
              value = "60,126,100,40,253,46,70,17,27"),
    textInput(ns("data2_yes"), "测试 2 中患病个体的测试结果:", 
              value = "323,671,350,156,1560,543,443,509,60,230,490,80,356,120,523,303,76,353,576"),
    numericInput(ns("alpha"), "显著性水平 (alpha):", value = 0.05, min = 0, max = 1),
    actionButton(ns("submit"), "提交"),
    
    hr(),
    
    # Zou_params_estimate 的输出
    h4("估计的参数和测试结果"),
    verbatimTextOutput(ns("zou_params_estimate_result")),
    verbatimTextOutput(ns("zou_area_result"))
  )
}