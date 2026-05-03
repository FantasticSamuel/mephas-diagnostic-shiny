# 敏感性检验模块
mod_server_13_MRMC_nopilot_Se <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit_Se, {
      MRMC_nopilot_Se(
        input$Se, input$delta, input$var_b, input$var_w, 
        input$rho_1, input$rho_2, input$rho_3, input$rho_b, 
        input$J, input$n, input$Q, input$alpha
      )
    })
    
    output$power_Se <- renderText({
      res <- result()
      paste("敏感性检验的统计功效:", round(res, 4))
    })
  })
}

# AUC 检验模块
mod_server_13_MRMC_nopilot_AUC <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit_AUC, {
      MRMC_nopilot_AUC(
        input$A, input$delta, input$var_b, input$var_w, 
        input$rho_1, input$rho_2, input$rho_3, input$rho_b, 
        input$J, input$n, input$Q, input$R, input$alpha
      )
    })
    
    output$power_AUC <- renderText({
      res <- result()
      paste("AUC 检验的统计功效:", round(res, 4))
    })
  })
}

# 固定假阳性率下的敏感性检验模块
mod_server_13_MRMC_nopilot_fixedFPR <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit_fixedFPR, {
      MRMC_nopilot_fixedFPR(
        input$a, input$b, input$e, input$delta, input$var_b, 
        input$var_w, input$rho_1, input$rho_2, input$rho_3, 
        input$rho_b, input$J, input$n, input$Q, input$R, input$alpha
      )
    })
    output$power_fixedFPR <- renderPrint({
      res <- result()
      paste("固定假阳性率下的敏感性检验的统计功效:", round(res, 4))
    })
  })
}

# 部分AUC检验模块
mod_server_13_MRMC_nopilot_partialAUC <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit_partialAUC, {
      MRMC_nopilot_partialAUC(
        input$a, input$b, input$e1, input$e2, input$delta, 
        input$var_b, input$var_w, input$rho_1, input$rho_2, 
        input$rho_3, input$rho_b, input$J, input$n, input$Q, 
        input$R, input$alpha
      )
    })
    
    output$power_partialAUC <- renderText({
      res <- result()
      paste("部分AUC检验的统计功效:", round(res, 4))
    })
  })
}
