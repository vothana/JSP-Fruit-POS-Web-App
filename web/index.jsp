<%-- Document : home.jp Created on : Dec 15, 2022, 11:06:16 PM Author : VothanaCHY --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    
    <%
        Cookie[] cookies = request.getCookies();
        String FullName = "User";
        String userID = "0";
        if(cookies != null){
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("fullName")) {
                    FullName = "@" + cookie.getValue();
                }
                if(cookie.getName().equals("id")){
                    userID = cookie.getValue();
                }
            }
        }
    %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"
        integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/index.css" />
    
    <script type="text/javascript">
        function goLogin(){
            $username = $.trim($('#username').text());
            if($username === "User"){
                window.location.replace("login.jsp");
            }
        };
      </script>
</head>

<body>
    <div class="parent">
        <div class="box_container">
            <div class="header">
                <div class="menu">
                    <a class="link" href="index.jsp">
                        Home
                    </a>
                    <a class="link" href="store.jsp">
                        Store
                    </a>
                </div>
                <div class="profile">
                    <div class="link" style="background: none" onclick="goLogin()" id="username"><%= FullName %></div>
                    <div class="profileImg" onclick="goLogin()" >
                        <img src="./images/NUM Logo.png">
                    </div>
                </div>
            </div>
            <div class="box">
                <!--                Design home here   @Visal-->
                <div class="home">
                    <div class="left">
                        <h2>Welcome to Fruit Store</h2>
                        <h4>Place, you can buy fresh fruits
                            that you prefer easily in this website
                        </h4>
                        <a class="btn" href="login.jsp">Login</a>
                        <p class="circle1 circle"></p>
                        <p class="circle2 circle"></p>
                    </div>
                    <div class="right">
                        <img src="./images/All Fruit.png" alt="">
                        <p class="circle3 circle"></p>
                        <p class="circle4 circle"></p>
                        <p class="circle5 circle"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>