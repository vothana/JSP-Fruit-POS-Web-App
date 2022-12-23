<%@page import="java.util.ArrayList"%>
<%@page import="num.Order"%>
<%@page import="java.util.Iterator"%>
<%@page import="num.Fruit"%>
<%@page import="java.util.List"%>
<%@page import="num.User"%>
<%@page import="num.User"%>
<!doctype html>
<%@ page import="num.DataSQL"%>


<%
    Cookie[] cookies = request.getCookies();
    DataSQL data = new DataSQL();
    List<Fruit> fruits = data.selectAllFruit();
    List<Fruit> searchFruits = null;
    String FullName = "User";
    String userID = "0";
    boolean noFruits = false;
    
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
    
    if(request.getParameter("search") != null && request.getParameter("search") != ""){
        searchFruits = data.searchAllFruit(request.getParameter("search"));
    }
    
    List<Order> orders = data.getActiveOrder(userID);
    int allQuantity = 0;
    if(!orders.isEmpty()){
        for(Order order : orders){
            allQuantity += order.getQuantity();
        }
    }
    
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
    }else if(searchFruits != null){
    
        id = String.valueOf(searchFruits.get(0).getId());
        filename = searchFruits.get(0).getImage();
        name = searchFruits.get(0).getName();
        price = String.valueOf(searchFruits.get(0).getPrice());
        desc = searchFruits.get(0).getDescription();
        dateIn = searchFruits.get(0).getDateIn();
        expiredDay = String.valueOf(searchFruits.get(0).getDay());
        
    }else if(fruits.size() > 0){
    
        id = String.valueOf(fruits.get(0).getId());
        filename = fruits.get(0).getImage();
        name = fruits.get(0).getName();
        price = String.valueOf(fruits.get(0).getPrice());
        desc = fruits.get(0).getDescription();
        dateIn = fruits.get(0).getDateIn();
        expiredDay = String.valueOf(fruits.get(0).getDay());
        
    }else{
        noFruits = true;
    }
%>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fruit Store</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css"/>
    
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
            }else if($username === "@admin"){
                window.location.replace("admin.jsp?id=" + id);
            }else{
                window.location.replace("add.jsp?item=" + id);
            }
        };
        
        function goLogin(){
            $username = $.trim($('#username').text());
            if($username === "User"){
                window.location.replace("login.jsp");
            }else if ($username === "@admin") {
                window.location.replace("admin.jsp");
            }
        };
        
        $(document).ready(function() {
            $username = $.trim($('#username').text());
            if ($username === "@admin") {
                $('#cartBox').css("display", "none");
                $('#fruitMG').css("display", "block");
                $('#btnAddToCart').text("Edit");
            }else{
                $('#fruitMG').css("display", "none");
            }
        });
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
                    <a class="link" href="cart.jsp" id="cartBox">
                        <%  if(allQuantity > 0) {%>
                            <p class="badge"><%= allQuantity%></p>
                        <% } %>
                        <i style="font-size: 25px" class="fa-solid fa-cart-shopping"></i>
                    </a>
                        <a class="link" href="admin.jsp" style="background: #7de779; width: 250px" id="fruitMG">
                        Fruit Management
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
                    <% if(!noFruits) { %>
                    <div class="fruitViewer">
                        <div class="tittleView">
                            <span><%= name %></span>
                            <span>$<%= price %></span>
                        </div>
                        <div class="imageView">
                             <img src="<%= get.getFilePath(filename, id) == null ? "./images/NoImage.png" : get.getFilePath(filename, id) %>" >
                        </div>
                        <div class="desc">
                            <strong>Description:</strong>
                            <p style="font-size: 12px">&emsp;<%= desc %></p>
                            <br>
                            <strong style="margin-top: 10px">Can keep: <span style="color: red"><%= expiredDay %> Days more</span></strong>
                        </div>
                        <div class="btnAdd" onclick="addToCart( <%= id %> )">
                            <p id="btnAddToCart">ADD TO CART</p>
                        </div>
                    </div>
                    <% } else { %>
                        <p style='text-align: center; width: 100%;'>No Fruits</p>
                    <% } %>
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
                                    String imagePath = get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId())) == null 
                                                       ? "./images/NoImage.png" 
                                                       : get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId()));
                                    out.print("<img src='" + imagePath + "' />");
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
                                        String imagePath = get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId())) == null 
                                                           ? "./images/NoImage.png" 
                                                           : get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId()));
                                        out.print("<img src='" + imagePath + "' />");
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