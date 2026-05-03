mod_server_18 <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      m <- input$m_value
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值"),
        need(m > 0, "m值必须为正数")
      )
      
      result <- switch(input$method,
                       "gaussian" = roc.gaussian_optimal(data0, data1, m),
                       "binormality" = roc.binormality_optimal(data0, data1, m),
                       "biweight" = roc.biweight_optimal(data0, data1, m)
      )
      
      return(result)
    })
    
    output$optimal_point <- renderPrint({
      result <- Y() 
      req(result)
      
      if (input$method == "binormality") {
        cat("最佳决策点 (双正态假设):\n")
        cat("最优FPR:", round(result$binormality[1], 6), "\n")
        cat("最优TPR:", round(result$binormality[2], 6), "\n")
        cat("决策阈值:", round(result$threshold, 6), "\n")
      } else {
        cat("最佳决策点:\n")
        cat("最优FPR:", round(result[1], 6), "\n")
        cat("最优TPR:", round(result[2], 6), "\n")
      }
    })
  })
}
