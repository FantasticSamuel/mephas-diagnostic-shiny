mod_server_7_ordinal <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$estimate, {
      area_estimation_ordinal(
        a = input$a,
        b = input$b,
        var_a = input$var_a,
        var_b = input$var_b,
        covar_ab = input$covar_ab,
        e1 = input$e1,
        e2 = input$e2
      )
    })
    
    output$result <- renderPrint({
      result()
    })
  })
}

mod_server_7_continuous <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$estimate, {
      area_estimation_continuous(
        a = input$a,
        b = input$b,
        var_a = input$var_a,
        var_b = input$var_b,
        covar_ab = input$covar_ab,
        e1 = input$e1,
        e2 = input$e2
      )
    })
    
    output$result <- renderPrint({
      result()
    })
  })
}
