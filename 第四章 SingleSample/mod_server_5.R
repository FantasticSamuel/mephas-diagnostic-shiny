mod_server_5 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      # 获取用户输入的矩阵数据
      data <- matrix(c(as.numeric(input$val1), 
                       as.numeric(input$val2), 
                       as.numeric(input$val3), 
                       as.numeric(input$val4)), nrow = 2, byrow = TRUE)
      
      validate(
        need(all(!is.na(data)), "请检查输入的数据和参数"),
        need(is.numeric(data), "输入的数据必须是数值"),
        need(sum(data) != 0, "矩阵不能全为零"),
        need(dim(data)[1] == 2 && dim(data)[2] == 2, "输入的数据必须是2x2的矩阵")
      )
      
      print("Input data:")  # 调试信息
      print(data)
      
      result <- tryCatch({
        Oddsratio(data, alpha = as.numeric(input$alpha))
      }, error = function(e) {
        showNotification(paste("Error in Oddsratio calculation:", e$message))
        NULL
      })
      
      print("Result from Oddsratio:")  # 调试信息
      print(result)
      
      result  # 返回结果
    })
    
    output$odds_ratio <- renderText({
      result <- Y()
      req(result)
      paste("优势比:", round(result$OddsRatio, 4))
    })
    
    output$odds_ratio_intervals <- renderTable({
      result <- Y()
      req(result)
      # 返回置信区间作为表格显示
      result$interval
    }, rownames = TRUE, digits = 6)
    
  })
}

