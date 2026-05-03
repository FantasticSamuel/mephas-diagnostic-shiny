mod_server_11 <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$result <- renderPrint({
      req(input$submit)
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      
      alpha <- input$alpha
      
      # 调用 component 函数并输出测试1和测试2的 AUC 和方差估计
      component_data1 <- component(data1_no, data1_yes)
      component_data2 <- component(data2_no, data2_yes)
      
      cat("测试1的 AUC 估计值和方差估计:\n")
      cat("AUC:", component_data1$ADL, "\n")
      cat("方差估计:", component_data1$ADL.var, "\n\n")
      
      cat("测试2的 AUC 估计值和方差估计:\n")
      cat("AUC:", component_data2$ADL, "\n")
      cat("方差估计:", component_data2$ADL.var, "\n\n")
      
      # 调用 roc_compare_Delong 函数并输出比较结果
      roc_compare_Delong(data1_yes, data1_no, data2_yes, data2_no, alpha)
    })
    
  })
}
