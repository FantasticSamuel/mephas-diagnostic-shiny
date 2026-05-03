mod_server_2 <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data <- matrix(c(as.numeric(input$val1), as.numeric(input$val2), 
                       as.numeric(input$val3), as.numeric(input$val4)), nrow = 2, byrow = TRUE)
      
      validate(
        need(all(!is.na(data)), "请检查输入的数据和参数"),
        need(is.numeric(data), "输入的数据必须是数值"),
        need(sum(data) != 0, "矩阵不能全为零"),
        need(dim(data)[1] == 2 && dim(data)[2] == 2, "数据必须是2x2的矩阵")
      )
      
      print("Input data:")  # 调试信息
      print(data)
      
      result <- tryCatch({
        roc.ppvnpv(data, alpha = as.numeric(input$alpha), x = as.numeric(input$x), n = as.numeric(input$n))
      })
      
      print("Result from roc.ppvnpv:")  # 调试信息
      print(result)
      
      result  # 确保结果在这个反应式中被返回
    })
    
    output$estimate <- renderText({
      result <- Y()  # 从反应式中获取结果
      req(result)
      paste("PPV:", round(result$Estimate[1], 4), " NPV:", round(result$Estimate[2], 4))
    })
    
    output$ppv_intervals <- renderTable({
      result <- Y()
      req(result)
      
      # 将结果转换为2列矩阵，并设置行名和列名
      ppv_intervals <- matrix(c(result$PPV.interval1, result$PPV.interval2, result$PPV.interval3), 
                              ncol = 2, byrow = TRUE,
                              dimnames = list(c("logit transformation of the Bayes formula", "delta", "objective Bayesian method"),  # 行名
                                              c("Lower Bound", "Upper Bound")))  # 列名
      ppv_intervals
    }, rownames = TRUE, digits = 6)
    
    output$npv_intervals <- renderTable({
      result <- Y()
      req(result)
      
      # 将结果转换为2列矩阵，并设置行名和列名
      npv_intervals <- matrix(c(result$NPV.interval1, result$NPV.interval2, result$NPV.interval3), 
                              ncol = 2, byrow = TRUE,
                              dimnames = list(c("logit transformation of the Bayes formula", "delta", "objective Bayesian method"),  # 行名
                                              c("Lower Bound", "Upper Bound")))  # 列名
      npv_intervals
    }, rownames = TRUE, digits = 6)
    
    
  })
}
