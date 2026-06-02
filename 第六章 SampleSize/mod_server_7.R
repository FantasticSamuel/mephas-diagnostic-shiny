mod_server_7 <- function(id) {
  moduleServer(id, function(input, output, session) {
    ppv_result <- eventReactive(input$submit, {
      validate(
        need(input$PPV2 > 0 && input$PPV2 < 1, "PPV2 值必须在 0 和 1 之间"),
        need(input$gamma_ppv > 0, "gamma 值必须为正数"),
        need(input$delta_ppv > 0, "delta 值必须为正数"),
        need(input$alpha_ppv > 0 && input$alpha_ppv < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta_ppv > 0 && input$beta_ppv < 1, "beta 值必须在 0 和 1 之间"),
        need(all(c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8) >= 0), "p 各值必须为非负数")
      )
      
      p_vector <- c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8)
      samplecomparePPV(input$PPV2, p_vector, input$gamma_ppv, input$delta_ppv, input$alpha_ppv, input$beta_ppv)
    })
    
    npv_result <- eventReactive(input$submit, {
      validate(
        need(input$NPV2 > 0 && input$NPV2 < 1, "NPV2 值必须在 0 和 1 之间"),
        need(input$gamma_npv > 0, "gamma 值必须为正数"),
        need(input$delta_npv > 0, "delta 值必须为正数"),
        need(input$alpha_npv > 0 && input$alpha_npv < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta_npv > 0 && input$beta_npv < 1, "beta 值必须在 0 和 1 之间"),
        need(all(c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8) >= 0), "p 各值必须为非负数")
      )
      
      p_vector <- c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8)
      samplecompareNPV(input$NPV2, p_vector, input$gamma_npv, input$delta_npv, input$alpha_npv, input$beta_npv)
    })
    
    output$output_ppv_one_sided <- renderText({
      res <- ppv_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 阳性预测值):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 阳性预测值):", res$N_one
      )
    })
    
    output$output_ppv_two_sided <- renderText({
      res <- ppv_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 阳性预测值):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 阳性预测值):", res$N_two
      )
    })
    
    output$output_npv_one_sided <- renderText({
      res <- npv_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 阴性预测值):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 阴性预测值):", res$N_one
      )
    })
    
    output$output_npv_two_sided <- renderText({
      res <- npv_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 阴性预测值):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 阴性预测值):", res$N_two
      )
    })
  })
}
