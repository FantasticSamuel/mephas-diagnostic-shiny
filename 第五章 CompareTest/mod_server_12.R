mod_server_12 <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$run, {
      output$result <- renderPrint({
        data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
        data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
        data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
        data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
        e1 <- input$e1
        e2 <- input$e2
        alpha <- input$alpha
        
        compare_partial_He(data1_no, data1_yes, data2_no, data2_yes, e1, e2, alpha)
      })
    })
  })
}
