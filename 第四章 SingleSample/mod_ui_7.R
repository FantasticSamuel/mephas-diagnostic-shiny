mod_ui_7 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        
        # 输入非疾病组和疾病组的测试结果
        textInput(ns("data0"), "未患病受试者的测试结果:", value = "38,25,15,19,4"),
        textInput(ns("data1"), "患病受试者的测试结果:", value = "1,2,3,14,42"),
        
        # 输入显著性水平和其他参数
        numericInput(ns("alpha"), "显著性水平:", 0.05),
        numericInput(ns("FPR"), "固定FPR值:", 0.1),
        numericInput(ns("e1"), "部分面积的下界FPR值:", 0.0),
        numericInput(ns("e2"), "部分面积的上界FPR值:", 0.2),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("ROC 曲线"),
        plotOutput(ns("roc_plot")),
        h4("分析结果"),
        verbatimTextOutput(ns("summary")),
        h4("阈值"),
        tableOutput(ns("thresholds")),
        h4("TPR 及其置信区间"),
        tableOutput(ns("tpr_ci")),
        h4("全面积与部分面积"),
        tableOutput(ns("areas")),
        h4("McClish 变换后的部分面积及其方差"),
        tableOutput(ns("transformed_area"))
      )
    )
  )
}
