mod_server_1 <- function(id) {
  moduleServer(id, function(input, output, session) {
Y <- eventReactive(input$submit, {
  # 初始化数据为一个有效的默认矩阵
  data <- matrix(c(as.numeric(input$val1), as.numeric(input$val2), 
                   as.numeric(input$val3), as.numeric(input$val4)), nrow = 2, byrow = TRUE)
  alpha<-input$alpha
  # 打印调试信息，查看数据格式
  print("Data matrix:")
  print(data)
  
  # 验证数据是否为有效的数值
  validate(
    need(all(!is.na(data)), "请检查输入的数据和参数"),
    need(is.numeric(data), "输入的数据必须是数值"),
    need(sum(data) != 0, "矩阵不能全为零"),
    need(dim(data)[1] == 2 && dim(data)[2] == 2, "数据必须是2x2的矩阵")
  )
  
  # 调用SINGLESAMPLE包中的roc.binary函数
  result <- tryCatch({
    roc.binary(data, alpha = alpha)
  }, error = function(e) {
    showNotification(paste("Error in roc.binary calculation:", e$message))
    return(NULL)
  })
  
  if (is.null(result)) {
    return(list(se = NA, sp = NA, se_var = NA, sp_var = NA, intervals = NA))
  }
  
  list(se = result$Estimate[1],
       sp = result$Estimate[2],
       se_var = result$Variance[1],
       sp_var = result$Variance[2],
       intervals = result$Interval)
})

# 输出结果到UI
output$sensitivity <- renderText({
  req(Y())
  if (is.na(Y()$se)) {
    return("Calculation error: Sensitivity is NA")
  }
  paste("Sensitivity (se):", round(Y()$se, 4))
})

output$specificity <- renderText({
  req(Y())
  if (is.na(Y()$sp)) {
    return("Calculation error: Specificity is NA")
  }
  paste("Specificity (sp):", round(Y()$sp, 4))
})

output$se_variance <- renderText({
  req(Y())
  if (is.na(Y()$se_var)) {
    return("Calculation error: Sensitivity Variance is NA")
  }
  paste("Sensitivity Variance:", round(Y()$se_var, 6))
})

output$sp_variance <- renderText({
  req(Y())
  if (is.na(Y()$sp_var)) {
    return("Calculation error: Specificity Variance is NA")
  }
  paste("Specificity Variance:", round(Y()$sp_var, 6))
})

output$intervals <- renderTable({
  result <- Y()
  req(result)
  
  # 假设 result$intervals 是一个数据框或矩阵
  intervals <- result$intervals
},rownames = TRUE, digits = 6)
  })
}
