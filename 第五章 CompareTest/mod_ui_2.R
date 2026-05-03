mod_ui_2 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4("输入聚类二元数据"),
        h5("测试 1 数据:"),
        textInput(ns("data11"), "行 1 (每一cluster的真阳性数):", value = "0,2,2,0,2,2,1,1,0,1,2,0,1,2,1,1,1,1,1,0,1,2,1,2,0"),
        textInput(ns("data12"), "行 2 (每一cluster的阳性总数):", value = "1,2,2,1,2,2,1,1,1,1,2,1,3,2,1,1,1,2,2,2,1,2,2,2,1"),
        
        h5("测试 2 数据:"),
        textInput(ns("data21"), "行 1 (每一cluster的真阳性数):", value = "1,2,2,1,2,2,1,1,1,1,2,0,2,2,1,1,1,2,1,0,1,2,2,2,0"),
        textInput(ns("data22"), "行 2 (每一cluster的阳性总数):", value = "1,2,2,1,2,2,1,1,1,1,2,1,3,2,1,1,1,2,2,2,1,2,2,2,1"),
        
        numericInput(ns("alpha"), "显著性水平 (α):", value = 0.05, min = 0, max = 1),
        actionButton(ns("submit"), "提交")
      ),
      mainPanel(
        h4("对比结果"),
        verbatimTextOutput(ns("S_e")),
        verbatimTextOutput(ns("S_p"))
      )
    )
  )
}
