mod_server_9 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$a1_null >= 0, "a1_null 值必须为非负数"),
        need(input$b1_null >= 0, "b1_null 值必须为非负数"),
        need(input$a2_null >= 0, "a2_null 值必须为非负数"),
        need(input$b2_null >= 0, "b2_null 值必须为非负数"),
        need(input$a1_alter >= 0, "a1_alter 值必须为非负数"),
        need(input$b1_alter >= 0, "b1_alter 值必须为非负数"),
        need(input$a2_alter >= 0, "a2_alter 值必须为非负数"),
        need(input$b2_alter >= 0, "b2_alter 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$e > 0 && input$e < 1, "e 值必须在 0 和 1 之间"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      samplefixedFPR(input$a1_null, input$b1_null, input$a2_null, input$b2_null, input$a1_alter, input$b1_alter, input$a2_alter, input$b2_alter, input$rD, input$rN, input$e, input$alpha, input$beta, input$R)
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
