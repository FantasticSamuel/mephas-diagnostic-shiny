mod_server_14 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值"),
        need(all(data0 > 0) && all(data1 > 0), "所有测试结果应为正数")
      )
      
      result <- roc.continuous.smooth(data0, data1)
      result  # 返回计算结果和绘图结果
    })
    
    output$roc_plot <- renderPlot({
      result <- Y()
      req(result)
      result$plot_result  # 绘制ROC曲线
    })
    
    output$estimate <- renderText({
      result <- Y()  # 从反应式中获取结果
      req(result)
      paste(
        "Box-Cox 变换的最优参数：", round(result$lambda, 4), "\n",
        "参数 a：", round(result$a, 4), "\n",
        "参数 b：", round(result$b, 4), "\n",
        "AUC 面积：", round(result$area.full, 4), "\n",
        "协方差矩阵：\n", paste(apply(result$cov_matrix, 1, paste, collapse = "\t"), collapse = "\n")
      )
    })
  })
}
