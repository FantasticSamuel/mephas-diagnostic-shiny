mod_ui_6 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        
        # 用户输入一个两行矩阵
        fluidRow(
          column(12, 
                 textInput(ns("row1"), "患病受试者的测试结果:", value = "1,2,3,14,42")
          )
        ),
        fluidRow(
          column(12, 
                 textInput(ns("row2"), "未患病受试者的测试结果:", value = "38,25,15,19,4")
          )
        ),
        
        numericInput(ns("alpha"), "显著性水平:", 0.05),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("ROC 曲线"),
        plotOutput(ns("roc_plot")),
        h4("结果"),
        verbatimTextOutput(ns("auc")),
        h4("AUC 的方差"),
        tableOutput(ns("auc_variance")),
        h4("AUC 的置信区间"),
        tableOutput(ns("auc_ci"))
      )
    )
  )
}
