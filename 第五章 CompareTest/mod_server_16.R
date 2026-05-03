mod_server_16 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      e1 <- as.numeric(input$e1)
      e2 <- as.numeric(input$e2)
      alpha <- as.numeric(input$alpha)
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)) && !is.na(e1) && !is.na(e2) && !is.na(alpha), "数据中不能包含NA值"),
        need(e1 >= 0 && e2 > e1 && e2 <= 1, "请输入有效的FPR范围（0 <= e1 < e2 <= 1）")
      )
      
      # 选择不同的计算方法
      result <- switch(input$method,
                       "nonparametric" = roc.area.nonparametric(data0, data1, e1, e2),
                       "binormal" = roc.var.continuous(data0, data1, e1, e2),
                       "confidence_intervals" = CI_estimation_continuous(data0, data1, e1, e2, alpha)
      )
      
      result  # 返回计算结果
    })
    
    output$estimate <- renderPrint({
      result <- Y()  # 从反应式中获取结果
      req(result)
      
      # 手动格式化输出
      if (input$method == "nonparametric") {
        cat("AUC:", result$full_area, "\n")
        cat("Partial AUC (Dodd's method):", result$partial_area_Dodd, "\n")
        cat("Partial AUC (He's method):", result$partial_area_He, "\n")
        cat("Variance of Partial AUC (He's method):", result$var_partial_area, "\n")
      } else if (input$method == "binormal") {
        cat("AUC:", result$area.full, "\n")
        cat("Variance of AUC:", result$var_full, "\n")
        cat("Partial AUC:", result$area.partial, "\n")
        cat("Variance of Partial AUC:", result$var_partial, "\n")
      } else if (input$method == "confidence_intervals") {
        cat("AUC Confidence Interval (Wald's interval): [", result$CI_full[1], ", ", result$CI_full[2], "]\n")
        cat("AUC Confidence Interval (Logit transformation): [", result$CI_full_logit[1], ", ", result$CI_full_logit[2], "]\n")
        cat("Partial AUC Confidence Interval (Wald's interval): [", result$CI_partial[1], ", ", result$CI_partial[2], "]\n")
        cat("Partial AUC Confidence Interval (Logit transformation): [", result$CI_partial_logit[1], ", ", result$CI_partial_logit[2], "]\n")
        cat("Partial AUC Confidence Interval (McClish transformation): [", result$CI_partial_McClish[1], ", ", result$CI_partial_McClish[2], "]\n")
      }
    })
  })
}
