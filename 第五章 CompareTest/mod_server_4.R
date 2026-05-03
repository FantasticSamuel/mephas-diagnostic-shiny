mod_server_boxcox <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data0 <- as.numeric(unlist(strsplit(input$data0, ",")))
      data1 <- as.numeric(unlist(strsplit(input$data1, ",")))
      
      validate(
        need(all(!is.na(data0)) && all(!is.na(data1)), "请确保输入的数据格式正确，没有空值")
      )
      
      result <- tryCatch({
        roc.transformed(data0, data1)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      result
    })
    
    output$boxcox_result <- renderPrint({
      result <- Y()
      result
    })
  })
}
mod_server_compare_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      SP <- as.numeric(input$SP)
      alpha <- as.numeric(input$alpha)
      
      validate(
        need(all(!is.na(data1_no)) && all(!is.na(data2_no)) && 
               all(!is.na(data1_yes)) && all(!is.na(data2_yes)), "请确保输入的数据格式正确，没有空值"),
        need(SP > 0 && SP < 1, "SP 值必须在 0 和 1 之间"),
        need(alpha > 0 && alpha < 1, "α 值必须在 0 和 1 之间")
      )
      
      result <- tryCatch({
        compareSe_unpaired(data1_no, data2_no, data1_yes, data2_yes, SP, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      result
    })
    
    output$compare_unpaired_result <- renderPrint({
      result <- Y()
      result
    })
  })
}
mod_server_compare_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      SP <- as.numeric(input$SP)
      alpha <- as.numeric(input$alpha)
      
      validate(
        need(all(!is.na(data1_no)) && all(!is.na(data2_no)) && 
               all(!is.na(data1_yes)) && all(!is.na(data2_yes)), "请确保输入的数据格式正确，没有空值"),
        need(SP > 0 && SP < 1, "SP 值必须在 0 和 1 之间"),
        need(alpha > 0 && alpha < 1, "α 值必须在 0 和 1 之间")
      )
      
      result <- tryCatch({
        compareSe_paired(data1_no, data2_no, data1_yes, data2_yes, SP, alpha)
      }, error = function(e) {
        return(paste("Error:", e$message))
      })
      
      result
    })
    
    output$compare_paired_result <- renderPrint({
      result <- Y()
      result
    })
  })
}
