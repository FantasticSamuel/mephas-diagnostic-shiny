mod_server_1 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$Se > 0 && input$Se < 1, "Se 值必须在 0 和 1 之间"),
        need(input$Sp > 0 && input$Sp < 1, "Sp 值必须在 0 和 1 之间"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$L > 0, "L 值必须为正数"),
        need(input$p > 0 && input$p < 1, "p 值必须在 0 和 1 之间")
      )
      
      sampleSeSp(input$Se, input$Sp, input$alpha, input$beta, input$L, input$p)
    })
    
    output$output_normal <- renderText({
      res <- result()
      req(res)
      paste0(
        "n（需要的患病人数）.Se.normal: ", res$n.Se.normal, "\n",
        "n（需要的患病人数）.Sp.normal: ", res$n.Sp.normal, "\n",
        "N（需要的总人数）.Se.normal: ", res$N.Se.normal, "\n",
        "N（需要的总人数）.Sp.normal: ", res$N.Sp.normal
      )
    })
    
    output$output_rough <- renderText({
      res <- result()
      req(res)
      paste0(
        "n（需要的患病人数）.Se.rough: ", res$n.Se.rough, "\n",
        "n（需要的患病人数）.Sp.rough: ", res$n.Sp.rough, "\n",
        "N（需要的总人数）.Se.rough: ", res$N.Se.rough, "\n",
        "N（需要的总人数）.Sp.rough: ", res$N.Sp.rough
      )
    })
  })
}
