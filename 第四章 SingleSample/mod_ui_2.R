
# 模块化的 UI 部分
mod_ui_2 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
  sidebarLayout(
    sidebarPanel(
      h4(tags$b("输入数据")),
      p("输入2x2矩阵数据："),
      fluidRow(
        column(6, numericInput(ns("val1"), "TP:", value = 56)),
        column(6, numericInput(ns("val2"), "FN:", value = 6))
      ),
      fluidRow(
        column(6, numericInput(ns("val3"), "FP:", value = 23)),
        column(6, numericInput(ns("val4"), "TN:", value = 78))
      ),
      numericInput(ns("alpha"), "显著性水平:", 0.05),
      numericInput(ns("x"), "患病人数 (x):", 124),
      numericInput(ns("n"), "总人数 (n):", 632),
      
      actionButton(ns("submit"), "计算")
    ),
    
    mainPanel(
      h4("结果"),
      verbatimTextOutput(ns("estimate")),
      h4("PPV 置信区间"),
      tableOutput(ns("ppv_intervals")),
      h4("NPV 置信区间"),
      tableOutput(ns("npv_intervals"))
    )
  )
)
}

