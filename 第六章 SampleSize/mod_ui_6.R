mod_ui_6 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 敏感性比较")),
        p(tags$b("1. 检验1在备择假设下的灵敏度 (Se1)")),
        numericInput(ns("Se1"), "Se1:", value = 0.8),
        
        p(tags$b("2. 检验2在备择假设下的灵敏度 (Se2)")),
        numericInput(ns("Se2"), "Se2:", value = 0.7),
        
        p(tags$b("3. P(T1=1|T2=1)")),
        numericInput(ns("p1"), "p:", value = 0.9),
        
        p(tags$b("4. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("5. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("6. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R1"), "R:", value = 1),
        
        h4(tags$b("参数输入 - 特异性比较")),
        p(tags$b("1. 检验1在备择假设下的特异性 (Sp1)")),
        numericInput(ns("Sp1"), "Sp1:", value = 0.8),
        
        p(tags$b("2. 检验2在备择假设下的特异性 (Sp2)")),
        numericInput(ns("Sp2"), "Sp2:", value = 0.7),
        
        p(tags$b("3. P(T1=0|T2=0)")),
        numericInput(ns("p2"), "p:", value = 0.9),
        
        p(tags$b("4. 显著性水平 (alpha)")),
        numericInput(ns("alpha_sp"), "alpha:", value = 0.05),
        
        p(tags$b("5. 第二类错误率 (beta)")),
        numericInput(ns("beta_sp"), "beta:", value = 0.2),
        
        p(tags$b("6. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R2"), "R:", value = 1),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 敏感性比较"),
        verbatimTextOutput(ns("output_sensitivity_one_sided")),
        verbatimTextOutput(ns("output_sensitivity_two_sided")),
        
        h4("结果 - 特异性比较"),
        verbatimTextOutput(ns("output_specificity_one_sided")),
        verbatimTextOutput(ns("output_specificity_two_sided"))
      )
    )
  )
}
