mod_ui_11 <- function(id) {
  ns <- NS(id)  # 创建命名空间
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入数据")),
        textInput(ns("data0"), "请输入未患病群体的数据 (使用逗号分隔):", value = "38,25,15,19,4"),
        textInput(ns("data1"), "请输入患病群体的数据 (使用逗号分隔):", value = "1,2,3,14,42"),
        selectInput(ns("method"), "选择模型:", choices = c("Bigamma", "Logistic")),
        actionButton(ns("submit"), "计算")
      ),
      mainPanel(
        h4("结果"),
        plotOutput(ns("roc_plot")),
        verbatimTextOutput(ns("estimate"))
      )
    )
  )
}
