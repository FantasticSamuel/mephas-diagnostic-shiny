mod_ui_11_non_inferiority_Se <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (敏感性)")),
        
        p(tags$b("1. 检验1的敏感性 (Se1)")),
        numericInput(ns("Se1"), "Se1:", value = 0.8),
        
        p(tags$b("2. 检验2的敏感性 (Se2)")),
        numericInput(ns("Se2"), "Se2:", value = 0.7),
        
        p(tags$b("3. P(T1=1|T2=1) (p)")),
        numericInput(ns("p"), "p:", value = 0.9),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_Se"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (敏感性)"),
        verbatimTextOutput(ns("output_non_inferiority_Se"))
      )
    )
  )
}
mod_ui_11_non_inferiority_Sp <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (特异性)")),
        
        p(tags$b("1. 检验1的特异性 (Sp1)")),
        numericInput(ns("Sp1"), "Sp1:", value = 0.9),
        
        p(tags$b("2. 检验2的特异性 (Sp2)")),
        numericInput(ns("Sp2"), "Sp2:", value = 0.8),
        
        p(tags$b("3. P(T1=1|T2=1) (p)")),
        numericInput(ns("p"), "p:", value = 0.9),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_Sp"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (特异性)"),
        verbatimTextOutput(ns("output_non_inferiority_Sp"))
      )
    )
  )
}
mod_ui_11_non_inferiority_AUC_binormal <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (AUC, Binormal)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a (a1)")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b (b1)")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a (a2)")),
        numericInput(ns("a2"), "a2:", value = 0.4),
        
        p(tags$b("4. 检验2的 binormal 参数 b (b2)")),
        numericInput(ns("b2"), "b2:", value = 0.4),
        
        p(tags$b("5. 患者有病时的相关性 (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.6),
        
        p(tags$b("6. 患者无病时的相关性 (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.4),
        
        p(tags$b("7. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("8. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("9. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("10. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_AUC_binormal"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (AUC, Binormal)"),
        verbatimTextOutput(ns("output_non_inferiority_AUC_binormal"))
      )
    )
  )
}
mod_ui_11_non_inferiority_AUC_any <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (AUC, 任意分布)")),
        
        p(tags$b("1. 检验1的 AUC (theta1)")),
        numericInput(ns("theta1"), "theta1:", value = 0.8),
        
        p(tags$b("2. 检验2的 AUC (theta2)")),
        numericInput(ns("theta2"), "theta2:", value = 0.7),
        
        p(tags$b("3. 检验间的相关性 (r)")),
        numericInput(ns("r"), "r:", value = 0.5),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_AUC_any"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (AUC, 任意分布)"),
        verbatimTextOutput(ns("output_non_inferiority_AUC_any"))
      )
    )
  )
}
mod_ui_11_non_inferiority_fixedFPR <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (固定假阳性率下的敏感性)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a (a1)")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b (b1)")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a (a2)")),
        numericInput(ns("a2"), "a2:", value = 0.4),
        
        p(tags$b("4. 检验2的 binormal 参数 b (b2)")),
        numericInput(ns("b2"), "b2:", value = 0.4),
        
        p(tags$b("5. 患者间相关性 (有病) (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.6),
        
        p(tags$b("6. 患者间相关性 (无病) (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.6),
        
        p(tags$b("7. 固定假阳性率 (e)")),
        numericInput(ns("e"), "e:", value = 0.05),
        
        p(tags$b("8. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("9. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("10. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("11. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_fixedFPR"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (固定假阳性率下的敏感性)"),
        verbatimTextOutput(ns("output_non_inferiority_fixedFPR"))
      )
    )
  )
}
mod_ui_11_non_inferiority_partialAUC <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (部分AUC)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a (a1)")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b (b1)")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a (a2)")),
        numericInput(ns("a2"), "a2:", value = 0.4),
        
        p(tags$b("4. 检验2的 binormal 参数 b (b2)")),
        numericInput(ns("b2"), "b2:", value = 0.4),
        
        p(tags$b("5. 患者间相关性 (有病) (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.6),
        
        p(tags$b("6. 患者间相关性 (无病) (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.6),
        
        p(tags$b("7. 部分AUC的下界 (e1)")),
        numericInput(ns("e1"), "e1:", value = 0.1),
        
        p(tags$b("8. 部分AUC的上界 (e2)")),
        numericInput(ns("e2"), "e2:", value = 0.9),
        
        p(tags$b("9. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("10. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("11. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("12. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_partialAUC"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (部分AUC)"),
        verbatimTextOutput(ns("output_non_inferiority_partialAUC"))
      )
    )
  )
}
mod_ui_11_equivalency_Se <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (敏感性)")),
        
        p(tags$b("1. 检验1的敏感性 (Se1)")),
        numericInput(ns("Se1"), "Se1:", value = 0.8),
        
        p(tags$b("2. 检验2的敏感性 (Se2)")),
        numericInput(ns("Se2"), "Se2:", value = 0.7),
        
        p(tags$b("3. P(T1=1|T2=1) (p)")),
        numericInput(ns("p"), "p:", value = 0.9),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_Se"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (敏感性)"),
        verbatimTextOutput(ns("output_equivalency_Se"))
      )
    )
  )
}
mod_ui_11_equivalency_Sp <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (特异性)")),
        
        p(tags$b("1. 检验1的特异性 (Sp1)")),
        numericInput(ns("Sp1"), "Sp1:", value = 0.8),
        
        p(tags$b("2. 检验2的特异性 (Sp2)")),
        numericInput(ns("Sp2"), "Sp2:", value = 0.7),
        
        p(tags$b("3. P(T1=1|T2=1) (p)")),
        numericInput(ns("p"), "p:", value = 0.9),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_Sp"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (特异性)"),
        verbatimTextOutput(ns("output_equivalency_Sp"))
      )
    )
  )
}
mod_ui_11_equivalency_AUC_binormal <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (AUC, binormal)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a (a1)")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b (b1)")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a (a2)")),
        numericInput(ns("a2"), "a2:", value = 0.5),
        
        p(tags$b("4. 检验2的 binormal 参数 b (b2)")),
        numericInput(ns("b2"), "b2:", value = 0.5),
        
        p(tags$b("5. 患有疾病患者的相关性 (rD)")),
        numericInput(ns("rD"), "rD:", value = 0.5),
        
        p(tags$b("6. 未患疾病患者的相关性 (rN)")),
        numericInput(ns("rN"), "rN:", value = 0.5),
        
        p(tags$b("7. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("8. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("9. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("10. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_AUC_binormal"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (AUC, binormal)"),
        verbatimTextOutput(ns("output_equivalency_AUC_binormal"))
      )
    )
  )
}
mod_ui_11_equivalency_AUC_any <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (AUC, any distribution)")),
        
        p(tags$b("1. 检验1的 AUC (theta1)")),
        numericInput(ns("theta1"), "theta1:", value = 0.8),
        
        p(tags$b("2. 检验2的 AUC (theta2)")),
        numericInput(ns("theta2"), "theta2:", value = 0.7),
        
        p(tags$b("3. 检验之间的相关性 (r)")),
        numericInput(ns("r"), "r:", value = 0.5),
        
        p(tags$b("4. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("7. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_AUC_any"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (AUC, any distribution)"),
        verbatimTextOutput(ns("output_equivalency_AUC_any"))
      )
    )
  )
}
mod_ui_11_equivalency_fixedFPR <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (敏感性在固定FPR下)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a1")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b1")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a2")),
        numericInput(ns("a2"), "a2:", value = 0.5),
        
        p(tags$b("4. 检验2的 binormal 参数 b2")),
        numericInput(ns("b2"), "b2:", value = 0.5),
        
        p(tags$b("5. 条件患者的相关性 rD")),
        numericInput(ns("rD"), "rD:", value = 0.5),
        
        p(tags$b("6. 非条件患者的相关性 rN")),
        numericInput(ns("rN"), "rN:", value = 0.5),
        
        p(tags$b("7. 固定的假阳性率 (FPR) e")),
        numericInput(ns("e"), "e:", value = 0.05),
        
        p(tags$b("8. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("9. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("10. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("11. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_fixedFPR"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (敏感性在固定FPR下)"),
        verbatimTextOutput(ns("output_equivalency_fixedFPR"))
      )
    )
  )
}
mod_ui_11_equivalency_partialAUC <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 等效性测试 (部分AUC)")),
        
        p(tags$b("1. 检验1的 binormal 参数 a1")),
        numericInput(ns("a1"), "a1:", value = 0.5),
        
        p(tags$b("2. 检验1的 binormal 参数 b1")),
        numericInput(ns("b1"), "b1:", value = 0.5),
        
        p(tags$b("3. 检验2的 binormal 参数 a2")),
        numericInput(ns("a2"), "a2:", value = 0.5),
        
        p(tags$b("4. 检验2的 binormal 参数 b2")),
        numericInput(ns("b2"), "b2:", value = 0.5),
        
        p(tags$b("5. 条件患者的相关性 rD")),
        numericInput(ns("rD"), "rD:", value = 0.5),
        
        p(tags$b("6. 非条件患者的相关性 rN")),
        numericInput(ns("rN"), "rN:", value = 0.5),
        
        p(tags$b("7. 部分面积的下界 e1")),
        numericInput(ns("e1"), "e1:", value = 0.1),
        
        p(tags$b("8. 部分面积的上界 e2")),
        numericInput(ns("e2"), "e2:", value = 0.9),
        
        p(tags$b("9. 最小可接受差异 (Delta)")),
        numericInput(ns("Delta"), "Delta:", value = 0.05),
        
        p(tags$b("10. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("11. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        p(tags$b("12. 无疾病与有疾病患者的比率 (R)")),
        numericInput(ns("R"), "R:", value = 1),
        
        actionButton(ns("submit_equivalency_partialAUC"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 等效性测试 (部分AUC)"),
        verbatimTextOutput(ns("output_equivalency_partialAUC"))
      )
    )
  )
}
mod_ui_11_non_inferiority_rTPR <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (rTPR)")),
        
        p(tags$b("1. 检验2的敏感性 (TPR2)")),
        numericInput(ns("TPR2"), "TPR2:", value = 0.8),
        
        p(tags$b("2. 两个测试均为阳性的概率 (TPPR)")),
        numericInput(ns("TPPR"), "TPPR:", value = 0.7),
        
        p(tags$b("3. rTPR 在备择假设下的特定值 (gamma)")),
        numericInput(ns("gamma"), "gamma:", value = 1.2),
        
        p(tags$b("4. rTPR 的无效假设值 (delta1)")),
        numericInput(ns("delta1"), "delta1:", value = 1.0),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        actionButton(ns("submit_non_inferiority_rTPR"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (rTPR)"),
        verbatimTextOutput(ns("output_non_inferiority_rTPR"))
      )
    )
  )
}
mod_ui_11_non_inferiority_rFPR <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (rFPR)")),
        
        p(tags$b("1. 检验2的假阳性率 (FPR2)")),
        numericInput(ns("FPR2"), "FPR2:", value = 0.1),
        
        p(tags$b("2. 两个测试均为阳性的概率 (FPPR)")),
        numericInput(ns("FPPR"), "FPPR:", value = 0.05),
        
        p(tags$b("3. rFPR 在备择假设下的特定值 (gamma)")),
        numericInput(ns("gamma"), "gamma:", value = 1.2),
        
        p(tags$b("4. rFPR 的无效假设值 (delta2)")),
        numericInput(ns("delta2"), "delta2:", value = 1.0),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        actionButton(ns("submit_non_inferiority_rFPR"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (rFPR)"),
        verbatimTextOutput(ns("output_non_inferiority_rFPR"))
      )
    )
  )
}
mod_ui_11_non_inferiority_PPV <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (PPV)")),
        
        p(tags$b("1. 检验2的阳性预测值 (PPV2)")),
        numericInput(ns("PPV2"), "PPV2:", value = 0.85),
        
        p(tags$b("2. 患者测试结果的比例 (p)")),
        numericInput(ns("p1"), "p1 (两个测试均为阳性 - 无病患者):", value = 0.1),
        numericInput(ns("p2"), "p2 (检验1阳性且检验2阴性 - 无病患者):", value = 0.05),
        numericInput(ns("p3"), "p3 (检验2阳性且检验1阴性 - 无病患者):", value = 0.05),
        numericInput(ns("p4"), "p4 (两个测试均为阴性 - 无病患者):", value = 0.8),
        numericInput(ns("p5"), "p5 (两个测试均为阳性 - 有病患者):", value = 0.7),
        numericInput(ns("p6"), "p6 (检验1阳性且检验2阴性 - 有病患者):", value = 0.1),
        numericInput(ns("p7"), "p7 (检验2阳性且检验1阴性 - 有病患者):", value = 0.1),
        numericInput(ns("p8"), "p8 (两个测试均为阴性 - 有病患者):", value = 0.1),
        
        p(tags$b("3. rPPV 在备择假设下的特定值 (gamma)")),
        numericInput(ns("gamma"), "gamma:", value = 1.2),
        
        p(tags$b("4. rPPV 的无效假设值 (delta)")),
        numericInput(ns("delta"), "delta:", value = 1.0),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        actionButton(ns("submit_non_inferiority_PPV"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (PPV)"),
        verbatimTextOutput(ns("output_non_inferiority_PPV"))
      )
    )
  )
}
mod_ui_11_non_inferiority_NPV <- function(id) {
  ns <- NS(id)
  tagList(
    sidebarLayout(
      sidebarPanel(
        h4(tags$b("参数输入 - 非劣性测试 (NPV)")),
        
        p(tags$b("1. 检验2的阴性预测值 (NPV2)")),
        numericInput(ns("NPV2"), "NPV2:", value = 0.85),
        
        p(tags$b("2. 患者测试结果的比例 (p)")),
        numericInput(ns("p1"), "p1 (两个测试均为阳性 - 无病患者):", value = 0.1),
        numericInput(ns("p2"), "p2 (检验1阳性且检验2阴性 - 无病患者):", value = 0.05),
        numericInput(ns("p3"), "p3 (检验2阳性且检验1阴性 - 无病患者):", value = 0.05),
        numericInput(ns("p4"), "p4 (两个测试均为阴性 - 无病患者):", value = 0.8),
        numericInput(ns("p5"), "p5 (两个测试均为阳性 - 有病患者):", value = 0.7),
        numericInput(ns("p6"), "p6 (检验1阳性且检验2阴性 - 有病患者):", value = 0.1),
        numericInput(ns("p7"), "p7 (检验2阳性且检验1阴性 - 有病患者):", value = 0.1),
        numericInput(ns("p8"), "p8 (两个测试均为阴性 - 有病患者):", value = 0.1),
        
        p(tags$b("3. rNPV 在备择假设下的特定值 (gamma)")),
        numericInput(ns("gamma"), "gamma:", value = 1.2),
        
        p(tags$b("4. rNPV 的无效假设值 (delta)")),
        numericInput(ns("delta"), "delta:", value = 1.0),
        
        p(tags$b("5. 显著性水平 (alpha)")),
        numericInput(ns("alpha"), "alpha:", value = 0.05),
        
        p(tags$b("6. 第二类错误率 (beta)")),
        numericInput(ns("beta"), "beta:", value = 0.2),
        
        actionButton(ns("submit_non_inferiority_NPV"), "计算")
      ),
      
      mainPanel(
        h4("结果 - 非劣性测试 (NPV)"),
        verbatimTextOutput(ns("output_non_inferiority_NPV"))
      )
    )
  )
}
