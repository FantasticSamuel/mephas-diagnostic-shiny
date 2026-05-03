mod_ui_16 <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("输入参数")),
        textInput(ns("data0"), "非患病组数据（用逗号分隔）", value = "136,286,281,23,200,146,220,96,100,60,17,27,126,100,253,70,40,6,46"),
        textInput(ns("data1"), "患病组数据（用逗号分隔）", value = "140,1087,230,183,1256,700,16,800,253,740,126,153,283,90,303,193,76,1370,543,913,230,463,60,509,576,671,80,490,156,356,350,323,1560,120,216,443,523,76,303,353,206"),
        numericInput(ns("e1"), "FPR下限 (e1)", value = 0, min = 0, max = 1, step = 0.01),
        numericInput(ns("e2"), "FPR上限 (e2)", value = 0.2, min = 0, max = 1, step = 0.01),
        numericInput(ns("alpha"), "显著性水平 (alpha)", value = 0.05, min = 0, max = 1, step = 0.01),
        selectInput(ns("method"), "选择方法", 
                    choices = list("Nonparametric" = "nonparametric", 
                                   "Binormal" = "binormal", 
                                   "Confidence Intervals" = "confidence_intervals")),
        actionButton(ns("submit"), "计算")
      ),
      mainPanel(
        h4("结果"),
        verbatimTextOutput(ns("estimate"))
      )
    )
  )
}
