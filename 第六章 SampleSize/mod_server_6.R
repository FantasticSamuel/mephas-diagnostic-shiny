mod_server_6 <- function(id) {
  moduleServer(id, function(input, output, session) {
    sensitivity_result <- eventReactive(input$submit, {
      validate(
        need(input$Se1 > 0 && input$Se1 < 1, "Se1 值必须在 0 和 1 之间"),
        need(input$Se2 > 0 && input$Se2 < 1, "Se2 值必须在 0 和 1 之间"),
        need(input$p1 > 0 && input$p1 <= 1, "p 值必须在 0 和 1 之间"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R1 > 0, "R 值必须为正数")
      )
      
      samplecompareSe(input$Se1, input$Se2, input$p1, input$alpha, input$beta, input$R1)
    })
    
    specificity_result <- eventReactive(input$submit, {
      validate(
        need(input$Sp1 > 0 && input$Sp1 < 1, "Sp1 值必须在 0 和 1 之间"),
        need(input$Sp2 > 0 && input$Sp2 < 1, "Sp2 值必须在 0 和 1 之间"),
        need(input$p2 > 0 && input$p2 <= 1, "p 值必须在 0 和 1 之间"),
        need(input$alpha_sp > 0 && input$alpha_sp < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta_sp > 0 && input$beta_sp < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R2 > 0, "R 值必须为正数")
      )
      
      samplecompareSp(input$Sp1, input$Sp2, input$p2, input$alpha_sp, input$beta_sp, input$R2)
    })
    
    output$output_sensitivity_one_sided <- renderText({
      res <- sensitivity_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 敏感性):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 敏感性):", res$N_one
      )
    })
    
    output$output_sensitivity_two_sided <- renderText({
      res <- sensitivity_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 敏感性):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 敏感性):", res$N_two
      )
    })
    
    output$output_specificity_one_sided <- renderText({
      res <- specificity_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 特异性):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 特异性):", res$N_one
      )
    })
    
    output$output_specificity_two_sided <- renderText({
      res <- specificity_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 特异性):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 特异性):", res$N_two
      )
    })
  })
}
