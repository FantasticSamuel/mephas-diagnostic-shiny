mod_server_3 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$null > 0 && input$null < 1, "null 值必须在 0 和 1 之间"),
        need(input$alter > 0 && input$alter < 1, "alter 值必须在 0 和 1 之间"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      hypoarea(input$null, input$alter, input$alpha, input$beta, input$R)
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
