mod_ui_18 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        textInput(ns("data0"), "输入非患病组数据 (以逗号分隔):", "136,286,281,23,200,146,220,96,100,60,17,27,126,100,253,70,40,6,46"),
        textInput(ns("data1"), "输入患病组数据 (以逗号分隔):", "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1370,543,913,230,463,60,509,576,671,80,490,156,356,350,323,1560,120,216,443,523,76,303,353,206"),
        numericInput(ns("m_value"), "输入m值 (R*(1-p)/p，ROC曲线的斜率):", value = 1, min = 0, step = 0.1),
        selectInput(ns("method"), "选择计算方法:",
                    choices = list("高斯核方法" = "gaussian", 
                                   "双正态假设" = "binormality", 
                                   "双权重核方法" = "biweight")),
        actionButton(ns("submit"), "计算最佳决策点")
      ),
      mainPanel(
        verbatimTextOutput(ns("optimal_point"))
      )
    )
  )
}
