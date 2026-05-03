mod_ui_7_ordinal <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("a"), "双正态参数 a:", value = 1),
    numericInput(ns("b"), "双正态参数 b:", value = 1),
    numericInput(ns("var_a"), "方差 of a:", value = 0.01),
    numericInput(ns("var_b"), "方差 of b:", value = 0.01),
    numericInput(ns("covar_ab"), "协方差 of a and b:", value = 0),
    numericInput(ns("e1"), "部分面积FPR下界:", value = 0.2),
    numericInput(ns("e2"), "部分面积FPR上界:", value = 0.8),
    actionButton(ns("estimate"), "计算"),
    verbatimTextOutput(ns("result"))
  )
}

mod_ui_7_continuous <- function(id) {
  ns <- NS(id)
  tagList(
    numericInput(ns("a"), "双正态参数 a:", value = 1),
    numericInput(ns("b"), "双正态参数 b:", value = 1),
    numericInput(ns("var_a"), "方差 of a:", value = 0.01),
    numericInput(ns("var_b"), "方差 of b:", value = 0.01),
    numericInput(ns("covar_ab"), "协方差 of a and b:", value = 0),
    numericInput(ns("e1"), "部分面积FPR下界:", value = 0.2),
    numericInput(ns("e2"), "部分面积FPR上界:", value = 0.8),
    actionButton(ns("estimate"), "计算"),
    verbatimTextOutput(ns("result"))
  )
}
