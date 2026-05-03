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
source("mod_server_16.R", local = TRUE, encoding = "utf-8") 
source("mod_server_17.R", local = TRUE, encoding = "utf-8") 
source("mod_server_18.R", local = TRUE, encoding = "utf-8") 
source("mod_server_19.R", local = TRUE, encoding = "utf-8") 
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
mod_server_11("mod11")
mod_server_12("mod12")
mod_server_13("mod13")
mod_server_14("mod14")
mod_server_15("mod15")
mod_server_16("mod16")
mod_server_17("mod17")
mod_server_18("mod18")
mod_server_19("mod19")
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



