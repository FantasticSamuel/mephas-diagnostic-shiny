mod_server_5_continuous_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      e <- as.numeric(input$e)
      
      TPRtest_continuous_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha, e)
    })
    
    output$result <- renderPrint({
      Y()
    })
  })
}

mod_server_5_continuous_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      e <- as.numeric(input$e)
      
      TPRtest_continuous_paired(data1_no, data1_yes, data2_no, data2_yes, alpha, e)
    })
    
    output$result <- renderPrint({
      Y()
    })
  })
}

mod_server_5_ordinal_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- as.numeric(input$alpha)
      e <- as.numeric(input$e)
      
      TPRtest_ordinal_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha, e)
    })
    
    output$result <- renderPrint({
      Y()
    })
  })
}

mod_server_5_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    Y <- eventReactive(input$submit, {
      data0 <- rbind(
        as.numeric(unlist(strsplit(input$data0_row1, ","))),
        as.numeric(unlist(strsplit(input$data0_row2, ","))),
        as.numeric(unlist(strsplit(input$data0_row3, ","))),
        as.numeric(unlist(strsplit(input$data0_row4, ","))),
        as.numeric(unlist(strsplit(input$data0_row5, ",")))
      )
      
      data1 <- rbind(
        as.numeric(unlist(strsplit(input$data1_row1, ","))),
        as.numeric(unlist(strsplit(input$data1_row2, ","))),
        as.numeric(unlist(strsplit(input$data1_row3, ","))),
        as.numeric(unlist(strsplit(input$data1_row4, ","))),
        as.numeric(unlist(strsplit(input$data1_row5, ",")))
      )
      
      alpha <- as.numeric(input$alpha)
      e <- as.numeric(input$e)
      
      TPRtest_ordinal_paired(data0, data1, alpha, e)
    })
    
    output$result <- renderPrint({
      Y()
    })
  })
}
