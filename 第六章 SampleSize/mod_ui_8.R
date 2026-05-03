mod_ui_8 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 二正态假设下的ROC曲线下面积比较")),
        p(tags$b("1. 检验1在零假设下的二正态参数a (a1_null)")),
        numericInput(ns("a1_null"), "a1_null:", value = 0.5),
        
        p(tags$b("2. 检验2在零假设下的二正态参数a (a2_null)")),
        numericInput(ns("a2_null"), "a2_null:", value = 0.5),
        
        p(tags$b("3. 检验1在备择假设下的二正态参数a (a1_alter)")),
        numericInput(ns("a1_alter"), "a1_alter:", value = 0.7),
        
        p(tags$b("4. 检验2在备择假设下的二正态参数a (a2_alter)")),
        numericInput(ns("a2_alter"), "a2_alter:", value = 0.6),
        
        p(tags$b("5. 患者的条件相关性 (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.5),
        
        p(tags$b("6. 非患者的条件相关性 (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.5),
        
        p(tags$b("7. 显著性水平 (alpha)")),
        numericInput(ns("alpha_binormal"), "alpha:", value = 0.05),
        
        p(tags$b("8. 第二类错误率 (beta)")),
        numericInput(ns("beta_binormal"), "beta:", value = 0.2),
        
        p(tags$b("9. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R_binormal"), "R:", value = 1),
        
        h4(tags$b("参数输入 - 任意分布下的ROC曲线下面积比较")),
        p(tags$b("10. 检验在零假设下的AUC (theta)")),
        numericInput(ns("theta"), "theta:", value = 0.7),
        
        p(tags$b("11. 检验1在备择假设下的AUC (theta1)")),
        numericInput(ns("theta1"), "theta1:", value = 0.8),
        
        p(tags$b("12. 检验2在备择假设下的AUC (theta2)")),
        numericInput(ns("theta2"), "theta2:", value = 0.75),
        
        p(tags$b("13. 配对设计下的相关性 (r)")),
        numericInput(ns("r_any"), "r:", value = 0.5),
        
        p(tags$b("14. 显著性水平 (alpha)")),
        numericInput(ns("alpha_any"), "alpha:", value = 0.05),
        
        p(tags$b("15. 第二类错误率 (beta)")),
        numericInput(ns("beta_any"), "beta:", value = 0.2),
        
        p(tags$b("16. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R_any"), "R:", value = 1),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 二正态假设下的ROC曲线下面积比较"),
        verbatimTextOutput(ns("output_binormal_one_sided")),
        verbatimTextOutput(ns("output_binormal_two_sided")),
        
        h4("结果 - 任意分布下的ROC曲线下面积比较"),
        verbatimTextOutput(ns("output_any_one_sided")),
        verbatimTextOutput(ns("output_any_two_sided"))
      )
    )
  )
}
