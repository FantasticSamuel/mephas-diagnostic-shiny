
if (!requireNamespace("shiny", quietly = TRUE)) {
  install.packages("shiny")
}
require("shiny", quietly = TRUE)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
require("ggplot2", quietly = TRUE)
if (!require("reshape")) {
  install.packages("reshape")
}
library("reshape")
if (!require("psych")) {
  install.packages("psych")
}
library("psych")
if (!require("DT")) {
  install.packages("DT")
}
library("DT")
if (!require("plotly")) {
  install.packages("plotly")
}
library("plotly")
if (!require("shinyWidgets")) {
  install.packages("shinyWidgets")
}
library("shinyWidgets")
if (!require("dplyr")) {
  install.packages("dplyr")
}
library("dplyr")
if (!require("foreign")) {
  install.packages("foreign")
}
library("foreign")
Sys.setlocale(locale = "Chinese")
if (!require("SINGLESAMPLE")) {
  install.packages("SINGLESAMPLE")
}
library("SINGLESAMPLE")
library(shinythemes)
source("../tab/tab_cn_causal.R", encoding="utf-8")
source("../tab/panel_plotinfo_cn.R", encoding = "utf-8")
source("../tab/func.R", encoding = "utf-8")
source("mod_ui_1.R", local = TRUE, encoding = "utf-8")
source("mod_ui_2.R", local = TRUE, encoding = "utf-8")
source("mod_ui_3.R", local = TRUE, encoding = "utf-8")
source("mod_ui_4.R", local = TRUE, encoding = "utf-8") 
source("mod_ui_5.R", local = TRUE, encoding = "utf-8") 
source("mod_ui_6.R", local = TRUE, encoding = "utf-8") 
source("mod_ui_7.R", local = TRUE, encoding = "utf-8")
source("mod_ui_8.R", local = TRUE, encoding = "utf-8")
source("mod_ui_9.R", local = TRUE, encoding = "utf-8")
source("mod_ui_10.R", local = TRUE, encoding = "utf-8")
source("mod_ui_11.R", local = TRUE, encoding = "utf-8")
source("mod_ui_12.R", local = TRUE, encoding = "utf-8")
source("mod_ui_13.R", local = TRUE, encoding = "utf-8")
source("mod_ui_14.R", local = TRUE, encoding = "utf-8")
source("mod_ui_15.R", local = TRUE, encoding = "utf-8")
source("mod_ui_16.R", local = TRUE, encoding = "utf-8")
source("mod_ui_17.R", local = TRUE, encoding = "utf-8")
source("mod_ui_18.R", local = TRUE, encoding = "utf-8")
source("mod_ui_19.R", local = TRUE, encoding = "utf-8")
tagList(
  # tags$head(tags$script(src="js.cookie.js")),
  checkLogin(),
  includeCSS("../www/style_cn_causal.css"),
  stylink(),
  
  
  ########## --------------------##########--------------------##########
  navbarPage(
    theme = shinythemes::shinytheme("united"),
    title = "第四章——单一样本的参数估计与假设检验",
    collapsible = TRUE,
    # id="navbar",
    position = "static-top", header=list(tabOFF()),
    
    
    ########## ----------##########----------##########
    navbarMenu(
      "4.1 二分类数据",
      tabPanel("4.1.1 二分类数据的Se与Sp", 
               headerPanel("二分类数据的灵敏度Se与特异度Sp"),
               mod_ui_1("mod1")
      ),
      tabPanel("4.1.2 二分类数据的PPV和NPV", 
               headerPanel("二分类数据的PPV和NPV"),
               mod_ui_2("mod2")
      ),
      tabPanel("4.1.3 Cluster二分类数据的灵敏度和特异度", 
               headerPanel("Cluster二分类数据的灵敏度和特异度"),
               mod_ui_3("mod3")
      ),
      tabPanel("4.1.4 二分类数据的似然比", 
               headerPanel("二分类数据的正和负似然比"),
               mod_ui_4("mod4")
      ),
      tabPanel("4.1.5 二分类数据的优势比", 
               headerPanel("二分类数据的优势比计算"),
               mod_ui_5("mod5")
      )
    ),
    navbarMenu(
      "4.2 有序数据",
      tabPanel("4.2.1 有序数据的经验ROC曲线", 
               headerPanel("有序数据的经验ROC曲线"),
               mod_ui_6("mod6")
      ),
      tabPanel("4.2.2-4.2.4 有序数据的双正态ROC曲线", 
               headerPanel("有序数据的双正态ROC曲线"),
               mod_ui_7("mod7")
      ),
      tabPanel("4.2.5 有序数据的全面积和部分面积", 
               headerPanel("有序数据的全面积和部分面积及置信区间计算"),
               mod_ui_8("mod8")
      ),
      tabPanel("4.2.6 有序数据的非参数ROC估计", 
               headerPanel("有序数据的非参数方法估计 ROC 曲线下的面积"),
               mod_ui_9("mod9")
      ),
      tabPanel("4.2.7 有序Cluster数据ROC曲线下的面积计算", 
               headerPanel("有序Cluster数据 ROC 曲线下的面积计算"),
               mod_ui_10("mod10")
      ),
      tabPanel("4.2.8 有序数据的参数、半参数以及非参数ROC曲线方法选择", 
               headerPanel("有序数据的参数、半参数以及非参数的ROC曲线估计方法"),
               mod_ui_11("mod11")
      )
    ),
    navbarMenu(
      "4.3 连续数据",
      tabPanel("4.3.1 连续数据的经验ROC曲线", 
               headerPanel("连续型数据的经验ROC曲线"),
               mod_ui_12("mod12")
      ),
      tabPanel("4.3.2 连续数据的非参数ROC曲线", 
               headerPanel("连续数据的非参数平滑ROC曲线计算和处理"),
               mod_ui_13("mod13")
      ),
      tabPanel("4.3.2 连续数据的参数ROC曲线(Box-Cox)", 
               headerPanel("连续数据的平滑 ROC 曲线计算（数据已Box-Cox 变换）"),
               mod_ui_14("mod14")
      ),
      tabPanel("4.3.2 连续数据的ROC曲线（半参数方法）", 
               headerPanel("连续数据的平滑 ROC 曲线计算（半参数方法）"),
               mod_ui_15("mod15")
      ),
      tabPanel("4.3.4 连续数据的ROC曲线面积与部分面积", 
               headerPanel("连续数据的ROC曲线下面积和部分面积:参数、非参数和半参数法"),
               mod_ui_16("mod16")
      ),
      tabPanel("4.3.6 连续数据的固定特异度下的灵敏性和决策阈值", 
               headerPanel("连续数据的固定特异度下的灵敏性和决策阈值计算"),
               mod_ui_17("mod17")
      ),
      tabPanel("4.3.7 连续数据的最佳决策点计算", 
               headerPanel("连续数据的最佳决策点"),
               mod_ui_18("mod18")
      )
    ),
    tabPanel(
      "4.4 ROC曲线面积检验",
      headerPanel("ROC 曲线面积或部分面积的假设检验"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 根据给定的估计面积（或部分面积）、方差和显著性水平，检验 ROC 曲线的面积（或部分面积）是否为指定值（A0）。
<li> 输出检验统计量和是否拒绝零假设的结果。
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 输入的观测数据应包括零假设下的面积或部分面积（A0）、估计的面积或部分面积（A）、估计的方差和显著性水平（alpha）。
<li> 该函数基于标准正态分布检验假设。
</ul>

<h4>请参考以下步骤，进行假设检验并查看结果。</h4>
"
        )
      ),
      hr(),
      mod_ui_19("mod19"),
      hr()
    ),
    ########## ----------##########----------##########
    tabstop(),
    tablink()
    # navbarMenu("",icon=icon("link"))
  )
)
