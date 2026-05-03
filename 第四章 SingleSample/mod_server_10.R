mod_server_10 <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    observeEvent(input$generate, {
      I <- input$I
      K <- input$K
      
      # 动态生成矩阵输入框
      output$matrix_inputs <- renderUI({
        input_list <- lapply(1:(2 * I), function(i) {
          fluidRow(
            lapply(1:K, function(j) {
              column(12 / K, numericInput(
                ns(paste0("cell_", i, "_", j)),
                label = paste0(ifelse(i %% 2 == 1, "患病_cluster", "未患病_cluster"), ceiling(i / 2), " - 级别 ", j),
                value = 0,
                min = 0
              ))
            })
          )
        })
        do.call(tagList, input_list)
      })
    })
    
    Y <- eventReactive(input$submit, {
      I <- input$I
      K <- input$K
      data <- matrix(0, nrow = 2 * I, ncol = K)
      
      for (i in 1:(2 * I)) {
        for (j in 1:K) {
          data[i, j] <- as.numeric(input[[paste0("cell_", i, "_", j)]])
        }
      }
      
      result <- roc.clustered(data)
      return(result)
    })
    
    output$result_output <- renderPrint({
      result <- Y()
      req(result)
      cat("AUC (Ac):", round(result$Ac, 6), "\n")
      cat("AUC 的方差 (Ac.var):", round(result$Ac.var, 6), "\n")
    })
  })
}
