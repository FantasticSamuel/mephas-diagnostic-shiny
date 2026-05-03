mod_server_15 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值")
      )
      
      result <- tryCatch({
        roc.semiparametric(data0, data1)
      }, error = function(e) {
        showNotification(paste("Error in ROC calculation:", e$message))
        NULL
      })
      list(
        plot_result = result,  # 绘图结果
        params = result
      )
    })
    
    output$roc_plot <- renderPlot({
      result <- Y()
      req(result)
      result$plot_result  # 绘制ROC曲线
    })

  })
}
