mod_ui_1 <- function(id) {
  ns <- NS(id)
  sidebarLayout(
    sidebarPanel(
      h4(tags$b("输入二元数据")),
      h5("实际未患病:"),
      matrixInput(
        inputId = ns("data1"),
        label = "实际未患病",
        value = matrix(c(12, 7, 11, 71), nrow = 2, byrow = TRUE,
                       dimnames = list(c("诊断1+", "诊断1-"), c("诊断2+", "诊断2-"))),
        rows = list(names = TRUE),
        cols = list(names = TRUE)
      ),
      h5("实际患病:"),
      matrixInput(
        inputId = ns("data2"),
        label = "实际患病",
        value = matrix(c(49, 1, 7, 5), nrow = 2, byrow = TRUE,
                       dimnames = list(c("诊断1+", "诊断1-"), c("诊断2+", "诊断2-"))),
        rows = list(names = TRUE),
        cols = list(names = TRUE)
      ),
      numericInput(ns("alpha"), "显著性水平 (α):", value = 0.05, min = 0, max = 1, step = 0.01),
      selectInput(ns("data_type"), "选择数据类型:", choices = c("未配对" = "unpaired", "配对" = "paired")),
      actionButton(ns("submit"), "计算")
    ),
    mainPanel(
      h3("灵敏度"),
      h4("检验统计量"),
      textOutput(ns("Se_p")),
      h4("检验结果"),
      textOutput(ns("Se_char")),
      h3("特异度"),
      h4("检验统计量"),
      textOutput(ns("Sp_p")),
      h4("检验结果"),
      textOutput(ns("Sp_char")),
      h3("PPV用Leisenring方法结果"),
      h4("检验统计量"),
      textOutput(ns("PPV_Leisenring_test_statistic")),
      h4("p值"),
      textOutput(ns("PPV_Leisenring_p")),
      h4("检验结果"),
      textOutput(ns("PPV_Leisenring_significance")),
      
      h3("NPV用Leisenring方法结果"),
      h4("检验统计量"),
      textOutput(ns("NPV_Leisenring_test_statistic")),
      h4("p值"),
      textOutput(ns("NPV_Leisenring_p")),
      h4("检验结果"),
      textOutput(ns("NPV_Leisenring_significance")),
      
      h3("PPV用Pepe方法结果"),
      h4("检验统计量"),
      textOutput(ns("PPV_Pepe_test_statistic")),
      h4("p值"),
      textOutput(ns("PPV_Pepe_p")),
      h4("检验结果"),
      textOutput(ns("PPV_Pepe_significance")),
      
      h3("PPV用Pepe方法结果"),
      h4("检验统计量"),
      textOutput(ns("NPV_Pepe_test_statistic")),
      h4("p值"),
      textOutput(ns("NPV_Pepe_p")),
      h4("检验结果"),
      textOutput(ns("NPV_Pepe_significance")),
    )
  )
}
