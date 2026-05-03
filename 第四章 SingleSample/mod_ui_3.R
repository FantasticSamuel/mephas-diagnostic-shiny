mod_ui_3 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        numericInput(ns("n_matrices"), "cluster个数:", 2, min = 1),
        
        # 动态生成的输入框容器
        uiOutput(ns("matrix_inputs")),
        
        numericInput(ns("alpha"), "显著性水平:", 0.05),
        
        actionButton(ns("submit"), "计算")
      ),
      
      mainPanel(
        h4("结果"),
        verbatimTextOutput(ns("estimate")),
        h4("Se置信区间"),
        tableOutput(ns("se_intervals")),
        h4("Sp置信区间"),
        tableOutput(ns("sp_intervals")),
        h4("PPV置信区间"),
        tableOutput(ns("ppv_intervals")),
        h4("NPV置信区间"),
        tableOutput(ns("npv_intervals"))
      )
    )
  )
}
