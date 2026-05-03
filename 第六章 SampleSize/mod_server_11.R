mod_server_11_non_inferiority_Se <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_Se_result <- eventReactive(input$submit_Se, {
      validate(
        need(input$Se1 >= 0, "Se1 值必须为非负数"),
        need(input$Se2 >= 0, "Se2 值必须为非负数"),
        need(input$p > 0 && input$p <= 1, "p 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_Se(input$Se1, input$Se2, input$p, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_Se <- renderText({
      res <- non_inferiority_Se_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_Sp <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_Sp_result <- eventReactive(input$submit_Sp, {
      validate(
        need(input$Sp1 >= 0, "Sp1 值必须为非负数"),
        need(input$Sp2 >= 0, "Sp2 值必须为非负数"),
        need(input$p > 0 && input$p <= 1, "p 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_Sp(input$Sp1, input$Sp2, input$p, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_Sp <- renderText({
      res <- non_inferiority_Sp_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_AUC_binormal <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_AUC_binormal_result <- eventReactive(input$submit_AUC_binormal, {
      validate(
        need(input$a1 > 0, "a1 值必须为正数"),
        need(input$b1 > 0, "b1 值必须为正数"),
        need(input$a2 > 0, "a2 值必须为正数"),
        need(input$b2 > 0, "b2 值必须为正数"),
        need(input$rD > 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN > 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_AUC_binormal(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_AUC_binormal <- renderText({
      res <- non_inferiority_AUC_binormal_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_AUC_any <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_AUC_any_result <- eventReactive(input$submit_AUC_any, {
      validate(
        need(input$theta1 > 0 && input$theta1 < 1, "theta1 值必须在 0 和 1 之间"),
        need(input$theta2 > 0 && input$theta2 < 1, "theta2 值必须在 0 和 1 之间"),
        need(input$r > 0 && input$r <= 1, "r 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_AUC_any(input$theta1, input$theta2, input$r, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_AUC_any <- renderText({
      res <- non_inferiority_AUC_any_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_fixedFPR <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_fixedFPR_result <- eventReactive(input$submit_fixedFPR, {
      validate(
        need(input$a1 >= 0, "a1 值必须为非负数"),
        need(input$b1 >= 0, "b1 值必须为非负数"),
        need(input$a2 >= 0, "a2 值必须为非负数"),
        need(input$b2 >= 0, "b2 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$e > 0 && input$e < 1, "e 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_fixedFPR(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$e, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_fixedFPR <- renderText({
      res <- non_inferiority_fixedFPR_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_partialAUC <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_partialAUC_result <- eventReactive(input$submit_partialAUC, {
      validate(
        need(input$a1 >= 0, "a1 值必须为非负数"),
        need(input$b1 >= 0, "b1 值必须为非负数"),
        need(input$a2 >= 0, "a2 值必须为非负数"),
        need(input$b2 >= 0, "b2 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$e1 > 0 && input$e1 < 1, "e1 值必须在 0 和 1 之间"),
        need(input$e2 > 0 && input$e2 < 1, "e2 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      non_inferiority_partialAUC(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$e1, input$e2, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_non_inferiority_partialAUC <- renderText({
      res <- non_inferiority_partialAUC_result()
      req(res)
      paste(
        "n (非劣性测试患病样本量):", res$n, "\n",
        "N (非劣性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_Se <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_Se_result <- eventReactive(input$submit_equivalency_Se, {
      validate(
        need(input$Se1 >= 0, "Se1 值必须为非负数"),
        need(input$Se2 >= 0, "Se2 值必须为非负数"),
        need(input$p > 0 && input$p <= 1, "p 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_Se(input$Se1, input$Se2, input$p, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_Se <- renderText({
      res <- equivalency_Se_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_Sp <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_Sp_result <- eventReactive(input$submit_equivalency_Sp, {
      validate(
        need(input$Sp1 >= 0, "Sp1 值必须为非负数"),
        need(input$Sp2 >= 0, "Sp2 值必须为非负数"),
        need(input$p > 0 && input$p <= 1, "p 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_Sp(input$Sp1, input$Sp2, input$p, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_Sp <- renderText({
      res <- equivalency_Sp_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_AUC_binormal <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_AUC_binormal_result <- eventReactive(input$submit_equivalency_AUC_binormal, {
      validate(
        need(input$a1 >= 0, "a1 值必须为非负数"),
        need(input$b1 >= 0, "b1 值必须为非负数"),
        need(input$a2 >= 0, "a2 值必须为非负数"),
        need(input$b2 >= 0, "b2 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_AUC_binormal(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_AUC_binormal <- renderText({
      res <- equivalency_AUC_binormal_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_AUC_any <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_AUC_any_result <- eventReactive(input$submit_equivalency_AUC_any, {
      validate(
        need(input$theta1 >= 0 && input$theta1 <= 1, "theta1 值必须在 0 和 1 之间"),
        need(input$theta2 >= 0 && input$theta2 <= 1, "theta2 值必须在 0 和 1 之间"),
        need(input$r >= 0 && input$r <= 1, "r 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_AUC_any(input$theta1, input$theta2, input$r, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_AUC_any <- renderText({
      res <- equivalency_AUC_any_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_fixedFPR <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_fixedFPR_result <- eventReactive(input$submit_equivalency_fixedFPR, {
      validate(
        need(input$a1 >= 0, "a1 值必须为非负数"),
        need(input$b1 >= 0, "b1 值必须为非负数"),
        need(input$a2 >= 0, "a2 值必须为非负数"),
        need(input$b2 >= 0, "b2 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$e > 0 && input$e < 1, "e 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_fixedFPR(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$e, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_fixedFPR <- renderText({
      res <- equivalency_fixedFPR_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_equivalency_partialAUC <- function(id) {
  moduleServer(id, function(input, output, session) {
    equivalency_partialAUC_result <- eventReactive(input$submit_equivalency_partialAUC, {
      validate(
        need(input$a1 >= 0, "a1 值必须为非负数"),
        need(input$b1 >= 0, "b1 值必须为非负数"),
        need(input$a2 >= 0, "a2 值必须为非负数"),
        need(input$b2 >= 0, "b2 值必须为非负数"),
        need(input$rD >= 0 && input$rD <= 1, "rD 值必须在 0 和 1 之间"),
        need(input$rN >= 0 && input$rN <= 1, "rN 值必须在 0 和 1 之间"),
        need(input$e1 >= 0 && input$e1 < input$e2, "e1 值必须小于 e2"),
        need(input$e2 > 0 && input$e2 <= 1, "e2 值必须在 0 和 1 之间"),
        need(input$Delta > 0, "Delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数")
      )
      
      equivalency_partialAUC(input$a1, input$b1, input$a2, input$b2, input$rD, input$rN, input$e1, input$e2, input$Delta, input$alpha, input$beta, input$R)
    })
    
    output$output_equivalency_partialAUC <- renderText({
      res <- equivalency_partialAUC_result()
      req(res)
      paste(
        "n (等效性测试患病样本量):", res$n, "\n",
        "N (等效性测试总样本量):", res$N
      )
    })
  })
}
mod_server_11_non_inferiority_rTPR <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_rTPR_result <- eventReactive(input$submit_non_inferiority_rTPR, {
      validate(
        need(input$TPR2 > 0 && input$TPR2 <= 1, "TPR2 值必须在 0 和 1 之间"),
        need(input$TPPR > 0 && input$TPPR <= 1, "TPPR 值必须在 0 和 1 之间"),
        need(input$gamma > 0, "gamma 值必须为正数"),
        need(input$delta1 > 0, "delta1 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间")
      )
      
      non_inferiority_rTPR(input$TPR2, input$TPPR, input$gamma, input$delta1, input$alpha, input$beta)
    })
    
    output$output_non_inferiority_rTPR <- renderText({
      res <- non_inferiority_rTPR_result()
      req(res)
      paste(
        "n_pro (前瞻性研究的患病样本量):", res$n_pro, "\n",
        "n_retro (回顾性研究的患病样本量):", res$n_retro
      )
    })
  })
}
mod_server_11_non_inferiority_rFPR <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_rFPR_result <- eventReactive(input$submit_non_inferiority_rFPR, {
      validate(
        need(input$FPR2 > 0 && input$FPR2 <= 1, "FPR2 值必须在 0 和 1 之间"),
        need(input$FPPR > 0 && input$FPPR <= 1, "FPPR 值必须在 0 和 1 之间"),
        need(input$gamma > 0, "gamma 值必须为正数"),
        need(input$delta2 > 0, "delta2 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间")
      )
      
      non_inferiority_rFPR(input$FPR2, input$FPPR, input$gamma, input$delta2, input$alpha, input$beta)
    })
    
    output$output_non_inferiority_rFPR <- renderText({
      res <- non_inferiority_rFPR_result()
      req(res)
      paste(
        "n_pro (前瞻性研究的患病样本量):", res$n_pro, "\n",
        "n_retro (回顾性研究的患病样本量):", res$n_retro
      )
    })
  })
}
mod_server_11_non_inferiority_PPV <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_PPV_result <- eventReactive(input$submit_non_inferiority_PPV, {
      validate(
        need(input$PPV2 > 0 && input$PPV2 <= 1, "PPV2 值必须在 0 和 1 之间"),
        need(input$gamma > 0, "gamma 值必须为正数"),
        need(input$delta > 0, "delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间")
      )
      
      p <- c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8)
      
      non_inferiority_PPV(input$PPV2, p, input$gamma, input$delta, input$alpha, input$beta)
    })
    
    output$output_non_inferiority_PPV <- renderText({
      res <- non_inferiority_PPV_result()
      req(res)
      paste(
        "n_one (单侧假设检验的患病样本量):", res$n_one, "\n",
        "n_two (双侧假设检验的患病样本量):", res$n_two
      )
    })
  })
}
mod_server_11_non_inferiority_NPV <- function(id) {
  moduleServer(id, function(input, output, session) {
    non_inferiority_NPV_result <- eventReactive(input$submit_non_inferiority_NPV, {
      validate(
        need(input$NPV2 > 0 && input$NPV2 <= 1, "NPV2 值必须在 0 和 1 之间"),
        need(input$gamma > 0, "gamma 值必须为正数"),
        need(input$delta > 0, "delta 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间")
      )
      
      p <- c(input$p1, input$p2, input$p3, input$p4, input$p5, input$p6, input$p7, input$p8)
      
      non_inferiority_NPV(input$NPV2, p, input$gamma, input$delta, input$alpha, input$beta)
    })
    
    output$output_non_inferiority_NPV <- renderText({
      res <- non_inferiority_NPV_result()
      req(res)
      paste(
        "n_one (单侧假设检验的患病样本量):", res$n_one, "\n",
        "n_two (双侧假设检验的患病样本量):", res$n_two
      )
    })
  })
}
