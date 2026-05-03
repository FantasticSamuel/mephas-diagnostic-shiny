mod_ui_9 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        p("请输入未患病群体的数据 (使用逗号分隔):"),
        textInput(ns("data0"), "未患病群体", value = "38,25,15,19,4"),
        
        p("请输入患病群体的数据 (使用逗号分隔):"),
        textInput(ns("data1"), "患病群体", value = "1,2,3,14,42"),
        
        numericInput(ns("p"), "有序数据分类结果的下限,第p个有序数据分类结果（连续数据的e1对应有序数据的p）:", value = 2),
        numericInput(ns("s"), "有序数据分类结果的上限,第s个有序数据分类结果（连续数据的e2对应有序数据的s）:", value = 4),
        
        actionButton(ns("submit"), "计算")
      ),
      mainPanel(
        h4("结果"),
        verbatimTextOutput(ns("summary")),
        h4("非参数估计结果"),
        tableOutput(ns("roc_results"))
      )
    )
  )
}
