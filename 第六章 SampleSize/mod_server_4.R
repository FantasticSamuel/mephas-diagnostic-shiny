mod_server_4 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$a0 > 0, "a0 值必须为正数"),
        need(input$b0 > 0, "b0 值必须为正数"),
        need(input$e > 0 && input$e < 1, "e 值必须在 0 和 1 之间"),
        need(input$L > 0, "L 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      fixedFPRsample(input$a0, input$b0, input$e, input$L, input$alpha, input$beta, input$R)
    })
    
    output$output_one_sided <- renderText({
      res <- result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量):", res$N_one
      )
    })
    
    output$output_two_sided <- renderText({
      res <- result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量):", res$N_two
      )
    })
  })
}
