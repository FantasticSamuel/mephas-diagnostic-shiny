mod_server_12 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)), "数据中不能包含NA值")
      )
      
      list(data0 = data0, data1 = data1)  # 返回数据
    })
    
    output$roc_plot <- renderPlot({
      data <- Y()  # 获取数据
      req(data)
      roc.continuous.emp(data$data0, data$data1)  # 绘制ROC曲线
    })
  })
}
