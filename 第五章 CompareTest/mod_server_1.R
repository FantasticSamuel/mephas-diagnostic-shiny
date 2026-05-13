mod_server_1 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      data1 <- as.numeric(unlist(input$data1)) # 将输入的数据转换为数值型
      data2 <- as.numeric(unlist(input$data2)) # 同样处理 data2
      alpha <- as.numeric(input$alpha)
      
      validate(
        need(!is.null(data1) && !is.null(data2), "请输入数据"),
        need(alpha > 0 && alpha < 1, "显著性水平应在 0 和 1 之间")
      )
      
      # 转换为矩阵并设定维度
      data1 <- t(matrix(data1, nrow = 2, byrow = TRUE))
      data2 <- t(matrix(data2, nrow = 2, byrow = TRUE))
      
      # 根据选择的类型，调用对应的函数
      if (input$data_type == "unpaired") {
        result <- unpaired_binary(data1, data2, alpha)
      } else {
        result <- paired_binary(data1, data2, alpha)
      }
      # 进行四个对比测试
      PPV_Leisenring_result <- tryCatch({
        PPV_Leisenring(data1, data2, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      NPV_Leisenring_result <- tryCatch({
        NPV_Leisenring(data1, data2, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      PPV_Pepe_result <- tryCatch({
        PPV_Pepe(data1, data2, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      NPV_Pepe_result <- tryCatch({
        NPV_Pepe(data1, data2, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      
      list(result_SeSp=result,PPV_Leisenring_result=PPV_Leisenring_result,NPV_Leisenring_result=NPV_Leisenring_result,PPV_Pepe_result=PPV_Pepe_result,NPV_Pepe_result=NPV_Pepe_result)
    })
    
    
    output$SeSp_result <- renderPrint({
      result <- Y()
      result$result_SeSp
    })
    
    output$PPV_Leisenring_result <- renderPrint({
      result <- Y()
      result$PPV_Leisenring_result
    })
    
    output$NPV_Leisenring_result <- renderPrint({
      result <- Y()
      result$NPV_Leisenring_result
    })
    
    output$PPV_Pepe_result <- renderPrint({
      result <- Y()
      result$PPV_Pepe_result
    })
    
    output$NPV_Pepe_result <- renderPrint({
      result <- Y()
      result$NPV_Pepe_result
    })
  })
}
