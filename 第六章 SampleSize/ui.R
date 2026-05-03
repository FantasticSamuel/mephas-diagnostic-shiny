
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
library(SAMPLESIZE)
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
tagList(
  # tags$head(tags$script(src="js.cookie.js")),
  checkLogin(),
  includeCSS("../www/style_cn_causal.css"),
  stylink(),
  

  ########## --------------------##########--------------------##########
  navbarPage(
    theme = shinythemes::shinytheme("united"),
    title = "第六章——样本量的估计",
    collapsible = TRUE,
    # id="navbar",
    position = "static-top", header=list(tabOFF()),
    

    tabPanel(
      "6.1.1 样本量计算（灵敏度和特异度）",
      headerPanel("样本量计算（灵敏度和特异度）"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在估计灵敏度和特异度的情况下所需的样本量。</li>
        <li> 用户需要输入假设的灵敏度、特异度、显著性水平、功效、置信区间的半宽度和群体中的患病率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_1("mod1"),
      hr()
    ),
    tabPanel(
      "6.1.2 样本量计算（ROC曲线下面积）",
      headerPanel("样本量计算（ROC曲线下面积）"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算估计ROC曲线下面积(AUC)时所需的样本量。</li>
        <li> 用户需要输入估计的AUC值、无疾病患者与有疾病患者的比率、显著性水平、功效和置信区间的半宽度。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_2("mod2"),
      hr()
    ),
    


    tabPanel(
      "6.1.4 ROC曲线下面积假设检验",
      headerPanel("ROC曲线下面积假设检验"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于在给定的零假设和备择假设下，检验ROC曲线下面积是否等于指定值。</li>
        <li> 用户需要输入零假设和备择假设下的ROC曲线下面积、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_3("mod3"),
      hr()
    ),
    
    tabPanel(
      "6.1.5 固定假阳性率下的灵敏度样本量计算",
      headerPanel("固定假阳性率下的灵敏度样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定假阳性率下，估计灵敏度所需的样本量。</li>
        <li> 用户需要输入假设的二正态分布参数、固定假阳性率、灵敏度的置信区间半宽度、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_4("mod4"),
      hr()
    ),
    
    tabPanel(
      "6.1.6 ROC曲线部分面积样本量计算",
      headerPanel("ROC曲线部分面积样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定部分ROC曲线下面积的上下限下，估计样本量。</li>
        <li> 用户需要输入二正态分布参数、部分面积的上下限、显著性水平、功效、置信区间半宽度以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_5("mod5"),
      hr()
    ),
    
    tabPanel(
      "6.2.2 检验灵敏度和/或特异度的比较样本量计算",
      headerPanel("检验灵敏度和/或特异度的比较样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算检验两种检测方法在灵敏度和/或特异度上的比较所需的样本量。</li>
        <li> 用户需要输入检验1和检验2在备择假设下的灵敏度和特异度、P(T1=1|T2=1)、P(T1=0|T2=0)、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_6("mod6"),
      hr()
    ),
    
    tabPanel(
      "6.2.3 检验阳性预测值和阴性预测值的比较样本量计算",
      headerPanel("检验阳性预测值和阴性预测值的比较样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算检验两种检测方法在阳性预测值和阴性预测值上的比较所需的样本量。</li>
        <li> 用户需要输入检验2的假设阳性预测值和阴性预测值、各类患者的比例、rPPV和rNPV的备择假设值和零假设值、显著性水平、功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_7("mod7"),
      hr()
    ),
    
    tabPanel(
      "6.2.4 检验ROC曲线下面积的比较样本量计算",
      headerPanel("检验ROC曲线下面积的比较样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算检验两种检测方法在ROC曲线下面积上的比较所需的样本量。</li>
        <li> 用户需要输入在二正态假设下的相关参数，或在任意分布下的相关参数，并指定显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_8("mod8"),
      hr()
    ),
    
    tabPanel(
      "6.2.6 固定假阳性率下的灵敏度比较样本量计算",
      headerPanel("固定假阳性率下的灵敏度比较样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定假阳性率下，比较两种检测方法的灵敏度所需的样本量。</li>
        <li> 用户需要输入在二正态假设下的相关参数，指定固定假阳性率，并指定显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_9("mod9"),
      hr()
    ),
    
    tabPanel(
      "6.2.7 ROC曲线部分面积比较样本量计算",
      headerPanel("ROC曲线部分面积比较样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定部分ROC曲线下面积的上下限下，比较两种检测方法的样本量。</li>
        <li> 用户需要输入在二正态假设下的相关参数，指定部分面积的上下限，并指定显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_10("mod10"),
      hr()
    ),
    tabPanel(
      "6.3 比较两种方法需要的样本量估计（16个内容）",
    tabsetPanel(
    tabPanel(
      "6.3 非劣性测试样本量计算 (灵敏度)",
      headerPanel("非劣性测试样本量计算 (灵敏度)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在非劣性测试中所需的样本量，基于灵敏度进行评估。</li>
        <li> 用户需要输入相关参数，包括灵敏度、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_Se("mod11_non_inferiority_Se"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (特异度)",
      headerPanel("非劣性测试样本量计算 (特异度)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在非劣性测试中所需的样本量，基于特异度进行评估。</li>
        <li> 用户需要输入相关参数，包括特异度、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_Sp("mod11_non_inferiority_Sp"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (AUC, Binormal)",
      headerPanel("非劣性测试样本量计算 (AUC, Binormal)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在非劣性测试中所需的样本量，基于 AUC (Binormal) 进行评估。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、相关性、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_AUC_binormal("mod11_non_inferiority_AUC_binormal"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (AUC, 任意分布)",
      headerPanel("非劣性测试样本量计算 (AUC, 任意分布)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在非劣性测试中所需的样本量，基于任意分布的 AUC 进行评估。</li>
        <li> 用户需要输入相关参数，包括 AUC、相关性、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_AUC_any("mod11_non_inferiority_AUC_any"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (固定假阳性率下的灵敏度)",
      headerPanel("非劣性测试样本量计算 (固定假阳性率下的灵敏度)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定假阳性率下，非劣性测试中的样本量。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、患者相关性、固定假阳性率、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_fixedFPR("mod11_non_inferiority_fixedFPR"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (部分AUC)",
      headerPanel("非劣性测试样本量计算 (部分AUC)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在部分AUC的非劣性测试中所需的样本量。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、患者相关性、部分AUC的上下界、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_partialAUC("mod11_non_inferiority_partialAUC"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (灵敏度)",
      headerPanel("等效性测试样本量计算 (灵敏度)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在灵敏度等效性测试中所需的样本量。</li>
        <li> 用户需要输入相关参数，包括灵敏度、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_Se("mod11_equivalency_Se"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (特异度)",
      headerPanel("等效性测试样本量计算 (特异度)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在特异度等效性测试中所需的样本量。</li>
        <li> 用户需要输入相关参数，包括特异度、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_Sp("mod11_equivalency_Sp"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (AUC, binormal)",
      headerPanel("等效性测试样本量计算 (AUC, binormal)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在 AUC 等效性测试中的样本量，基于 binormal 假设。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、相关性、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_AUC_binormal("mod11_equivalency_AUC_binormal"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (AUC, any distribution)",
      headerPanel("等效性测试样本量计算 (AUC, any distribution)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在 AUC 等效性测试中的样本量，适用于任何分布假设。</li>
        <li> 用户需要输入相关参数，包括 AUC、相关性、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_AUC_any("mod11_equivalency_AUC_any"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (灵敏度在固定FPR下)",
      headerPanel("等效性测试样本量计算 (灵敏度在固定FPR下)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算在固定假阳性率 (FPR) 下进行灵敏度等效性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、相关性、假阳性率、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_fixedFPR("mod11_equivalency_fixedFPR"),
      hr()
    ),
    tabPanel(
      "6.3 等效性测试样本量计算 (部分AUC)",
      headerPanel("等效性测试样本量计算 (部分AUC)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算部分AUC等效性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括 binormal 参数、相关性、部分面积的上下界、最小可接受差异、显著性水平、功效以及无疾病与有疾病患者的比率。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_equivalency_partialAUC("mod11_equivalency_partialAUC"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (rTPR)",
      headerPanel("非劣性测试样本量计算 (rTPR)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算 rTPR 非劣性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括灵敏度、两个测试均为阳性的概率、rTPR 在备择假设下的特定值、rTPR 的无效假设值、显著性水平以及功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_rTPR("mod11_non_inferiority_rTPR"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (rFPR)",
      headerPanel("非劣性测试样本量计算 (rFPR)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算 rFPR 非劣性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括假阳性率、两个测试均为阳性的概率、rFPR 在备择假设下的特定值、rFPR 的无效假设值、显著性水平以及功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_rFPR("mod11_non_inferiority_rFPR"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (PPV)",
      headerPanel("非劣性测试样本量计算 (PPV)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算 PPV 非劣性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括阳性预测值、患者测试结果的比例、rPPV 在备择假设下的特定值、rPPV 的无效假设值、显著性水平以及功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_PPV("mod11_non_inferiority_PPV"),
      hr()
    ),
    tabPanel(
      "6.3 非劣性测试样本量计算 (NPV)",
      headerPanel("非劣性测试样本量计算 (NPV)"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算 NPV 非劣性测试的样本量。</li>
        <li> 用户需要输入相关参数，包括阴性预测值、患者测试结果的比例、rNPV 在备择假设下的特定值、rNPV 的无效假设值、显著性水平以及功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_11_non_inferiority_NPV("mod11_non_inferiority_NPV"),
      hr()
    )
    
    )
    ),
    tabPanel(
      "6.4 确定合适的临界值的样本量计算",
      headerPanel("确定合适的临界值的样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算确定合适的临界值时所需的样本量。</li>
        <li> 用户需要输入相关参数，包括特异度、猜测的灵敏度、最小灵敏度、二正态参数 b，以及显著性水平和功效。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      hr(),
      mod_ui_12("mod12"),
      hr()
    ),
    tabPanel(
      "6.5.1 多读者研究的样本量计算",
      headerPanel("多读者研究的样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算多读者研究中样本量的统计功效。</li>
        <li> 用户需要输入相关参数，包括灵敏度、读者间和读者内的变异性、相关性、读者数量、患者数量、重复次数、以及显著性水平。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      tabsetPanel(
        tabPanel("灵敏度检验",
                 mod_ui_13_MRMC_nopilot_Se("MRMC_nopilot_Se")
        ),
        tabPanel("AUC检验",
                 mod_ui_13_MRMC_nopilot_AUC("MRMC_nopilot_AUC")
        ),
        tabPanel("固定假阳性率下的灵敏度检验",
                 mod_ui_13_MRMC_nopilot_fixedFPR("MRMC_nopilot_fixedFPR")
        ),
        tabPanel("部分AUC检验",
                 mod_ui_13_MRMC_nopilot_partialAUC("MRMC_nopilot_partialAUC")
        )
      )
    ),
    tabPanel(
      "6.5.2 固定读者MRMC设计的样本量计算",
      headerPanel("固定读者MRMC设计的样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算固定读者MRMC设计中的样本量。</li>
        <li> 用户需要输入相关参数，包括AUC、读者间和读者内的变异性、相关性、读者数量、患者数量、以及显著性水平。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      tabsetPanel(
        tabPanel("Blume 方法",
                 mod_ui_14_sample_fixedreader_AUC_Blume("sample_fixedreader_AUC_Blume")
        ),
        tabPanel("Obuchowski 方法",
                 mod_ui_14_sample_fixedreader_AUC_Obuchowski("sample_fixedreader_AUC_Obuchowski")
        )
      )
    ),
    tabPanel(
      "6.5.3 有试点数据的多读者研究样本量计算",
      headerPanel("有试点数据的多读者研究样本量计算"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b>功能描述</b></h4>
      <ul>
        <li> 本模块用于计算有试点数据的多读者研究中样本量的统计功效。</li>
        <li> 用户需要输入相关参数，包括测试准确性差异、读者数量、患者数量、交互作用均方，以及显著性水平。</li>
      </ul>
      <h4>请根据需要输入参数，并点击“计算”按钮查看结果。</h4>
      "
        )
      ),
      mod_ui_15_MRMC_pilot("MRMC_pilot")
    ),
    tabstop(),
    tablink()
    # navbarMenu("",icon=icon("link"))
  )
)
