mod_server_13 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值")
      )
      
      transformed_result <- roc.transformed(data0, data1)
      plot_biweight <- function() roc.biweight(data0, data1)
      plot_gaussian <- function() roc.gaussian(data0, data1)
      plot_zhou <- function() roc_Zhou_Harezlar(data0, data1)
      
      list(
        lambda = transformed_result$lambda,
        biweight_plot = plot_biweight,
        gaussian_plot = plot_gaussian,
        zhou_plot = plot_zhou
      )
    })
    
    output$lambda_estimate <- renderText({
      result <- Y()
      req(result)
      paste("Box-Cox 变换的最优参数 λ:", round(result$lambda, 4))
    })
    
    output$biweight_plot <- renderPlot({
      result <- Y()
      req(result)
      result$biweight_plot()  # 绘制Biweight Kernel ROC曲线
    })
    
    output$gaussian_plot <- renderPlot({
      result <- Y()
      req(result)
      result$gaussian_plot()  # 绘制Gaussian Kernel ROC曲线
    })
    
    output$zhou_plot <- renderPlot({
      result <- Y()
      req(result)
      result$zhou_plot()  # 绘制Zhou's Bandwidth ROC曲线
    })
  })
}
