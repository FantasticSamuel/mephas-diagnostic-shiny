#shinyServer(
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
server <- function(input, output, session) {

#source("../tab/func.R")
##########----------##########----------##########
mod_server_1("mod1")
mod_server_2("mod2")
mod_server_3("mod3")
mod_server_3_continuous_unpaired("mod3_continuous_unpaired")
# Ordinal Unpaired
mod_server_3_ordinal_unpaired("mod3_ordinal_unpaired")
# Continuous Paired
mod_server_3_continuous_paired("mod3_continuous_paired")
# Ordinal Paired
mod_server_3_ordinal_paired("mod3_ordinal_paired")
# Box-Cox Transformation
mod_server_boxcox("mod4_boxcox")

# Unpaired Sensitivity Comparison
mod_server_compare_unpaired("mod4_compare_unpaired")

# Paired Sensitivity Comparison
mod_server_compare_paired("mod4_compare_paired")

mod_server_5_continuous_unpaired("mod5_continuous_unpaired")
mod_server_5_continuous_paired("mod5_continuous_paired")
mod_server_5_ordinal_unpaired("mod5_ordinal_unpaired")
mod_server_5_ordinal_paired("mod5_ordinal_paired")

mod_server_6_continuous_unpaired("mod6_continuous_unpaired")
mod_server_6_continuous_paired("mod6_continuous_paired")
mod_server_6_ordinal_unpaired("mod6_ordinal_unpaired")
mod_server_6_ordinal_paired("mod6_ordinal_paired")

mod_server_7_ordinal("mod7_ordinal")
mod_server_7_continuous("mod7_continuous")

mod_server_8_ordinal_unpaired("mod8_ordinal_unpaired")
mod_server_8_continuous_unpaired("mod8_continuous_unpaired")
mod_server_8_ordinal_paired("mod8_ordinal_paired")
mod_server_8_continuous_paired("mod8_continuous_paired")

# Ordinal Unpaired
mod_server_9_ordinal_unpaired("mod9_ordinal_unpaired")

# Ordinal Paired
mod_server_9_ordinal_paired("mod9_ordinal_paired")

mod_server_10("mod10")
mod_server_11("mod11")
mod_server_12("mod12")
mod_server_13("mod13")
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



