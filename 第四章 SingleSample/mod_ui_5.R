mod_ui_5 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        
        # 单个2x2矩阵的输入
        fluidRow(
          column(6, numericInput(ns("val1"), "TP:", value = 22)),
          column(6, numericInput(ns("val2"), "FN:", value = 3))
        ),
        fluidRow(
          column(6, numericInput(ns("val3"), "FP:", value = 2)),
          column(6, numericInput(ns("val4"), "TN:", value = 3))
        ),
        
        numericInput(ns("alpha"), "显著性水平:", 0.05),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果"),
        verbatimTextOutput(ns("odds_ratio")),
        h4("优势比的置信区间"),
        tableOutput(ns("odds_ratio_intervals"))
      )
    )
  )
}
