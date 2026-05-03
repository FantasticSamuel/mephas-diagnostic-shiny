mod_server_9 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      # 解析用户输入的数据
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(all(!is.na(data0)) && all(!is.na(data1)), "请检查输入的数据"),
        need(length(data0) > 1 && length(data1) > 1, "每组数据至少需要两个类别"),
        need(input$p < input$s, "p 必须小于 s")
      )
      
      print("Input data (nondiseased):")  # 调试信息
      print(data0)
      print("Input data (diseased):")  # 调试信息
      print(data1)
      
      result <- tryCatch({
        roc.nonparametric(data0, data1, p = input$p, s = input$s)
      }, error = function(e) {
        showNotification(paste("Error in roc.nonparametric calculation:", e$message))
        NULL
      })
      
      print("Result from roc.nonparametric:")  # 调试信息
      print(result)
      
      result  # 返回结果
    })
    
    output$summary <- renderText({
      res <- Y()
      req(res)
      paste("未患病群体: ", input$data0, "\n",
            "患病群体: ", input$data1, "\n",
            "部分面积的计算区间: ", input$p, "-", input$s)
    })
    
    output$roc_results <- renderTable({
      res <- Y()
      req(res)
      data.frame(
        "MW 估计" = round(res$AMW, 4),
        "Delong 估计" = round(res$ADL, 4),
        "MW 估计的方差" = round(res$AMW.var, 6),
        "Delong 估计的方差" = round(res$ADL.var, 6),
        "部分面积" = round(res$partialarea, 4)
      )
    }, rownames = FALSE, digits = 6)
  })
}
