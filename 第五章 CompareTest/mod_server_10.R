mod_server_10 <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- input$alpha
      
      # Call Zou_params_estimate
      params_estimate <- Zou_params_estimate(data1_no, data1_yes, data2_no, data2_yes)
      output$zou_params_estimate_result <- renderPrint({
        params_estimate
      })
      
      # Call Zou_area
      area_result <- Zou_area(data1_no, data1_yes, data2_no, data2_yes, alpha)
      output$zou_area_result <- renderPrint({
        area_result
      })
    })
  })
}
