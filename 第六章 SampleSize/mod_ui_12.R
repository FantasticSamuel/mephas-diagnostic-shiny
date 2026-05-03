mod_ui_12 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 确定合适的临界值的样本量")),
        
        p(tags$b("1. 最小特异性 (SP)")),
        numericInput(ns("SP"), "SP:", value = 0.9),
        
        p(tags$b("2. 临界值的猜测敏感性 (SE_con)")),
        numericInput(ns("SE_con"), "SE_con:", value = 0.85),
        
        p(tags$b("3. 最小灵敏度 (SE_min)")),
        numericInput(ns("SE_min"), "SE_min:", value = 0.7),
        
        p(tags$b("4. 二正态参数 b")),
        numericInput(ns("b"), "b:", value = 0.5),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率(beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 确定合适的临界值的样本量"),
        verbatimTextOutput(ns("output_sample_size"))
      )
    )
  )
}
