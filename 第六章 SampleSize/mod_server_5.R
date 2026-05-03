mod_server_5 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$a > 0, "a 值必须为正数"),
        need(input$b > 0, "b 值必须为正数"),
        need(input$e1 > 0 && input$e1 < 1, "e1 值必须在 0 和 1 之间"),
        need(input$e2 > 0 && input$e2 < 1 && input$e2 > input$e1, "e2 值必须在 0 和 1 之间，并且大于 e1"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$L > 0, "L 值必须为正数"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      samplepartialarea(input$a, input$b, input$e1, input$e2, input$alpha, input$beta, input$L, input$R)
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
