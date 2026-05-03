mod_server_3 <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      alpha <- as.numeric(input$alpha)
      
      # 调试输出
      print("Data0:")
      print(data0)
      print("Data1:")
      print(data1)
      print(paste("Alpha:", alpha))
      
      validate(
        need(all(!is.na(data0)) && all(!is.na(data1)), "请确保输入的数据格式正确，没有空值"),
        need(alpha > 0 && alpha < 1, "α 值必须在 0 和 1 之间")
      )
      
      # 运行三个函数
      params_estimate_ordinal_unpaired_result <-params_estimate_ordinal_unpaired(data0, data1)
      
      BoxCox_result <- BoxCox(data0, data1)

      params_estimate_continuous_unpaired_result <- params_estimate_continuous_unpaired(data0, data1)

      list(
        params_estimate_ordinal_unpaired = params_estimate_ordinal_unpaired_result,
        BoxCox = BoxCox_result,
        params_estimate_continuous_unpaired = params_estimate_continuous_unpaired_result
      )
    })
    
    output$params_estimate_ordinal_unpaired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result$params_estimate_ordinal_unpaired)
    })
    
    output$BoxCox_result <- renderPrint({
      result <- Y()
      req(result)
      print(result$BoxCox)
    })
    
    output$params_estimate_continuous_unpaired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result$params_estimate_continuous_unpaired)
    })
  })
}
mod_server_3_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      # 将每行数据转换为数值向量并组成矩阵
      data0 <- rbind(
        as.numeric(unlist(strsplit(input$data0_row1, ","))),
        as.numeric(unlist(strsplit(input$data0_row2, ","))),
        as.numeric(unlist(strsplit(input$data0_row3, ","))),
        as.numeric(unlist(strsplit(input$data0_row4, ","))),
        as.numeric(unlist(strsplit(input$data0_row5, ",")))
      )
      
      data1 <- rbind(
        as.numeric(unlist(strsplit(input$data1_row1, ","))),
        as.numeric(unlist(strsplit(input$data1_row2, ","))),
        as.numeric(unlist(strsplit(input$data1_row3, ","))),
        as.numeric(unlist(strsplit(input$data1_row4, ","))),
        as.numeric(unlist(strsplit(input$data1_row5, ",")))
      )
      
      # 调试输出
      print("Data0 Matrix:")
      print(data0)
      print("Data1 Matrix:")
      print(data1)
      
      validate(
        need(all(!is.na(data0)) && all(!is.na(data1)), "请确保输入的数据格式正确，没有空值")
      )
      
      # 运行函数
      params_estimate_ordinal_paired_result <- tryCatch({
        params_estimate_ordinal_paired(data0, data1)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      params_estimate_ordinal_paired_result
    })
    
    output$params_estimate_ordinal_paired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}

mod_server_3_continuous_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      
      # 调试输出
      print("Data1_no:")
      print(data1_no)
      print("Data1_yes:")
      print(data1_yes)
      print("Data2_no:")
      print(data2_no)
      print("Data2_yes:")
      print(data2_yes)
      
      validate(
        need(all(!is.na(data1_no)) && all(!is.na(data1_yes)) && 
               all(!is.na(data2_no)) && all(!is.na(data2_yes)), "请确保输入的数据格式正确，没有空值")
      )
      
      # 运行函数
      params_estimate_continuous_paired_result <- tryCatch({
        params_estimate_continuous_paired(data1_no, data1_yes, data2_no, data2_yes)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      params_estimate_continuous_paired_result
    })
    
    output$params_estimate_continuous_paired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}
mod_server_3_continuous_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      
      roctest_continuous_unpaired_result <- tryCatch({
        roctest_continuous_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      roctest_continuous_unpaired_result
    })
    
    output$roctest_continuous_unpaired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}
mod_server_3_ordinal_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      
      roctest_ordinal_unpaired_result <- tryCatch({
        roctest_ordinal_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      roctest_ordinal_unpaired_result
    })
    
    output$roctest_ordinal_unpaired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}
mod_server_3_continuous_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      
      roctest_continuous_paired_result <- tryCatch({
        roctest_continuous_paired(data1_no, data1_yes, data2_no, data2_yes, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      roctest_continuous_paired_result
    })
    
    output$roctest_continuous_paired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}
mod_server_3_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data0 <- matrix(c(as.numeric(unlist(strsplit(input$data0_row1, ","))),
                        as.numeric(unlist(strsplit(input$data0_row2, ","))),
                        as.numeric(unlist(strsplit(input$data0_row3, ","))),
                        as.numeric(unlist(strsplit(input$data0_row4, ","))),
                        as.numeric(unlist(strsplit(input$data0_row5, ",")))),
                      nrow = 5, byrow = TRUE)
      data1 <- matrix(c(as.numeric(unlist(strsplit(input$data1_row1, ","))),
                        as.numeric(unlist(strsplit(input$data1_row2, ","))),
                        as.numeric(unlist(strsplit(input$data1_row3, ","))),
                        as.numeric(unlist(strsplit(input$data1_row4, ","))),
                        as.numeric(unlist(strsplit(input$data1_row5, ",")))),
                      nrow = 5, byrow = TRUE)
      alpha <- as.numeric(input$alpha)
      
      roctest_ordinal_paired_result <- tryCatch({
        roctest_ordinal_paired(data0, data1, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      roctest_ordinal_paired_result
    })
    
    output$roctest_ordinal_paired_result <- renderPrint({
      result <- Y()
      req(result)
      print(result)
    })
  })
}

