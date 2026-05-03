mod_ui_14_sample_fixedreader_AUC_Blume <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验的平均AUC (theta)")),
    numericInput(ns("theta"), "theta:", value = 0.8),
    
    p(tags$b("2. 检验1的AUC (theta1)")),
    numericInput(ns("theta1"), "theta1:", value = 0.7),
    
    p(tags$b("3. 检验2的AUC (theta2)")),
    numericInput(ns("theta2"), "theta2:", value = 0.75),
    
    p(tags$b("4. 配对设计中的检验间相关性 (r)")),
    numericInput(ns("r"), "r:", value = 0.5),
    
    p(tags$b("5. 读者数量 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("6. 读者间差异相关性 (rho)")),
    numericInput(ns("rho"), "rho:", value = 0.4),
    
    p(tags$b("7. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    p(tags$b("8. 检验功效 (1-beta)")),
    numericInput(ns("beta"), "beta:", value = 0.2),
    
    p(tags$b("9. 患有疾病与未患疾病患者的比率 (R)")),
    numericInput(ns("R"), "R:", value = 1),
    
    actionButton(ns("submit_Blume"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("output_Blume"))
  )
}

mod_ui_14_sample_fixedreader_AUC_Obuchowski <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验1的 binormal 参数 (a1_null)")),
    numericInput(ns("a1_null"), "a1_null:", value = 0.5),
    
    p(tags$b("2. 检验2的 binormal 参数 (a2_null)")),
    numericInput(ns("a2_null"), "a2_null:", value = 0.5),
    
    p(tags$b("3. 备择假设下检验1的 binormal 参数 (a1_alter)")),
    numericInput(ns("a1_alter"), "a1_alter:", value = 0.7),
    
    p(tags$b("4. 备择假设下检验2的 binormal 参数 (a2_alter)")),
    numericInput(ns("a2_alter"), "a2_alter:", value = 0.8),
    
    p(tags$b("5. 患者群体间的相关性 (rD)")),
    numericInput(ns("rD"), "rD:", value = 0.5),
    
    p(tags$b("6. 未患病患者群体间的相关性 (rN)")),
    numericInput(ns("rN"), "rN:", value = 0.4),
    
    p(tags$b("7. 读者数量 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("8. 读者间相关性差异 (rho)")),
    numericInput(ns("rho"), "rho:", value = 0.3),
    
    p(tags$b("9. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    p(tags$b("10. 检验功效 (1-beta)")),
    numericInput(ns("beta"), "beta:", value = 0.2),
    
    p(tags$b("11. 患有疾病与未患疾病患者的比率 (R)")),
    numericInput(ns("R"), "R:", value = 1),
    
    actionButton(ns("submit_Obuchowski"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("output_Obuchowski"))
  )
}
