mod_server_14_sample_fixedreader_AUC_Blume <- function(id) {
  moduleServer(id, function(input, output, session) {
  output$output_Blume <- renderText({
    req(input$submit_Blume)
    isolate({
      result <- sample_fixedreader_AUC_Blume(
        theta = input$theta,
        theta1 = input$theta1,
        theta2 = input$theta2,
        r = input$r,
        J = input$J,
        rho = input$rho,
        alpha = input$alpha,
        beta = input$beta,
        R = input$R
      )
      paste("所需患者数量为：", result$n, "，总样本量为：", result$N)
    })
  })})
}

mod_server_14_sample_fixedreader_AUC_Obuchowski <- function(id) {
  moduleServer(id, function(input, output, session) {
  output$output_Obuchowski <- renderText({
    req(input$submit_Obuchowski)
    isolate({
      result <- sample_fixedreader_AUC_Obuchowski(
        a1_null = input$a1_null,
        a2_null = input$a2_null,
        a1_alter = input$a1_alter,
        a2_alter = input$a2_alter,
        rD = input$rD,
        rN = input$rN,
        J = input$J,
        rho = input$rho,
        alpha = input$alpha,
        beta = input$beta,
        R = input$R
      )
      paste("所需患者数量为：", result$n, "，总样本量为：", result$N)
    })})
  })
}
