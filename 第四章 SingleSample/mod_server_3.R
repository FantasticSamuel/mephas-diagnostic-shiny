mod_server_3 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # 动态生成n个2x2矩阵的输入框
    output$matrix_inputs <- renderUI({
      n <- input$n_matrices  # 获取用户输入的矩阵个数
      ns <- session$ns
      input_list <- lapply(1:n, function(i) {
        if (i %% 2!= 0) {
          # 奇数
          val1_default <- 22
          val2_default <- 3
          val3_default <- 2
          val4_default <- 3
        } else {
          # 偶数
          val1_default <- 56
          val2_default <- 6
          val3_default <- 23
          val4_default <- 78
        }
        
        tagList(
          h4(paste("cluster", i)),
          fluidRow(
            column(6, numericInput(ns(paste0("val1_", i)), "TP:", value = val1_default)),
            column(6, numericInput(ns(paste0("val2_", i)), "FN:", value = val2_default))
          ),
          fluidRow(
            column(6, numericInput(ns(paste0("val3_", i)), "FP:", value = val3_default)),
            column(6, numericInput(ns(paste0("val4_", i)), "TN:", value = val4_default))
          )
        )
      })
      
      do.call(tagList, input_list)
    })
    
    Y <- eventReactive(input$submit, {
      n <- input$n_matrices  # 获取用户输入的矩阵个数
      data <- array(dim = c(2, 2, n))
      
      # 填充数组，获取每个矩阵的输入值
      for (i in 1:n) {
        data[,,i] <- matrix(c(as.numeric(input[[paste0("val1_", i)]]), 
                              as.numeric(input[[paste0("val2_", i)]]), 
                              as.numeric(input[[paste0("val3_", i)]]), 
                              as.numeric(input[[paste0("val4_", i)]])), nrow = 2, byrow = TRUE)
      }
      
      validate(
        need(all(!is.na(data)), "请检查输入的数据和参数"),
        need(is.numeric(data), "输入的数据必须是数值"),
        need(sum(data) != 0, "矩阵不能全为零"),
        need(dim(data)[1] == 2 && dim(data)[2] == 2, "每个矩阵的数据必须是2x2的")
      )
      
      print("Input data:")  # 调试信息
      print(data)
      
      result <- tryCatch({
        roc.clusteredbinary(data, alpha = as.numeric(input$alpha))
      }, error = function(e) {
        showNotification(paste("Error in roc.clusteredbinary calculation:", e$message))
        NULL
      })
      
      print("Result from roc.clusteredbinary:")  # 调试信息
      print(result)
      
      result  # 确保结果在这个反应式中被返回
    })
    
    output$estimate <- renderText({
      result <- Y()  # 从反应式中获取结果
      req(result)
      paste("Se:", round(result$Se, 4), "Sp:", round(result$Sp, 4),
            "PPV:", round(result$PPV, 4), "NPV:", round(result$NPV, 4))
    })
    
    output$se_intervals <- renderTable({
      result <- Y()
      req(result)
      matrix(result$Se.interval, ncol = 2, byrow = TRUE, dimnames = list(NULL, c("Lower Bound", "Upper Bound")))
    }, rownames = FALSE, digits = 6)
    
    output$sp_intervals <- renderTable({
      result <- Y()
      req(result)
      matrix(result$Sp.interval, ncol = 2, byrow = TRUE, dimnames = list(NULL, c("Lower Bound", "Upper Bound")))
    }, rownames = FALSE, digits = 6)
    
    output$ppv_intervals <- renderTable({
      result <- Y()
      req(result)
      matrix(result$PPV.interval, ncol = 2, byrow = TRUE, dimnames = list(NULL, c("Lower Bound", "Upper Bound")))
    }, rownames = FALSE, digits = 6)
    
    output$npv_intervals <- renderTable({
      result <- Y()
      req(result)
      matrix(result$NPV.interval, ncol = 2, byrow = TRUE, dimnames = list(NULL, c("Lower Bound", "Upper Bound")))
    }, rownames = FALSE, digits = 6)
    
  })
}
