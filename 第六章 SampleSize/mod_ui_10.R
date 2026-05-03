mod_ui_10 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - ROC曲线部分面积比较")),
        p(tags$b("1. 检验1在零假设下的二正态参数a (a1_null)")),
        numericInput(ns("a1_null"), "a1_null:", value = 1.19),
        
        p(tags$b("2. 检验1在零假设下的二正态参数b (b1_null)")),
        numericInput(ns("b1_null"), "b1_null:", value = 1.0),
        
        p(tags$b("3. 检验2在零假设下的二正态参数a (a2_null)")),
        numericInput(ns("a2_null"), "a2_null:", value = 1.19),
        
        p(tags$b("4. 检验2在零假设下的二正态参数b (b2_null)")),
        numericInput(ns("b2_null"), "b2_null:", value = 1.0),
        
        p(tags$b("5. 检验1在备择假设下的二正态参数a (a1_alter)")),
        numericInput(ns("a1_alter"), "a1_alter:", value = 1.19),
        
        p(tags$b("6. 检验1在备择假设下的二正态参数b (b1_alter)")),
        numericInput(ns("b1_alter"), "b1_alter:", value = 1.0),
        
        p(tags$b("7. 检验2在备择假设下的二正态参数a (a2_alter)")),
        numericInput(ns("a2_alter"), "a2_alter:", value = 1.82),
        
        p(tags$b("8. 检验2在备择假设下的二正态参数b (b2_alter)")),
        numericInput(ns("b2_alter"), "b2_alter:", value = 1.0),
        
        p(tags$b("9. 患者的条件相关性 (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.5),
        
        p(tags$b("10. 非患者的条件相关性 (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.5),
        
        p(tags$b("11. 部分面积的下限 (e1)")),
        numericInput(ns("e1"), "e1:", value = 0.2),
        
        p(tags$b("12. 部分面积的上限 (e2)")),
        numericInput(ns("e2"), "e2:", value = 0.8),
        
        p(tags$b("13. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("14. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("15. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果 - ROC曲线部分面积比较"),
        verbatimTextOutput(ns("output_one_sided")),
        verbatimTextOutput(ns("output_two_sided"))
      )
    )
  )
}
