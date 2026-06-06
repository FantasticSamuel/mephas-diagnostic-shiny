mod_server_10 <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    generated_dims <- reactiveVal(NULL)
    
    observeEvent(input$generate, {
      I <- input$I
      K <- input$K
      generated_dims(list(I = I, K = K))
      
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
      dims <- generated_dims()
      validate(
        need(!is.null(dims), "请先生成输入框"),
        need(isTRUE(dims$I == I && dims$K == K), "更改分级数或类别数后请重新生成输入框")
      )
      data <- matrix(0, nrow = 2 * I, ncol = K)
      
      for (i in 1:(2 * I)) {
        for (j in 1:K) {
          cell_value <- input[[paste0("cell_", i, "_", j)]]
          validate(need(!is.null(cell_value), "请先生成输入框"))
          data[i, j] <- as.numeric(cell_value)
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
