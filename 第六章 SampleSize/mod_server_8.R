mod_server_8 <- function(id) {
  moduleServer(id, function(input, output, session) {
    binormal_result <- eventReactive(input$submit, {
      validate(
        need(input$a1_null >= 0, "a1_null 值必须为非负数"),
        need(input$a2_null >= 0, "a2_null 值必须为非负数"),
        need(input$a1_alter >= 0, "a1_alter 值必须为非负数"),
        need(input$a2_alter >= 0, "a2_alter 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$alpha_binormal > 0 && input$alpha_binormal < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta_binormal > 0 && input$beta_binormal < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R_binormal > 0, "R 值必须为正数")
      )
      
      samplecompareAUC_binormal(input$a1_null, input$a2_null, input$a1_alter, input$a2_alter, input$rD, input$rN, input$alpha_binormal, input$beta_binormal, input$R_binormal)
    })
    
    any_result <- eventReactive(input$submit, {
      validate(
        need(input$theta >= 0, "theta 值必须为非负数"),
        need(input$theta1 >= 0, "theta1 值必须为非负数"),
        need(input$theta2 >= 0, "theta2 值必须为非负数"),
        need(input$r_any >= 0 && input$r_any <= 1, "r 值必须在 0 和 1 之间"),
        need(input$alpha_any > 0 && input$alpha_any < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta_any > 0 && input$beta_any < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R_any > 0, "R 值必须为正数")
      )
      
      samplecompareAUC_any(input$theta, input$theta1, input$theta2, input$r_any, input$alpha_any, input$beta_any, input$R_any)
    })
    
    output$output_binormal_one_sided <- renderText({
      res <- binormal_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 二正态):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 二正态):", res$N_one
      )
    })
    
    output$output_binormal_two_sided <- renderText({
      res <- binormal_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 二正态):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 二正态):", res$N_two
      )
    })
    
    output$output_any_one_sided <- renderText({
      res <- any_result()
      req(res)
      paste(
        "n（需要的患病人数）_one (单侧检验样本量 - 任意分布):", res$n_one, "\n",
        "N（需要的总人数）_one (单侧检验总样本量 - 任意分布):", res$N_one
      )
    })
    
    output$output_any_two_sided <- renderText({
      res <- any_result()
      req(res)
      paste(
        "n（需要的患病人数）_two (双侧检验样本量 - 任意分布):", res$n_two, "\n",
        "N（需要的总人数）_two (双侧检验总样本量 - 任意分布):", res$N_two
      )
    })
  })
}
