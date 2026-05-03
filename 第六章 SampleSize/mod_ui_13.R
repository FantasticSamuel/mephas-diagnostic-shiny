mod_ui_13_MRMC_nopilot_Se <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验1的平均灵敏度 (Se)")),
    numericInput(ns("Se"), "Se:", value = 0.8),
    
    p(tags$b("2. 备择假设下灵敏度的差异 (delta)")),
    numericInput(ns("delta"), "delta:", value = 0.05),
    
    p(tags$b("3. 读者间变异性 (var_b)")),
    numericInput(ns("var_b"), "var_b:", value = 0.01),
    
    p(tags$b("4. 同一读者内的变异性 (var_w)")),
    numericInput(ns("var_w"), "var_w:", value = 0.02),
    
    p(tags$b("5. 相同患者使用不同检验的相关性 (rho_1)")),
    numericInput(ns("rho_1"), "rho_1:", value = 0.5),
    
    p(tags$b("6. 不同读者使用相同检验的相关性 (rho_2)")),
    numericInput(ns("rho_2"), "rho_2:", value = 0.4),
    
    p(tags$b("7. 不同读者使用不同检验的相关性 (rho_3)")),
    numericInput(ns("rho_3"), "rho_3:", value = 0.3),
    
    p(tags$b("8. 相同读者使用不同检验的相关性 (rho_b)")),
    numericInput(ns("rho_b"), "rho_b:", value = 0.6),
    
    p(tags$b("9. 每个诊断测试的读者数 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("10. 患者数量 (n)")),
    numericInput(ns("n"), "n:", value = 100),
    
    p(tags$b("11. 每个读者解释每个患者结果的次数 (Q)")),
    numericInput(ns("Q"), "Q:", value = 1),
    
    p(tags$b("12. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    actionButton(ns("submit_Se"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("power_Se"))
  )
}

mod_ui_13_MRMC_nopilot_AUC <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验的平均AUC (A)")),
    numericInput(ns("A"), "A:", value = 0.8),
    
    p(tags$b("2. 备择假设下AUC的差异 (delta)")),
    numericInput(ns("delta"), "delta:", value = 0.05),
    
    p(tags$b("3. 读者间变异性 (var_b)")),
    numericInput(ns("var_b"), "var_b:", value = 0.01),
    
    p(tags$b("4. 同一读者内的变异性 (var_w)")),
    numericInput(ns("var_w"), "var_w:", value = 0.02),
    
    p(tags$b("5. 相同患者使用不同检验的相关性 (rho_1)")),
    numericInput(ns("rho_1"), "rho_1:", value = 0.5),
    
    p(tags$b("6. 不同读者使用相同检验的相关性 (rho_2)")),
    numericInput(ns("rho_2"), "rho_2:", value = 0.4),
    
    p(tags$b("7. 不同读者使用不同检验的相关性 (rho_3)")),
    numericInput(ns("rho_3"), "rho_3:", value = 0.3),
    
    p(tags$b("8. 相同读者使用不同检验的相关性 (rho_b)")),
    numericInput(ns("rho_b"), "rho_b:", value = 0.6),
    
    p(tags$b("9. 每个诊断测试的读者数 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("10. 患者数量 (n)")),
    numericInput(ns("n"), "n:", value = 100),
    
    p(tags$b("11. 每个读者解释每个患者结果的次数 (Q)")),
    numericInput(ns("Q"), "Q:", value = 1),
    
    p(tags$b("12. 患有疾病与未患疾病患者的比率 (R)")),
    numericInput(ns("R"), "R:", value = 1),
    
    p(tags$b("13. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    actionButton(ns("submit_AUC"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("power_AUC"))
  )
}

mod_ui_13_MRMC_nopilot_fixedFPR <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验的 binormal 参数 a")),
    numericInput(ns("a"), "a:", value = 0.5),
    
    p(tags$b("2. 检验的 binormal 参数 b")),
    numericInput(ns("b"), "b:", value = 0.5),
    
    p(tags$b("3. 固定的假阳性率 (e)")),
    numericInput(ns("e"), "e:", value = 0.05),
    
    p(tags$b("4. 备择假设下 z-变换灵敏度的差异 (delta)")),
    numericInput(ns("delta"), "delta:", value = 0.1),
    
    p(tags$b("5. 读者间变异性 (var_b)")),
    numericInput(ns("var_b"), "var_b:", value = 0.01),
    
    p(tags$b("6. 同一读者内的变异性 (var_w)")),
    numericInput(ns("var_w"), "var_w:", value = 0.02),
    
    p(tags$b("7. 相同患者使用不同检验的相关性 (rho_1)")),
    numericInput(ns("rho_1"), "rho_1:", value = 0.5),
    
    p(tags$b("8. 不同读者使用相同检验的相关性 (rho_2)")),
    numericInput(ns("rho_2"), "rho_2:", value = 0.4),
    
    p(tags$b("9. 不同读者使用不同检验的相关性 (rho_3)")),
    numericInput(ns("rho_3"), "rho_3:", value = 0.3),
    
    p(tags$b("10. 相同读者使用不同检验的相关性 (rho_b)")),
    numericInput(ns("rho_b"), "rho_b:", value = 0.6),
    
    p(tags$b("11. 每个诊断测试的读者数 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("12. 患者数量 (n)")),
    numericInput(ns("n"), "n:", value = 100),
    
    p(tags$b("13. 每个诊断测试的读者数 (Q)")),
    numericInput(ns("Q"), "Q:", value = 1),
    
    p(tags$b("14. 患有疾病与未患疾病患者的比率 (R)")),
    numericInput(ns("R"), "R:", value = 1),
    
    p(tags$b("15. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    actionButton(ns("submit_fixedFPR"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("power_fixedFPR"))
  )
}

mod_ui_13_MRMC_nopilot_partialAUC <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 检验的 binormal 参数 a")),
    numericInput(ns("a"), "a:", value = 0.5),
    
    p(tags$b("2. 检验的 binormal 参数 b")),
    numericInput(ns("b"), "b:", value = 0.5),
    
    p(tags$b("3. 部分面积的下界 (e1)")),
    numericInput(ns("e1"), "e1:", value = 0.1),
    
    p(tags$b("4. 部分面积的上界 (e2)")),
    numericInput(ns("e2"), "e2:", value = 0.9),
    
    p(tags$b("5. 备择假设下部分面积指标的差异 (delta)")),
    numericInput(ns("delta"), "delta:", value = 0.1),
    
    p(tags$b("6. 读者间变异性 (var_b)")),
    numericInput(ns("var_b"), "var_b:", value = 0.01),
    
    p(tags$b("7. 同一读者内的变异性 (var_w)")),
    numericInput(ns("var_w"), "var_w:", value = 0.02),
    
    p(tags$b("8. 相同患者使用不同检验的相关性 (rho_1)")),
    numericInput(ns("rho_1"), "rho_1:", value = 0.5),
    
    p(tags$b("9. 不同读者使用相同检验的相关性 (rho_2)")),
    numericInput(ns("rho_2"), "rho_2:", value = 0.4),
    
    p(tags$b("10. 不同读者使用不同检验的相关性 (rho_3)")),
    numericInput(ns("rho_3"), "rho_3:", value = 0.3),
    
    p(tags$b("11. 相同读者使用不同检验的相关性 (rho_b)")),
    numericInput(ns("rho_b"), "rho_b:", value = 0.6),
    
    p(tags$b("12. 每个诊断测试的读者数 (J)")),
    numericInput(ns("J"), "J:", value = 10),
    
    p(tags$b("13. 患者数量 (n)")),
    numericInput(ns("n"), "n:", value = 100),
    
    p(tags$b("14. 每个诊断测试的读者数 (Q)")),
    numericInput(ns("Q"), "Q:", value = 1),
    
    p(tags$b("15. 患有疾病与未患疾病患者的比率 (R)")),
    numericInput(ns("R"), "R:", value = 1),
    
    p(tags$b("16. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    actionButton(ns("submit_partialAUC"), "计算"),
    
    h4("输出结果："),
    textOutput(ns("power_partialAUC"))
  )
}
