#服务器ip随本机ip进行相应修改
LOCAL_IP <<- "39.105.188.3"

tabstop <- function(){
        navbarMenu("", icon = icon("power-off"),
           tabPanel(
                   actionLink(
                           "close", "停止", 
                           icon = icon("power-off"),
                           onclick = "setTimeout(function(){window.close();}, 100);"
                   )
           ),
           tabPanel(
                   tags$a("",
                          #target = "_blank",
                          #style = "margin-top:-30px; color:DodgerBlue",
                          href = paste0("javascript:history.go(0)"),#,
                          list(icon("redo"), "重启"))
           )
)
}

tablink <- function(){
  navbarMenu("", icon = icon("link"),
             tabPanel(
               tags$a("",
                      href = paste0("http://",LOCAL_IP,":3838/index/","index.html"),
                      list(icon("home"), "首页"))
             ))
}


tabOF <- function(){
fluidPage(#
shinyWidgets::switchInput(#
       inputId = "explain_on_off",#
       label = "<i class=\"fa fa-book\"></i>", # Explanation in Details
        inline = TRUE,
        onLabel = "Show",
        offLabel = "Hide",
        size = "mini"
        )
)
}

stylink <- function(){
  tags$head(
  tags$link(rel = "shortcut icon", href = "../www/favicon.png"),
  tags$link(rel = "icon", type = "image/png", sizes = "96x96", href = "../www/favicon-96x96.ico"),
  tags$link(rel = "icon", type = "image/png", sizes = "32x32", href = "../www/favicon-32x32.png"),
  tags$link(rel = "icon", type = "image/png", sizes = "16x16", href = "../www/favicon-16x16.png")
)
}

checkLogin <- function(){
  getCookieStr ="<script>
        function getCookie(cname){
            var name = cname + '=';
            var ca = document.cookie.split(';');
            for(var i=0; i < ca.length; i++) {
              var c = ca[i].trim();
              if (c.indexOf(name)==0) { return c.substring(name.length,c.length); }
            }
            return '';
          }
            "
  

  str0 = "
            let userVal = getCookie('userInfo');
            
            //var userVal = document.cookie;
            //console.log('userVal的值：',userVal);
            //上线之后loginFlag = false为正确初始值
            let loginFlag = false;
            //let loginFlag = true; //调试情况下使用
            if(userVal != ''){
                try {
                  var user0 = decodeURIComponent(userVal);
                  //console.log('user0的值：',user0);
                  var userObj = JSON.parse(user0);
                  //console.log('userObj[eMail].length的值：',userObj['eMail'].length);
                  if(userObj['eMail']!= null && typeof userObj['eMail'] === 'string' && userObj['eMail'].length !=0){
                    loginFlag = true;
                  }
                } catch (e) {
                  loginFlag = false;
                }
            }
            if(!loginFlag){
              window.location.href= 'http://"
  
  str1 = ":8282/backend/page/login/login.html';
            }
              </script>"
 
  HTML(paste0(getCookieStr,str0,LOCAL_IP,str1))
  
}
