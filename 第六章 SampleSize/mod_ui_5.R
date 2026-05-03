mod_ui_5 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入")),
        p(tags$b("1. 二正态分布参数 (a)")),
        numericInput(ns("a"), "a:", value = 0.5),
        
        p(tags$b("2. 二正态分布参数 (b)")),
        numericInput(ns("b"), "b:", value = 0.5),
        
        p(tags$b("3. 部分面积的下限 (e1)")),
        numericInput(ns("e1"), "e1:", value = 0.2),
        
        p(tags$b("4. 部分面积的上限 (e2)")),
        numericInput(ns("e2"), "e2:", value = 0.8),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 置信区间的半宽度 (L)")),
        numericInput(ns("L"), "L:", value = 0.05),
        
        p(tags$b("8. 无疾病与有疾病患者的比率 (R)")),
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
