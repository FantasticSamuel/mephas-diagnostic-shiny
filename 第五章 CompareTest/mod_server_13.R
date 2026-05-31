mod_server_13 <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    generated_dims <- reactiveVal(NULL)
    
    observeEvent(input$generate, {
      I <- input$I
      K <- input$K
      generated_dims(list(I = I, K = K))
      
      # 动态生成 Test 1 矩阵输入框
      output$matrix_inputs1 <- renderUI({
        tagList(
          h4("输入 Test 1 聚类数据矩阵"),
          lapply(1:(2 * I), function(i) {
            fluidRow(
              lapply(1:K, function(j) {
                column(20 / K, numericInput(
                  ns(paste0("data1_", i, "_", j)),
                  label = paste0(ifelse(i %% 2 == 1, "患病_cluster", "未患病_cluster"), ceiling(i / 2), " - 级别 ", j),
                  value = ifelse(i %% 2 == 1, j-1, K-j),
                  min = 0
                ))
              })
            )
          })
        )
      })
      
      # 动态生成 Test 2 矩阵输入框
      output$matrix_inputs2 <- renderUI({
        tagList(
          h4("输入 Test 2 聚类数据矩阵"),
          lapply(1:(2 * I), function(i) {
            fluidRow(
              lapply(1:K, function(j) {
                column(20 / K, numericInput(
                  ns(paste0("data2_", i, "_", j)),
                  label = paste0(ifelse(i %% 2 == 1, "患病_cluster", "未患病_cluster"), ceiling(i / 2), " - 级别 ", j),
                  value = ifelse(i %% 2 == 1, j-1, K-j),
                  min = 0
                ))
              })
            )
          })
        )
      })
    })
    output$result_output <- renderPrint({
      req(input$submit)
      I <- input$I
      K <- input$K 
      dims <- generated_dims()
      validate(
        need(!is.null(dims), "请先生成输入框"),
        need(isTRUE(dims$I == I && dims$K == K), "更改分级数或类别数后请重新生成输入框")
      )
      data1 <- matrix(0, nrow = 2 * I, ncol = K)
      data2 <- matrix(0, nrow = 2 * I, ncol = K)
      for (i in 1:(2 * I)) {
        for (j in 1:K) {
          data1_value <- input[[paste0("data1_", i, "_", j)]]
          data2_value <- input[[paste0("data2_", i, "_", j)]]
          validate(
            need(!is.null(data1_value), "请先生成输入框"),
            need(!is.null(data2_value), "请先生成输入框")
          )
          data1[i, j] <- as.numeric(data1_value)
          data2[i, j] <- as.numeric(data2_value)
        }
      }
      alpha <- input$alpha
      cluster_area_compare(data1, data2, alpha)
    })
  })
}
