mod_ui_2 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入")),
        p(tags$b("1. 估计的AUC (A)")),
        numericInput(ns("A"), "A:", value = 0.8),
        
        p(tags$b("2. 无疾病患者与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        p(tags$b("3. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("4. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("5. 置信区间的半宽度 (L)")),
        numericInput(ns("L"), "L:", value = 0.05),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("精准结果"),
        verbatimTextOutput(ns("output_normal")),
        h4("粗略估计结果"),
        verbatimTextOutput(ns("output_rough"))
      )
    )
  )
}
