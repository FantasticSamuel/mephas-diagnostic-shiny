mod_server_19 <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    Y <- eventReactive(input$submit, {
      A0 <- input$A0
      A <- input$A
      variance <- input$variance
      alpha <- input$alpha
      
      validate(
        need(A0 >= 0 && A0 <= 1, "A0 必须在 0 和 1 之间"),
        need(A >= 0 && A <= 1, "A 必须在 0 和 1 之间"),
        need(variance > 0, "方差必须为正数"),
        need(alpha > 0 && alpha < 1, "alpha 必须在 0 和 1 之间")
      )
      
      result <- roc.testing(A0, A, variance, alpha)
      return(result)
    })
    
    output$test_result <- renderPrint({
      result <- Y()
      req(result)
    })
  })
}
