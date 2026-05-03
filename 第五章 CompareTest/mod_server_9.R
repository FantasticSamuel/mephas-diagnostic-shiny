mod_server_9_ordinal_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$run, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      
      output$result <- renderPrint({
        result <- area_logit_unpaired(data1_no, data1_yes, data2_no, data2_yes, input$e1, input$e2, input$alpha)
        result
      })
    })
  })
}
mod_server_9_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$run, {
      data0 <- matrix(c(
        as.numeric(unlist(strsplit(input$data0_row1, ","))),
        as.numeric(unlist(strsplit(input$data0_row2, ","))),
        as.numeric(unlist(strsplit(input$data0_row3, ","))),
        as.numeric(unlist(strsplit(input$data0_row4, ","))),
        as.numeric(unlist(strsplit(input$data0_row5, ",")))
      ), nrow = 5, byrow = TRUE)
      
      data1 <- matrix(c(
        as.numeric(unlist(strsplit(input$data1_row1, ","))),
        as.numeric(unlist(strsplit(input$data1_row2, ","))),
        as.numeric(unlist(strsplit(input$data1_row3, ","))),
        as.numeric(unlist(strsplit(input$data1_row4, ","))),
        as.numeric(unlist(strsplit(input$data1_row5, ",")))
      ), nrow = 5, byrow = TRUE)
      
      output$result <- renderPrint({
        result <- area_logit_paired(data0, data1, input$e1, input$e2, input$alpha)
        result
      })
    })
  })
}
