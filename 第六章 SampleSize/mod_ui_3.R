mod_ui_3 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入")),
        p(tags$b("1. 零假设下的ROC曲线下面积 (null)")),
        numericInput(ns("null"), "null:", value = 0.5),
        
        p(tags$b("2. 备择假设下的ROC曲线下面积 (alter)")),
        numericInput(ns("alter"), "alter:", value = 0.6),
        
        p(tags$b("3. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("4. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("5. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果"),
        verbatimTextOutput(ns("output_one_sided")),
        verbatimTextOutput(ns("output_two_sided"))
      )
    )
  )
}
