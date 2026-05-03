mod_server_8_ordinal_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$result <- renderPrint({
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      area_ordinal_unpaired(data1_no, data2_no, data1_yes, data2_yes, input$e1, input$e2, input$alpha)
    })
  })
}
mod_server_8_continuous_unpaired <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$result <- renderPrint({
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      area_continuous_unpaired(data1_no, data2_no, data1_yes, data2_yes, input$e1, input$e2, input$alpha)
    })
  })
}
mod_server_8_ordinal_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    area_ordinal_paired1 <- function(data0, data1, e1, e2, alpha) {
      output<-params_estimate_ordinal_paired(data0,data1)
      a1<-output$a1
      b1<-output$b1
      a2<-output$a2
      b2<-output$b2
      a<-c(a1,a2)
      b<-c(b1,b2)
      e<-c(e1,e2)
      #协方差
      var_a1<-output$cov_matrix[1,1]
      var_a2<-output$cov_matrix[3,3]
      var_b1<-output$cov_matrix[2,2]
      var_b2<-output$cov_matrix[4,4]
      covar_a1b1<-output$cov_matrix[1,2]
      covar_a2b2<-output$cov_matrix[3,4]
      covar_a1a2<-output$cov_matrix[1,3]
      covar_b1b2<-output$cov_matrix[2,4]
      covar_a2b1<-output$cov_matrix[2,3]
      covar_a1b2<-output$cov_matrix[1,4]
      #其它相关参数
      h<-matrix(c(0,0,0,0),nrow=2)
      for(i in 1:2){
        for(j in 1:2){
          h[i,j]<-(qnorm(e[j])+a[i]*b[i]/(1+b[i]^2))*sqrt(1+b[i]^2)
        }
      }
      f_full<-c(0,0)
      g_full<-c(0,0)
      f_partial<-c(0,0)
      g_partial<-c(0,0)
      for(i in 1:2){
        f_full[i]<-exp(-a[i]^2/(2*(1+b[i]^2)))/sqrt(2*pi*(1+b[i]^2))
        g_full[i]<--a[i]*b[i]*exp(-a[i]^2/(2*(1+b[i]^2)))/sqrt(2*pi*(1+b[i]^2)^3)
        f_partial[i]<-exp(-a[i]^2/(2*(1+b[i]^2)))*(pnorm(h[i,2])-pnorm(h[i,1]))/sqrt(2*pi*(1+b[i]^2))
        g_partial[i]<-exp(-a[i]^2/(2*(1+b[i]^2)))*(exp(-h[i,1]^2/2)-exp(-h[i,2]^2/2))/(2*pi*(1+b[i]^2))-a[i]*b[i]*exp(-a[i]^2/(2*(1+b[i]^2)))*(pnorm(h[i,2])-pnorm(h[i,1]))/sqrt(2*pi*(1+b[i]^2)^3)
      }
      cov_full<-f_full[1]*f_full[2]*covar_a1a2+g_full[1]*g_full[2]*covar_b1b2+g_full[1]*f_full[2]*covar_a2b1+f_full[1]*g_full[2]*covar_a1b2
      cov_partial<-f_partial[1]*f_partial[2]*covar_a1a2+g_partial[1]*g_partial[2]*covar_b1b2+g_partial[1]*f_partial[2]*covar_a2b1+f_partial[1]*g_partial[2]*covar_a1b2
      #输出结果
      Z1_full<-area_estimation_ordinal(a1,b1,var_a1,var_b1,covar_a1b1,e1,e2)$area.full
      Z1_partial<-area_estimation_ordinal(a1,b1,var_a1,var_b1,covar_a1b1,e1,e2)$area.partial
      Z2_full<-area_estimation_ordinal(a2,b2,var_a2,var_b2,covar_a2b2,e1,e2)$area.full
      Z2_partial<-area_estimation_ordinal(a2,b2,var_a2,var_b2,covar_a2b2,e1,e2)$area.partial
      var_full1<-area_estimation_ordinal(a1,b1,var_a1,var_b1,covar_a1b1,e1,e2)$var_full
      var_full2<-area_estimation_ordinal(a2,b2,var_a2,var_b2,covar_a2b2,e1,e2)$var_full
      var_partial1<-area_estimation_ordinal(a1,b1,var_a1,var_b1,covar_a1b1,e1,e2)$var_partial
      var_partial2<-area_estimation_ordinal(a2,b2,var_a2,var_b2,covar_a2b2,e1,e2)$var_partial
      var_full<-var_full1+var_full2-2*cov_full
      var_partial<-var_partial1+var_partial2-2*cov_partial
      Z_full<-(Z1_full-Z2_full)/sqrt(var_full)
      Z_partial<-(Z1_partial-Z2_partial)/sqrt(var_partial)
      result <- list(
        test_statistic_full = Z_full,
        full_area_significance = ifelse(abs(Z_full) < qnorm(1 - alpha / 2),
                                        "The full areas are not significantly different",
                                        "The full areas are significantly different"),
        test_statistic_partial = Z_partial,
        partial_area_significance = ifelse(abs(Z_partial) < qnorm(1 - alpha / 2),
                                           "The partial areas are not significantly different",
                                           "The partial areas are significantly different")
      )
      
      return(result)
    }
    Y <- eventReactive(input$run, {
    # 将输入的矩阵行数据转换为矩阵格式
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
    result <- area_ordinal_paired1(
      data0,
      data1,
      e1 = input$e1,
      e2 = input$e2,
      alpha = input$alpha
    )
    result
    })
    output$result <- renderPrint({
      result <- Y()
      result
    })
  })
}

mod_server_8_continuous_paired <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$result <- renderPrint({
      data1_no <- as.numeric(unlist(strsplit(input$data1_no, ",")))
      data2_no <- as.numeric(unlist(strsplit(input$data2_no, ",")))
      data1_yes <- as.numeric(unlist(strsplit(input$data1_yes, ",")))
      data2_yes <- as.numeric(unlist(strsplit(input$data2_yes, ",")))
      area_continuous_paired(data1_no, data2_no, data1_yes, data2_yes, input$e1, input$e2, input$alpha)
    })
  })
}
