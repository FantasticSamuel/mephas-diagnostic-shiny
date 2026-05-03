mod_server_8 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      # 解析用户输入的数据
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(all(!is.na(data0)) && all(!is.na(data1)), "请检查输入的数据"),
        need(length(data0) > 1 && length(data1) > 1, "每组数据至少需要两个类别"),
        need(input$e1 < input$e2, "e1必须小于e2")
      )
      

      result <- tryCatch({
        CI_estimation_ordinal(data0, data1, e1 = input$e1, e2 = input$e2, alpha = input$alpha)
      }, error = function(e) {
        showNotification(paste("Error in CI_estimation_ordinal calculation:", e$message))
        NULL
      })
      result1 <- tryCatch({
        roc.CI.ordinal(data0, data1, e1 = input$e1, e2 = input$e2)
      }, error = function(e) {
        showNotification(paste("Error in roc.CI.ordinal:", e$message))
        NULL
      })      
      

      
      c(result,result1)  # 返回结果
    })
    
    output$summary <- renderText({
      result <- Y()
      req(result)
      paste("显著性水平:", input$alpha, "\n",
            "FPR 范围: ", input$e1, "-", input$e2, "\n",
            "全面积及其方差: ", 
            round(result$area.full, 4), "\n"," var:", round(result$var_full, 4), "\n",
            "部分面积及其方差: ", 
            round(result$area.partial, 4), "\n"," var:", round(result$var_partial, 4))
    })
    
    output$ci_full <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "Lower CI (Wald)" = result$CI_full[1],
        "Upper CI (Wald)" = result$CI_full[2],
        "Lower CI (Logit)" = result$CI_full_logit[1],
        "Upper CI (Logit)" = result$CI_full_logit[2]
      )
    }, rownames = FALSE, digits = 6)
    
    output$ci_partial <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "Lower CI (Wald)" = result$CI_partial[1],
        "Upper CI (Wald)" = result$CI_partial[2],
        "Lower CI (Logit)" = result$CI_partial_logit[1],
        "Upper CI (Logit)" = result$CI_partial_logit[2],
        "Lower CI (McClish)" = result$CI_partial_McClish[1],
        "Upper CI (McClish)" = result$CI_partial_McClish[2]
      )
    }, rownames = FALSE, digits = 6)
    
  })
}
