mod_server_4 <- function(id) {
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
        LRratio(data, alpha = as.numeric(input$alpha))
      }, error = function(e) {
        showNotification(paste("Error in LRratio calculation:", e$message))
        NULL
      })
      
      print("Result from LRratio:")  # 调试信息
      print(result)
      
      result  # 确保结果在这个反应式中被返回
    })
    
    output$estimate <- renderText({
      result <- Y()
      req(result)
      paste("正性似然比:", round(result$Estimate1[1], 4), 
            "负性似然比:", round(result$Estimate1[2], 4))
    })
    
    output$positive_lr_intervals <- renderTable({
      result <- Y()
      req(result)
      # 由于 Interval1 是2行1列的矩阵，需要保持其为2行1列格式
      positive_lr_intervals <- t(result$Interval1)
    }, rownames = TRUE, digits = 6)
    
    output$negative_lr_intervals <- renderTable({
      result <- Y()
      req(result)
      # 由于 Interval2 是2行1列的矩阵，需要保持其为2行1列格式
      negative_lr_intervals <- t(result$Interval2)
    }, rownames = TRUE, digits = 6)
    
  })
}
