#shinyServer(
library(SINGLESAMPLE)
source("mod_server_1.R", local = TRUE, encoding = "utf-8")
source("mod_server_2.R", local = TRUE, encoding = "utf-8")
source("mod_server_3.R", local = TRUE, encoding = "utf-8")
source("mod_server_4.R", local = TRUE, encoding = "utf-8") 
source("mod_server_5.R", local = TRUE, encoding = "utf-8")
source("mod_server_6.R", local = TRUE, encoding = "utf-8") 
source("mod_server_7.R", local = TRUE, encoding = "utf-8") 
source("mod_server_8.R", local = TRUE, encoding = "utf-8") 
source("mod_server_9.R", local = TRUE, encoding = "utf-8") 
source("mod_server_10.R", local = TRUE, encoding = "utf-8") 
source("mod_server_11.R", local = TRUE, encoding = "utf-8") 
source("mod_server_12.R", local = TRUE, encoding = "utf-8") 
source("mod_server_13.R", local = TRUE, encoding = "utf-8") 
source("mod_server_14.R", local = TRUE, encoding = "utf-8") 
source("mod_server_15.R", local = TRUE, encoding = "utf-8") 
server <- function(input, output, session) {

#source("../tab/func.R")
##########----------##########----------##########
mod_server_1("mod1")
mod_server_2("mod2")
mod_server_3("mod3")
mod_server_4("mod4")
mod_server_5("mod5")
mod_server_6("mod6")
mod_server_7("mod7")
mod_server_8("mod8")
mod_server_9("mod9")
mod_server_10("mod10")

mod_server_11_non_inferiority_Se("mod11_non_inferiority_Se")
mod_server_11_non_inferiority_Sp("mod11_non_inferiority_Sp")
mod_server_11_non_inferiority_AUC_binormal("mod11_non_inferiority_AUC_binormal")
mod_server_11_non_inferiority_AUC_any("mod11_non_inferiority_AUC_any")
mod_server_11_non_inferiority_fixedFPR("mod11_non_inferiority_fixedFPR")
mod_server_11_non_inferiority_partialAUC("mod11_non_inferiority_partialAUC")
mod_server_11_equivalency_Se("mod11_equivalency_Se")
mod_server_11_equivalency_Sp("mod11_equivalency_Sp")
mod_server_11_equivalency_AUC_binormal("mod11_equivalency_AUC_binormal")
mod_server_11_equivalency_AUC_any("mod11_equivalency_AUC_any")
mod_server_11_equivalency_fixedFPR("mod11_equivalency_fixedFPR")
mod_server_11_equivalency_partialAUC("mod11_equivalency_partialAUC")
mod_server_11_non_inferiority_rTPR("mod11_non_inferiority_rTPR")
mod_server_11_non_inferiority_rFPR("mod11_non_inferiority_rFPR")
mod_server_11_non_inferiority_PPV("mod11_non_inferiority_PPV")
mod_server_11_non_inferiority_NPV("mod11_non_inferiority_NPV")

mod_server_12("mod12")

mod_server_13_MRMC_nopilot_Se("MRMC_nopilot_Se")
mod_server_13_MRMC_nopilot_AUC("MRMC_nopilot_AUC")
mod_server_13_MRMC_nopilot_fixedFPR("MRMC_nopilot_fixedFPR")
mod_server_13_MRMC_nopilot_partialAUC("MRMC_nopilot_partialAUC")

mod_server_14_sample_fixedreader_AUC_Blume("sample_fixedreader_AUC_Blume")
mod_server_14_sample_fixedreader_AUC_Obuchowski("sample_fixedreader_AUC_Obuchowski")

mod_server_15_MRMC_pilot("MRMC_pilot")

#source("server_2.R", local=TRUE, encoding="utf-8")$value

#source("server_p.R", local=TRUE, encoding="utf-8")$value

##########----------##########----------##########

#observe({
#      if (input$close > 0) stopApp()                             # stop shiny
#    })

# observe({
#   browser()
#   data0 = session$userData
#   info = data0$get("userInfo")
#   print("浏览器中打印出来的：")
#   print(info)
# })
}
#)



