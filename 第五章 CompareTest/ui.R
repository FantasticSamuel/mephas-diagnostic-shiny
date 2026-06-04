
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
if (!requireNamespace("shinyMatrix", quietly = TRUE)) {
  install.packages("shinyMatrix")
}
library("shinyMatrix")
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
if (!require("COMPARETESTS")) {
  install.packages("COMPARETESTS")
}
library("COMPARETESTS")
if (!require("shinythemes")) {
  install.packages("shinythemes")
}
library("shinythemes")
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
tagList(
  # tags$head(tags$script(src="js.cookie.js")),
  checkLogin(),
  includeCSS("../www/style_cn_causal.css"),
  stylink(),
  ########## --------------------##########--------------------##########
  navbarPage(
    theme = shinythemes::shinytheme("united"),
    title = "第五章——Compare Tests",
    collapsible = TRUE,
    # id="navbar",
    position = "static-top", header=list(tabOFF()),
    ########## ----------##########----------##########
    tabPanel(
      "5.1.1/5.1.3 二元数据灵敏度和特异度和预测值的比较",
      headerPanel("二元数据灵敏度和特异度和预测值的比较"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 比较两项测试的灵敏度和特异度，数据类型可以是未配对的二元数据或配对的二元数据。
<li> 通过 Fisher's 精确检验或标准正态分布来进行假设检验。
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 数据输入格式为 2x2 的矩阵，分别表示阳性和阴性测试结果的频数。
<li> 可以选择输入未配对或配对的二元数据，系统会根据数据类型选择相应的检验方法。
</ul>

<h4>请参考以下步骤，比较灵敏度和特异度。</h4>
"
        )
      ),
      hr(),
      mod_ui_1("mod1"),
      hr()
    ),
    tabPanel(
      "5.1.2 cluster二元数据灵敏度和特异度和预测值的比较",
      headerPanel("cluster二元数据灵敏度和特异度和预测值的比较"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 对比两组cluster二元数据的灵敏度和特异度。
<li> 输入的数据格式必须为2行，列数代表集群数，行分别为真阳性数和阳性总数（对于灵敏度）或真阴性数和阴性总数（对于特异度）。
<li> 可以通过显著性水平 α 来确定是否接受或拒绝零假设。
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 数据需要按照cluster格式输入，其中每个cluster的数据都必须输入。
<li> 示例数据已默认输入，可以修改为你的实际数据。
</ul>

<h4>请参考以下步骤，输出分析结果。</h4>
"
        )
      ),
      hr(),
      mod_ui_2("mod2"),
      hr()
    ),
tabPanel(
      "5.2.1 检验两测试双正态参数是否相等",
      headerPanel("检验两测试双正态参数是否相等"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 对未配对和配对的有序/连续数据进行双正态参数相等性测试。</li>
<li> 估计ROC曲线下的双正态参数，并测试其在不同测试中的相等性。</li>
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 输入的数据可以是两个连续或有序的数列或矩阵。</li>
<li> 可以使用示例数据或根据需要输入你自己的数据。</li>
</ul>

<h4>请参考以下步骤，进行ROC曲线下的双正态参数测试。</h4>
"
        )
      ),
      tabsetPanel(
      tabPanel(
      h3("未配对连续"),
      # Continuous Unpaired
      mod_ui_continuous_unpaired("mod3_continuous_unpaired")
      ),
      tabPanel(
      h3("未配对有序"),
      # Ordinal Unpaired
      mod_ui_ordinal_unpaired("mod3_ordinal_unpaired"),
      ),
      tabPanel(
      h3("配对连续"),
      # Continuous Paired
      mod_ui_continuous_paired("mod3_continuous_paired"),
      ),
      tabPanel(
      h3("配对有序"),
      # Ordinal Paired
      mod_ui_ordinal_paired("mod3_ordinal_paired"),
      )
      )
    ),
    tabPanel(
      "5.2.2非参数法比较固定假阳性率下的灵敏度（连续数据）",
      headerPanel("非参数法比较固定假阳性率下的灵敏度（连续数据）"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 将原始数据通过 Box-Cox 转换为正态数据。</li>
<li> 比较未配对和配对设计下的灵敏度。</li>
<li> 输出灵敏度的差异及显著性检验结果。</li>
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 输入的数据格式为连续型测试结果。</li>
<li> 可以使用示例数据或根据需要输入你自己的数据。</li>
</ul>

<h4>请参考以下步骤，进行灵敏度比较分析。</h4>
"
        )
      ),
      tabsetPanel(
      tabPanel(
      h3("未配对"),
      # Unpaired Sensitivity Comparison
      mod_ui_4_compare_unpaired("mod4_compare_unpaired"),
      ),
      tabPanel(
      h3("配对"),
      # Paired Sensitivity Comparison
      mod_ui_4_compare_paired("mod4_compare_paired"),
      )
      )
    ),
    tabPanel(
      "5.2.2参数法比较固定假阳性率下的灵敏度",
      headerPanel("参数法比较固定假阳性率下的灵敏度"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 比较连续数据和有序数据下的灵敏性差异。</li>
<li> 通过配对和非配对设计，测试两个测试之间的灵敏性差异是否显著。</li>
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 输入的数据可以是连续或有序的测试结果。</li>
<li> 通过调整显著性水平 (alpha) 和假阳性率 (FPR) 来设置分析参数。</li>
</ul>

<h4>请参考以下步骤，进行灵敏性比较分析。</h4>
"
        )
      ),
      tabsetPanel(
      tabPanel(
      h3("连续非配对"),
      mod_ui_5_continuous_unpaired("mod5_continuous_unpaired"),
      ),
      tabPanel(
      h3("连续配对"),
      mod_ui_5_continuous_paired("mod5_continuous_paired"),
      ),
      tabPanel(
      h3("有序非配对"),
      mod_ui_5_ordinal_unpaired("mod5_ordinal_unpaired"),
      ),
      tabPanel(
      h3("有序配对"),
      mod_ui_5_ordinal_paired("mod5_ordinal_paired"),
      )
      )
    ),
    tabPanel(
      "5.2.3 使得TPR显著不同的FPR范围",
      headerPanel("使得TPR显著不同的FPR范围"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 1. 功能 </b></h4>

<ul>
<li> 计算在不同的假阳性率（FPR）下两个测试的真阳性率（TPR）差异的显著性范围。</li>
<li> 支持连续和有序数据的配对和非配对设计。</li>
</ul>

<h4><b> 2. 关于数据 </b></h4>

<ul>
<li> 输入的数据可以是连续或有序的测试结果。</li>
<li> 通过设置显著性水平 (alpha) 来控制分析的灵敏度。</li>
</ul>

<h4>请参考以下步骤，确定不同FPR下TPR差异的显著性范围。</h4>
"
        )
      ),
      tabsetPanel(
      tabPanel(
      h3("连续非配对"),
      mod_ui_6_continuous_unpaired("mod6_continuous_unpaired"),
      ),
      tabPanel(
      h3("连续配对"),
      mod_ui_6_continuous_paired("mod6_continuous_paired"),
      ),
      tabPanel(
      h3("有序非配对"),
      mod_ui_6_ordinal_unpaired("mod6_ordinal_unpaired"),
      ),
      tabPanel(
      h3("有序配对"),
      mod_ui_6_ordinal_paired("mod6_ordinal_paired"),
      )
      )
    ),
    tabPanel(
      "5.2.4 delta方法比较ROC曲线下面积与部分面积",
      headerPanel("delta方法比较ROC曲线下面积与部分面积"),
      
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
<h4><b> 功能 </b></h4>

<ul>
<li> 比较两组测试数据的ROC曲线下面积 (AUC) 及其部分面积。</li>
<li> 输出显著性水平下的检验结果。</li>
</ul>

<h4><b> 数据要求 </b></h4>

<ul>
<li> 输入的数据格式为分类数据或连续数据，支持未配对和配对设计。</li>
<li> 可以使用示例数据或输入自定义数据。</li>
</ul>

<h4>请参考以下步骤进行面积比较分析。</h4>
"
        )
      ),
      tabsetPanel(
        tabPanel(
          h3("未配对连续"),
          # Continuous Unpaired
          mod_ui_8_continuous_unpaired("mod8_continuous_unpaired")
        ),
        tabPanel(
          h3("未配对有序"),
          # Ordinal Unpaired
          mod_ui_8_ordinal_unpaired("mod8_ordinal_unpaired")
        ),
        tabPanel(
          h3("配对连续"),
          # Continuous Paired
          mod_ui_8_continuous_paired("mod8_continuous_paired")
        ),
        tabPanel(
          h3("配对有序"),
          # Ordinal Paired
          mod_ui_8_ordinal_paired("mod8_ordinal_paired")
        )
      )
    ),
    tabPanel(
      "5.2.4 Logit变换结合delta方法比较ROC曲线下面积与部分面积",
      headerPanel("Logit变换结合delta方法比较ROC曲线下面积与部分面积"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b> 1. 功能 </b></h4>
      <ul>
        <li> 对未配对和配对的有序数据进行logit转换下的全区和部分区ROC曲线面积比较。</li>
        <li> 使用logit和McClish转换方法，比较不同区间的ROC曲线面积。</li>
      </ul>
      <h4><b> 2. 关于数据 </b></h4>
      <ul>
        <li> 输入的数据格式为一个或两个矩阵，分别表示未患病和患病个体的测试结果。</li>
        <li> 可以使用示例数据或根据需要输入你自己的数据。</li>
      </ul>
      <h4>请参考以下步骤，进行logit转换下的参数估计。</h4>
      "
        )
      ),
      tabsetPanel(
        tabPanel(
          h3("未配对有序"),
          # Ordinal Unpaired
          mod_ui_9_ordinal_unpaired("mod9_ordinal_unpaired")
        ),
        tabPanel(
          h3("配对有序"),
          # Ordinal Paired
          mod_ui_9_ordinal_paired("mod9_ordinal_paired")
        )
      )
    ),
    tabPanel(
      "5.2.4 单个Box-Cox变换应用于连续数据",
      headerPanel("单个Box-Cox变换应用于连续数据"),
      
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
        <h4><b> 1. 功能 </b></h4>
        <ul>
          <li> 使用 Zou 的方法对连续数据进行参数估计。</li>
          <li> 判断测试 1 和测试 2 之间的区域是否存在显著性差异。</li>
        </ul>

        <h4><b> 2. 关于数据 </b></h4>
        <ul>
          <li> 输入的数据格式为四个向量，分别代表未患病个体的测试 1 和测试 2 结果，以及患病个体的测试 1 和测试 2 结果。</li>
          <li> 可以使用示例数据或根据需要输入你自己的数据。</li>
        </ul>

        <h4>请按照提示输入数据，点击“提交”按钮查看结果。</h4>
        "
        )
      ),
      
      mod_ui_10("mod10"),
      
      hr()
    ),
    tabPanel(
      "5.2.4 有序数据的Delong 方法比较区域",
      headerPanel("有序数据的Delong 方法比较区域"),
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
        <h4><b> 1. 功能 </b></h4>
        <ul>
          <li> 使用 Delong 的方法计算 AUC 并判断不同测试之间的区域是否存在显著性差异。</li>
        </ul>

        <h4><b> 2. 输入数据 </b></h4>
        <ul>
          <li> 输入的数据格式为四个向量，分别代表测试1和测试2的未患病和患病个体的结果。</li>
          <li> 可以使用示例数据或根据需要输入你自己的数据。</li>
        </ul>

        <h4><b> 3. 输出 </b></h4>
        <ul>
          <li> 输出包括计算的AUC值及其方差，并给出两个测试间区域差异的显著性判断。</li>
        </ul>

        <h4>请按照提示输入数据，点击“提交”按钮查看结果。</h4>
        "
        )
      ),
      hr(),
      mod_ui_11("mod11"),
      hr()
    ),
    tabPanel(
      "5.2.4 连续数据的He 和 Escobar 方法比较部分区域",
      headerPanel("连续数据的He 和 Escobar 方法比较部分区域"),
      
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
        <h4><b> 1. 功能 </b></h4>
        <ul>
          <li> 使用 He 和 Escobar 的方法对连续数据进行部分区域比较。</li>
          <li> 判断测试 1 和测试 2 在指定 FPR 区间的部分区域下是否存在显著性差异。</li>
        </ul>

        <h4><b> 2. 关于数据 </b></h4>
        <ul>
          <li> 输入的数据格式为四个向量，分别代表未患病个体的测试 1 和测试 2 结果，以及患病个体的测试 1 和测试 2 结果。</li>
          <li> 可以使用示例数据或根据需要输入你自己的数据。</li>
        </ul>

        <h4>请按照提示输入数据，点击“提交”按钮查看结果。</h4>
        "
        )
      ),
      
      mod_ui_12("mod12"),
      
      hr()
    ),
    tabPanel(
      "5.2.4 cluster数据的ROC面积比较",
      headerPanel("cluster数据的ROC面积比较"),
      
      conditionalPanel(
        condition = "input.explain_on_off",
        HTML(
          "
      <h4><b> 1. 功能 </b></h4>
      <ul>
        <li> 对两组cluster数据的ROC面积进行比较，判断是否存在显著性差异。</li>
      </ul>

      <h4><b> 2. 关于数据 </b></h4>
      <ul>
        <li> 输入的cluster数据格式为两个矩阵，每个矩阵包含两个群体的数据，分别对应疾病组和非疾病组。</li>
        <li> 可以使用示例数据或根据需要输入你自己的数据。</li>
      </ul>

      <h4>请按照提示输入数据，点击“提交”按钮查看结果。</h4>
      "
        )
      ),
      
      mod_ui_13("mod13"),
      
      hr()
    ),
    ########## ----------##########----------##########
    tabstop(),
    tablink()
    # navbarMenu("",icon=icon("link"))
  )
)
