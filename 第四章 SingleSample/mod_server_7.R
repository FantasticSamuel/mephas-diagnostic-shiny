mod_server_7 <- function(id) {
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
      
      print("Input data (nondiseased):")  # 调试信息
      print(data0)
      print("Input data (diseased):")  # 调试信息
      print(data1)
      
      result <- tryCatch({
        roc.ordinal.smooth(data0, data1, alpha = input$alpha, FPR = input$FPR, e1 = input$e1, e2 = input$e2)
      }, error = function(e) {
        showNotification(paste("Error in roc.ordinal.smooth calculation:", e$message))
        NULL
      })
      
      print("Result from roc.ordinal.smooth:")  # 调试信息
      print(result)
      
      result  # 返回结果
    })
    
    output$roc_plot <- renderPlot({
      Y()  # 绘制ROC曲线
    })
    
    output$summary <- renderText({
      result <- Y()
      req(result)
      paste0("Goodness-of-Fit 统计量: ", round(result$goodness_statistic, 4), "\n",
             "Binormal 模型是否通过: ", ifelse(result$binormal_indicator == 1, "是", "否"), "\n",
             "Zhou 统计量: ", round(result$zhou_statistic, 4), "\n",
             "阈值检验是否通过: ", ifelse(result$threshold_indicator == 1, "是", "否"))
    })
    
    output$thresholds <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "Decision Thresholds" = result$thresholds
      )
    }, rownames = TRUE, digits = 6)
    
    output$tpr_ci <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "TPR" = result$TPR,
        "Lower CI" = result$TPR_CI[1],
        "Upper CI" = result$TPR_CI[2]
      )
    }, rownames = FALSE, digits = 6)
    
    output$areas <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "Full Area" = result$area.full,
        "Partial Area" = result$area.partial,
        "Var Full Area" = result$var_full,
        "Var Partial Area" = result$var_partial
      )
    }, rownames = FALSE, digits = 6)
    
    output$transformed_area <- renderTable({
      result <- Y()
      req(result)
      data.frame(
        "Transformed Partial Area" = result$partial_transformed,
        "Var Transformed Partial Area" = result$var_transformed
      )
    }, rownames = FALSE, digits = 6)
    
  })
}
