mod_ui_7 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 阳性预测值比较")),
        p(tags$b("1. 检验2的假设阳性预测值 (PPV2)")),
        numericInput(ns("PPV2"), "PPV2:", value = 0.8),
        
        p(tags$b("2. 各类患者的比例 (p)")),
        p(tags$b("对于未患病的患者：")),
        numericInput(ns("p1"), "p[1] 在两个测试中均为阳性的患者比例:", value = 0.1),
        numericInput(ns("p2"), "p[2] 在测试1为阳性，测试2为阴性的患者比例:", value = 0.1),
        numericInput(ns("p3"), "p[3] 在测试2为阳性，测试1为阴性的患者比例:", value = 0.1),
        numericInput(ns("p4"), "p[4] 在两个测试中均为阴性的患者比例:", value = 0.7),
        p(tags$b("对于患病的患者：")),
        numericInput(ns("p5"), "p[5] 在两个测试中均为阳性的患者比例:", value = 0.1),
        numericInput(ns("p6"), "p[6] 在测试1为阳性，测试2为阴性的患者比例:", value = 0.1),
        numericInput(ns("p7"), "p[7] 在测试2为阳性，测试1为阴性的患者比例:", value = 0.1),
        numericInput(ns("p8"), "p[8] 在两个测试中均为阴性的患者比例:", value = 0.7),
        
        p(tags$b("3. 备择假设下的rPPV (gamma)")),
        numericInput(ns("gamma_ppv"), "gamma:", value = 1.5),
        
        p(tags$b("4. 零假设下的rPPV (delta)")),
        numericInput(ns("delta_ppv"), "delta:", value = 1),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha_ppv"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta_ppv"), "beta:", value = 0.2),
        
        h4(tags$b("参数输入 - 阴性预测值比较")),
        p(tags$b("7. 检验2的假设阴性预测值 (NPV2)")),
        numericInput(ns("NPV2"), "NPV2:", value = 0.9),
        
        p(tags$b("8. 备择假设下的rNPV (gamma)")),
        numericInput(ns("gamma_npv"), "gamma:", value = 1.5),
        
        p(tags$b("9. 零假设下的rNPV (delta)")),
        numericInput(ns("delta_npv"), "delta:", value = 1),
        
        p(tags$b("10. 显著性水平 (alpha)")),
        numericInput(ns("alpha_npv"), "alpha:", value = 0.05),
        
        p(tags$b("11. 第二类错误率 (beta)")),
        numericInput(ns("beta_npv"), "beta:", value = 0.2),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 阳性预测值比较"),
        verbatimTextOutput(ns("output_ppv_one_sided")),
        verbatimTextOutput(ns("output_ppv_two_sided")),
        
        h4("结果 - 阴性预测值比较"),
        verbatimTextOutput(ns("output_npv_one_sided")),
        verbatimTextOutput(ns("output_npv_two_sided"))
      )
    )
  )
}