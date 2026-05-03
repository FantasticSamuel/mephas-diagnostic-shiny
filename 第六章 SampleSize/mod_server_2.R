mod_server_2 <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$submit, {
      validate(
        need(input$A > 0 && input$A < 1, "A 值必须在 0 和 1 之间"),
        need(input$R > 0, "R 值必须为正数"),
        need(input$alpha > 0 && input$alpha < 1, "alpha 值必须在 0 和 1 之间"),
        need(input$beta > 0 && input$beta < 1, "beta 值必须在 0 和 1 之间"),
        need(input$L > 0, "L 值必须为正数")
      )
      
      samplearea(input$A, input$R, input$alpha, input$beta, input$L)
    })
    
    output$output_normal <- renderText({
      res <- result()
      req(res)
      paste(
        "n（需要的患病人数）.A.normal:",
        paste(res$n.A.normal, collapse = ", "),
        "\nN（需要的总人数）.A.normal:",
        paste(res$N.A.normal, collapse = ", ")
      )
    })
    
    output$output_rough <- renderText({
      res <- result()
      req(res)
      paste(
        "n（需要的患病人数）.A.rough:",
        paste(res$n.A.rough, collapse = ", "),
        "\nN（需要的总人数）.A.rough:",
        paste(res$N.A.rough, collapse = ", ")
      )
    })
  })
}
