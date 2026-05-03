mod_server_17 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      SP <- as.numeric(input$SP)
      alpha <- as.numeric(input$alpha)
      
      validate(
        need(length(data0) > 0 && length(data1) > 0, "请检查输入的数据，确保不为空且为有效的数值"),
        need(all(!is.na(data0)) && all(!is.na(data1)) && !is.na(SP) && !is.na(alpha), "数据中不能包含NA值"),
        need(SP > 0 && SP < 1, "请输入有效的特异度 (0 < SP < 1)")
      )
      
      result <- SDT(data0, data1, SP, alpha)
      return(result)  # 返回计算结果
    })
    
    output$estimate <- renderPrint({
      result <- Y()  # 从反应式中获取结果
      req(result)
      
      # 直接输出结果，确保 result 是正确的
      print(result)
    })
  })
}
