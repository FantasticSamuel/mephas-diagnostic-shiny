mod_server_6 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      # 解析用户输入的两行矩阵
      row1 <- as.numeric(unlist(strsplit(input$row1, ",")))
      row2 <- as.numeric(unlist(strsplit(input$row2, ",")))
      data <- matrix(c(row1, row2), nrow = 2, byrow = TRUE)
      
      validate(
        need(all(!is.na(data)), "请检查输入的数据和参数"),
        need(nrow(data) == 2, "输入的数据必须是2行"),
        need(sum(data) != 0, "矩阵不能全为零")
      )
      
      print("Input data:")  # 调试信息
      print(data)
      
      result <- tryCatch({
        roc.ordinal.emp(data, alpha = as.numeric(input$alpha))
      }, error = function(e) {
        showNotification(paste("Error in roc.ordinal.emp calculation:", e$message))
        NULL
      })
      
      print("Result from roc.ordinal.emp:")  # 调试信息
      print(result)
      
      result  # 返回结果
    })
    
    output$roc_plot <- renderPlot({
      Y()  # 确保反应式被触发
    })
    
    output$auc <- renderText({
      result <- Y()
      req(result)
      paste("AUC:", round(result$AUC, 4))
    })
    
    output$auc_variance <- renderTable({
      result <- Y()
      req(result)
      result$AUC_VAR
    }, rownames = TRUE, digits = 6)
    
    output$auc_ci <- renderTable({
      result <- Y()
      req(result)
      result$AUC_CI
    }, rownames = TRUE, digits = 6)
    
  })
}
