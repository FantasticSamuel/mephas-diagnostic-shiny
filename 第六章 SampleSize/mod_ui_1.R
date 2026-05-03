mod_ui_1 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入")),
        p(tags$b("1. 测试的假设灵敏度 (Se)")),
        numericInput(ns("Se"), "Se:", value = 0.9),
        
        p(tags$b("2. 测试的假设特异度 (Sp)")),
        numericInput(ns("Sp"), "Sp:", value = 0.9),
        
        p(tags$b("3. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("4. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("5. 置信区间的半宽度 (L)")),
        numericInput(ns("L"), "L:", value = 0.05),
        
        p(tags$b("6. 群体中疾病的患病率 (p)")),
        numericInput(ns("p"), "p:", value = 0.1),
        
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
