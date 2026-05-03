mod_server_2 <- function(id) {
  moduleServer(id, function(input, output, session) {
    clustered_binary_Sp1 <- function(data1, data2, alpha) {
      if(dim(data1)[1] != 2 || dim(data2)[1] != 2) {
        stop("The row for table data should be 2")
      }
      
      Sp1 <- data1[1,] / data1[2,]
      Sp2 <- data2[1,] / data2[2,]
      
      Sp1.total <- sum(Sp1 * data1[2,] / sum(data1[2,]))
      Sp2.total <- sum(Sp2 * data2[2,] / sum(data2[2,]))
      
      Sp1.var <- sum((data1[2,] / mean(data1[2,]))^2 * (Sp1 - Sp1.total)^2) / (length(Sp1) * (length(Sp1) - 1))
      Sp2.var <- sum((data2[2,] / mean(data2[2,]))^2 * (Sp2 - Sp2.total)^2) / (length(Sp2) * (length(Sp2) - 1))
      
      Cov <- sum((data1[2,] / mean(data1[2,]))^2 * (Sp1 - (Sp1.total + Sp2.total) / 2) *
                   (Sp2 - (Sp1.total + Sp2.total) / 2)) / (length(Sp1) * (length(Sp1) - 1))
      
      Z <- (Sp1.total - Sp2.total) / sqrt(Sp1.var + Sp2.var - 2 * Cov)
      
      result <- list(
        test_statistic = Z,
        significance = ifelse(Z > qnorm(alpha / 2) && Z < qnorm(1 - alpha / 2),
                              c("Specificities are not significantly different"),
                              c("Specificities are significantly different"))
      )
      
      return(result)
    }
    clustered_binary_Se1 <- function(data1, data2, alpha) {
      if(dim(data1)[1] != 2 || dim(data2)[1] != 2) {
        stop("The row for table data should be 2")
      }
      
      Se1 <- data1[1,] / data1[2,]
      Se2 <- data2[1,] / data2[2,]
      
      Se1.total <- sum(Se1 * data1[2,] / sum(data1[2,]))
      Se2.total <- sum(Se2 * data2[2,] / sum(data2[2,]))
      
      Se1.var <- sum((data1[2,] / mean(data1[2,]))^2 * (Se1 - Se1.total)^2) / (length(Se1) * (length(Se1) - 1))
      Se2.var <- sum((data2[2,] / mean(data2[2,]))^2 * (Se2 - Se2.total)^2) / (length(Se2) * (length(Se2) - 1))
      
      Cov <- sum((data1[2,] / mean(data1[2,]))^2 * (Se1 - (Se1.total + Se2.total) / 2) *
                   (Se2 - (Se1.total + Se2.total) / 2)) / (length(Se1) * (length(Se1) - 1))
      
      Z <- (Se1.total - Se2.total) / sqrt(Se1.var + Se2.var - 2 * Cov)
      
      result <- list(
        test_statistic = Z,
        significance = ifelse(Z > qnorm(alpha / 2) && Z < qnorm(1 - alpha / 2),
                              c("Sensitivities are not significantly different"),
                              c("Sensitivities are significantly different"))
      )
      
      return(result)
    }
    Y <- eventReactive(input$submit, {
      
      
      data1_1 <- as.numeric(unlist(strsplit(input$data11, ",")))
      data1_2 <- as.numeric(unlist(strsplit(input$data12, ",")))
      data2_1 <- as.numeric(unlist(strsplit(input$data21, ",")))
      data2_2 <- as.numeric(unlist(strsplit(input$data22, ",")))
      data1 <- matrix(c(data1_1, data1_2), nrow = 2, byrow = TRUE)
      data2 <- matrix(c(data2_1, data2_2), nrow = 2, byrow = TRUE)
      alph_a <- as.numeric(input$alpha)
      # browser()
      
      # Se_result <- clustered_binary_Se(data1, data2, alph_a)
      # Sp_result <- clustered_binary_Sp(data1, data2, alph_a)
      Se_result <- clustered_binary_Se1(data1, data2, alph_a)
      Sp_result <- clustered_binary_Sp1(data1, data2, alph_a)
      # browser()
      list(Se = Se_result, Sp = Sp_result)
    })
    
    output$S_e <- renderPrint({
      result <- Y()
      result$Se
    })
    
    output$S_p <- renderPrint({
      result <- Y()
      result$Sp
    })
  })
}
