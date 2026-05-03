# 模块化的 UI 部分
mod_ui_1 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("第1步  准备数据")),
        p(tags$b("1. 命名数据（必填）")),
        tags$textarea(id = ns("cn"), rows = 1, "Matrix"),
        
        p(tags$b("2. 输入2x2矩阵数据")),
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
        verbatimTextOutput(ns("sensitivity")),
        verbatimTextOutput(ns("specificity")),
        verbatimTextOutput(ns("se_variance")),
        verbatimTextOutput(ns("sp_variance")),
        tableOutput(ns("intervals"))
      )
    )
  )
}
