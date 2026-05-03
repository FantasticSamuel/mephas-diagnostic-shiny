mod_server_6_continuous_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$analyze, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- input$alpha
      differ_continuous_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha)
    })
    output$result <- renderPrint({
      result()
    })
  })
}
mod_server_6_continuous_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$analyze, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- input$alpha
      differ_continuous_paired(data1_no, data2_no, data1_yes, data2_yes, alpha)
    })
    output$result <- renderPrint({
      result()
    })
  })
}
mod_server_6_ordinal_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$analyze, {
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      alpha <- input$alpha
      differ_ordinal_unpaired(data1_no, data2_no, data1_yes, data2_yes, alpha)
    })
    output$result <- renderPrint({
      result()
    })
  })
}
mod_server_6_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    result <- eventReactive(input$analyze, {
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
      alpha <- input$alpha
      differ_ordinal_paired(data0, data1, alpha)
    })
    output$result <- renderPrint({
      result()
    })
  })
}
