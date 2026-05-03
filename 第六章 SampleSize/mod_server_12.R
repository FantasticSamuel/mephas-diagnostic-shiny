mod_server_12 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$SP > 0 && input$SP <= 1, "SP 值必须在 0 和 1 之间"),
        need(input$SE_con > 0 && input$SE_con <= 1, "SE_con 值必须在 0 和 1 之间"),
        need(input$SE_min > 0 && input$SE_min <= 1, "SE_min 值必须在 0 和 1 之间"),
        need(input$b > 0, "b 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间")
      )
      
      samplecutoff(input$SP, input$SE_con, input$SE_min, input$b, input$alpha, input$beta)
    })
    
    output$output_sample_size <- renderText({
      res <- result()
      req(res)
      paste(
        "粗略总样本量 (N):", res$N, "\n",
        "精确总样本量 (N_pre):", res$N_pre
      )
    })
  })
}
