mod_ui_8 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        
        # 输入非疾病组和疾病组的测试结果
        textInput(ns("data0"), "未患病受试者的测试结果:", value = "38,25,15,19,4"),
        textInput(ns("data1"), "患病受试者的测试结果:", value = "1,2,3,14,42"),
        
        # 输入FPR范围和显著性水平
        numericInput(ns("e1"), "部分面积的下界FPR值:", 0.0),
        numericInput(ns("e2"), "部分面积的上界FPR值:", 0.2),
        numericInput(ns("alpha"), "显著性水平:", 0.05),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("分析结果"),
        verbatimTextOutput(ns("summary")),
        h4("全面积的置信区间"),
        tableOutput(ns("ci_full")),
        h4("部分面积的置信区间"),
        tableOutput(ns("ci_partial"))
      )
    )
  )
}

