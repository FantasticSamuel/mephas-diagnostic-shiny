mod_server_15_MRMC_pilot <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$submit_pilot, {
      result <- MRMC_pilot(
        delta = input$delta,
        J_pilot = input$J_pilot,
        N_pilot = input$N_pilot,
        J = input$J,
        N = input$N,
        MSTRP = input$MSTRP,
        MSTR = input$MSTR,
        MSTP = input$MSTP,
        alpha = input$alpha
      )
      
      output$power_pilot <- renderText({
        paste("计算的统计功效为:", round(result, 4))
      })
    })
  })
}
