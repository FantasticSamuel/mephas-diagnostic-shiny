mod_ui_15_MRMC_pilot <- function(id) {
  ns <- NS(id)
  tagList(
    p(tags$b("1. 备择假设下测试1的准确性差异 (delta)")),
    numericInput(ns("delta"), "delta:", value = 0.05),
    
    p(tags$b("2. 试点研究中的读者数量 (J_pilot)")),
    numericInput(ns("J_pilot"), "J_pilot:", value = 4),
    
    p(tags$b("3. 试点研究中的总患者数量 (N_pilot)")),
    numericInput(ns("N_pilot"), "N_pilot:", value = 100),
    
    p(tags$b("4. 当前研究中的读者数量 (J)")),
    numericInput(ns("J"), "J:", value = 4),
    
    p(tags$b("5. 当前研究中的总患者数量 (N)")),
    numericInput(ns("N"), "N:", value = 200),
    
    p(tags$b("6. 模态-读者-患者交互作用均方 (MSTRP)")),
    numericInput(ns("MSTRP"), "MSTRP:", value = 0.01),
    
    p(tags$b("7. 模态-读者交互作用均方 (MSTR)")),
    numericInput(ns("MSTR"), "MSTR:", value = 0.02),
    
    p(tags$b("8. 模态-患者交互作用均方 (MSTP)")),
    numericInput(ns("MSTP"), "MSTP:", value = 0.03),
    
    p(tags$b("9. 显著性水平 (alpha)")),
    numericInput(ns("alpha"), "alpha:", value = 0.05),
    
    actionButton(ns("submit_pilot"), "计算"),
    h4("输出结果："),
    textOutput(ns("power_pilot"))
  )
}
