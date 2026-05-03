mod_server_11 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值"),
        need(length(data0) == length(data1), "两个数据集必须具有相同的长度")
      )
      
      if (input$method == "Bigamma") {
        params <- tryCatch({
          params_estimate_bigamma(data0, data1)
        }, error = function(e) {
          showNotification(paste("Error in params_estimate_bigamma calculation:", e$message))
          NULL
        })
        print(params)
        if (!is.null(params)) {
          plot_result <- roc.bigamma(data0, data1)
        }
      } else if (input$method == "Logistic") {
        params <- tryCatch({
          params_estimate_logistic(data0, data1)
        }, error = function(e) {
          showNotification(paste("Error in params_estimate_logistic calculation:", e$message))
          NULL
        })
        if (!is.null(params)) {
          plot_result <- roc.logistic(data0, data1)
        }
      }
      
      list(params = params, plot_result = plot_result)  # 返回估计值和绘图结果
    })
    
    output$roc_plot <- renderPlot({
      result <- Y()
      req(result)
      result$plot_result  # 绘制ROC曲线
    })
    
    output$estimate <- renderText({
      result <- Y()  # 从反应式中获取结果
      req(result)
      paste("estimation of all thresholds\n", paste(result$params[1:(length(result$params)-4)], collapse = ", "),"\n the bigamma parameters for nondiseased subjects：\n", "alpha:",result$params[length(result$params)-3],"\n","sigma:",result$params[length(result$params)-2],"\n","the bigamma parameters for diseased subjects:\n","alpha:",result$params[length(result$params)-1],"\n","sigma:",result$params[length(result$params)],"\nROC曲线已绘制，请查看输出区域中的图形")
    })

  })
}
