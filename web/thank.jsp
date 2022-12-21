<%-- 
    Document   : thank
    Created on : Dec 20, 2022, 12:31:57 AM
    Author     : VothanaCHY
--%>

<%@page import="num.DataSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank You </title>
        
        <style>
            @import url('https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700');

/*--------------------------------
RESET
---------------------------------*/
*{
  font-family: 'Oswald', sans-serif;
}

.banner {
  margin:auto;
  height: 200px;
  text-align: center;
}

.logo {
  height: 300px;
}

.head-one {
  padding: 10px;
  text-align: center;
  margin: 60px;
}

.body {
  max-width: auto-flow;
  padding: 170px;
  margin-top: 150px;
  background: #F2D1C8;
  margin: auto;
  font-size: 30px;
  text-align: center;
  cursor: pointer;
}

.body:hover {
  color: white;
  background-color: #F4B6AD;
}

.footer {
  padding: 10px;
  text-align: center;
  margin: 60px;
}
        </style>
    </head>
    <body>
            <% 
            Cookie[] cookies = request.getCookies();
            String userID = "0";
              if(cookies != null){
                  for (Cookie cookie : cookies) {
                      if (cookie.getName().equals("id")) {
                          userID = cookie.getValue();
                          break;
                      }
                  }
              }

            DataSQL data = new DataSQL();
            if(request.getParameter("procceed") != null && request.getParameter("procceed") != ""){
                if(request.getParameter("procceed").equalsIgnoreCase("done")){
                    data.finishOrder(userID);
                }
            }
        %>
        
        <div class="banner"> 
        <img src= "https://img.freepik.com/premium-vector/online-store-building_7737-788.jpg"
             class= "logo">
        </div>

        <div>
          <div class="head-one">

        </div>


            <div class= "body">
                <a style="text-decoration: none" href="index.jsp">
                    YOUR ORDER HAS BEEN PLACED, THANK YOU FOR SHOPPING WITH NUM SHOP. ♡ 

                    Click to go home.
                </a>
            </div>
        <div>
          <div class="footer">
        </div>
    </body>
</html>
