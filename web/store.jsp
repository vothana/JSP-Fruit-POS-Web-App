<%@page import="java.util.Iterator"%>
<%@page import="num.Fruit"%>
<%@page import="java.util.List"%>
<%@page import="num.User"%>
<%@page import="num.User"%>
<!doctype html>
<%@ page import="num.DataSQL"%>


<%
    Cookie[] cookies = request.getCookies();
    String FullName = "User";
    if(cookies != null){
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("fullName")) {
                FullName = "@" + cookie.getValue();
                break;
            }
        }
    }
        
    DataSQL data = new DataSQL();
    List<Fruit> fruits = data.selectAllFruit();
    List<Fruit> searchFruits = null;
    
    if(request.getParameter("search") != null && request.getParameter("search") != ""){
        searchFruits = data.searchAllFruit(request.getParameter("search"));
    }
%>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fruit Store</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/store.css"/>
    
    <jsp:useBean id="bean" class="num.DataSQL" />
    <jsp:useBean id="get" class="file.get" />
      <script type="text/javascript">
        function pushID(id){
            window.location.replace("store.jsp?id=" + id);
        };
        
        function addToCart(id){
            $username = $.trim($('#username').text());
            if($username === "User"){
                window.location.replace("login.jsp");
            }else{
                window.location.replace("store.jsp?item=" + id);
            }
        };
        
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
                    <a class="link" href="cart.jsp">
                        <p class="badge">2</p>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </a>
                </div>
                <div class="profile">
                    <a class="link" onclick="goLogin()" style="background: none" id="username">
                        <p><%= FullName %></p>
                    </a>
                    <div class="profileImg" onclick="goLogin()">
                        <img src="./images/NUM Logo.png" >
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="view">
                    <div class="searchBox">
                        <input type="text" id="search" placeholder="Search..." />
                    </div>
                    <div class="fruitViewer">
                        <%
                            String id = "";
                            String filename = "";
                            String name = "";
                            String price = "";
                            String desc = "";
                            String dateIn = "";
                            String expiredDay = "";
                            
                            if(request.getParameter("id") != null){
                                for(Fruit fruit : fruits){
                                    if(fruit.getId() == Integer.parseInt(request.getParameter("id"))){
                                        id = String.valueOf(fruit.getId());
                                        filename = fruit.getImage();
                                        name = fruit.getName();
                                        price = String.valueOf(fruit.getPrice());
                                        desc = fruit.getDescription();
                                        dateIn = fruit.getDateIn();
                                        expiredDay = String.valueOf(fruit.getDay());
                                        break;
                                    }
                                }
                            }else{
                                id = String.valueOf(fruits.get(0).getId());
                                filename = fruits.get(0).getImage();
                                name = fruits.get(0).getName();
                                price = String.valueOf(fruits.get(0).getPrice());
                                desc = fruits.get(0).getDescription();
                                dateIn = fruits.get(0).getDateIn();
                                expiredDay = String.valueOf(fruits.get(0).getDay());
                            }
                        %>
                        <div class="tittleView">
                            <span><%= name %></span>
                            <span>$<%= price %></span>
                        </div>
                        <div class="imageView">
                             <img src="<% out.print(get.getFilePath(filename, id)); %>" >
                        </div>
                        <div class="desc">
                            <strong>Description:</strong>
                            <p style="font-size: 12px">&emsp;<%= desc %></p>
                            <strong style="margin-top: 10px">Can keep: <span style="color: red"><%= expiredDay %> Days more</span></strong>
                        </div>
                        <div class="btnAdd" onclick="addToCart(id)">
                            <p>ADD TO CART</p>
                        </div>
                    </div>
                </div>
                <div class="store">
                    <% 
                        if(searchFruits == null){
                            for(Fruit fruit : fruits){
                             out.print("<div class='item' onclick=' pushID(\"" + fruit.getId() + "\") ' >");
                                out.print("<div class='tittle'>");
                                    out.print("<span>" + fruit.getName() + "</span>");
                                    out.print("<span>$" + fruit.getPrice() + "</span>");
                                out.print("</div>");
                                out.print("<div class='image'>");
                                    out.print("<img src='" + get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId())) +"' />");
                                out.print("</div>");
                             out.print("</div>");
                            }
                        }else{
                            if(searchFruits.size() > 0){
                                for(Fruit fruit : searchFruits){
                                 out.print("<div class='item' onclick=' pushID(\"" + fruit.getId() + "\") ' >");
                                    out.print("<div class='tittle'>");
                                        out.print("<span>" + fruit.getName() + "</span>");
                                        out.print("<span>$" + fruit.getPrice() + "</span>");
                                    out.print("</div>");
                                    out.print("<div class='image'>");
                                        out.print("<img src='" + get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId())) +"' />");
                                    out.print("</div>");
                                 out.print("</div>");
                                }
                            }else{
                                out.print("<p style='text-align: center; width: 100%;'>No Fruits</p>");
                            }
                        }
                    %>
                </div>
            </div>
          </div>
      </div>

        <script>
            var input = document.getElementById("search");
            input.addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
              event.preventDefault();
              window.location.replace("store.jsp?search=" + input.value);
            }
            });
        </script>
  </body>

</html>