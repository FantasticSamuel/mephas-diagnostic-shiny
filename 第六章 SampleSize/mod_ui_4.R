mod_ui_4 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入")),
        p(tags$b("1. 假设的二正态分布参数 (a0)")),
        numericInput(ns("a0"), "a0:", value = 0.5),
        
        p(tags$b("2. 假设的二正态分布参数 (b0)")),
        numericInput(ns("b0"), "b0:", value = 0.5),
        
        p(tags$b("3. 固定假阳性率 (FPR) (e)")),
        numericInput(ns("e"), "e:", value = 0.05),
        
        p(tags$b("4. 灵敏度的置信区间半宽度 (L)")),
        numericInput(ns("L"), "L:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
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
