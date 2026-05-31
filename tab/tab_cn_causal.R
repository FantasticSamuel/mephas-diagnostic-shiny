#服务器ip随本机ip进行相应修改
# LOCAL_IP <<- "115.27.161.122"

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
                      list(icon("rotate"), "重启"))
             )
  )
}

tablink <- function(){
  navbarMenu("", icon = icon("link"),
             tabPanel(
               tags$a("",
                      href = paste0("http://",LOCAL_IP,":3838/index/","index.html"),
                      list(icon("house"), "首页"))
             ))
}


tabOFF <- function(){
  shinyWidgets::switchInput(#
    inputId = "explain_on_off",#
    label = "<i class=\"fa fa-book\"></i>", # Explanation in Details
    inline = TRUE,
    onLabel = "隐藏",
    offLabel = "帮助",
    size = "small",
    onStatus = "danger",
    offStatus = "danger"
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
                  userObj = JSON.parse(user0);
                  //console.log('userObj[eMail].length的值：',userObj['eMail'].length);
                  if(userObj['eMail']!= null && userObj['eMail'].length !=0){
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

postRequestCSV <- function(fileId,folder_path){

    # 创建一个API请求的URL，这里假设您需要传递一些参数
    url0 <- "http://123.56.13.213:8080/otherSystem/getFileByDoi"
    
    # 如果您需要传递参数，可以添加到请求中
    params <- list(doi= paste0('system/',fileId))
    
    # 创建一个POST请求
    req <- httr::POST(url = url0, 
                      body = params, 
                      encode = "json")
    
    # 打印请求结果
    # print(content(req, "text"))
    url <- NULL
    # 检查请求是否成功
    if (status_code(req) == 200 ) {
      # 解析JSON响应
      data <- jsonlite::fromJSON(content(req, "text"))
      if(data$code == 200){
        url <- data$data$fileUrl
      } else {
        # 打印错误信息
        stop(paste0("    查询文件返回空，状态码：", 
                    data$code,
                    ' 如多次失败,请把该错误信息提供给项目人员，失败码：',fileId))
      }
    } else {
      # 打印错误信息
      stop(paste0("    请求接口失败，状态码：", 
                  status_code(req),
                  '如多次失败,请把该错误信息提供给项目人员，失败码：',fileId))
      
    }
    
    # url <- "https://springboot-project-ztx.oss-cn-beijing.aliyuncs.com/c33f687a-0fe6-4b29-a901-8180443fd72f.csv"
    # url2 <- "https://springboot-project-ztx.oss-cn-beijing.aliyuncs.com/"
    # url <- paste0(url2 ,fileId,".csv")
    # path <- paste0(folder_path ,"test2data.csv")
    # folder_path <- folder_path()
    #如果文件夹不存在，需要先创建 
    if(!dir.exists(folder_path)){
      dir.create(folder_path,recursive = TRUE) #recursive = TRUE,父级不存在也创建
    }
    path <- paste0(folder_path ,fileId,".csv")
    
    tryCatch({download.file(url,destfile = path)  ## 需要运行的语句
    },error = function(e){
      validate(
        need(FALSE, paste0('  获取数据失败,如多次失败,请把失败码提供给项目人员，失败码：',fileId))
      )
    })
    csv <- read.csv(path,stringsAsFactors = TRUE)
    x <- as.data.frame(csv)
    return(x)
}
