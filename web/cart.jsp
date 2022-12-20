<%-- Document : home.jp Created on : Dec 15, 2022, 11:06:16 PM Author : VothanaCHY --%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="num.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="num.DataSQL"%>
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
        
    DataSQL data = new DataSQL();
    DecimalFormat df = new DecimalFormat("#.##");
    
    List<Order> orders = data.getActiveOrder(userID);
    int allQuantity = 0;
    int item = 0;
    if(!orders.isEmpty()){
        for(Order order : orders){
            item++;
            allQuantity += order.getQuantity();
        }
    }
    
%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Process Order</title>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"
                integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
                integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="./css/cart.css" />
            
            <jsp:useBean id="bean" class="num.DataSQL" />
            <jsp:useBean id="get" class="file.get" />
            
            <script>
                function procceed(){
                    window.location.replace("thank.jsp?procceed=done");
                }
                
                function remove(orderID, fruitID){
                    window.location.replace("remove.jsp?item=" + fruitID + "&&oderID=" +  orderID);
                };
                
                function minus(fruitID){
                    window.location.replace("remove.jsp?item=" + fruitID + "&&remove=" +  fruitID);
                };
                
                function add(fruitID){
                    window.location.replace("add.jsp?item=" + fruitID + "&&add=" +  fruitID);
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
                                <%  if(allQuantity > 0) {%>
                                    <p class="badge"><%= allQuantity%></p>
                                <% } %>
                                <i class="fa-solid fa-cart-shopping"></i>
                            </a>
                        </div>
                    <div class="profile">
                        <a class="link" style="background: none" id="username">
                            <p><%= FullName %></p>
                        </a>
                        <div class="profileImg" onclick="goLogin()">
                            <img src="./images/NUM Logo.png" >
                        </div>
                    </div>
                    </div>
                    <div class="box">
                        <!--                Design cart here @Voutey-->
                        <div class="cart_page">
                            <div class="cart_box">
                                <div class="cart_header">
                                    <div class="cart_header_child">
                                        <p>Shopping Cart</p>
                                        <p><%= item %> Items</p>
                                    </div>
                                </div>
                                <div class="cart_center_header">
                                    <p>FRUIT DETAIL</p>
                                    <p>QUANTITY</p>
                                    <p>PRICE</p>
                                    <p>TOTAL</p>
                                </div>
                                <div class="cart_center">
                                    <% 
                                        if(!orders.isEmpty()){
                                            for(Order order : orders){
                                            %>
                                                <div class="cart_item">
                                                    <div class="detail_box">
                                                        <div class="image">
                                                            <img
                                                                src="<% out.print(get.getFilePath(order.getImage(), String.valueOf(order.getFruitId()))); %>" />
                                                        </div>
                                                        <div class="detail">
                                                            <p><strong><%= order.getName() %></strong></p>
                                                            <p style="font-size: 12px;"><%= order.getDescription() %></p>
                                                            <p class="remove" onclick="remove(<%= order.getOrderID() %>,<%= order.getFruitId()%>)">Remove</p>
                                                        </div>
                                                    </div>
                                                    <div class="qty text">
                                                        <p class="count" onclick="minus(<%= order.getFruitId()%>)">-</p>
                                                        <p class="qty_text"><%= order.getQuantity()%></p>
                                                        <p class="count" onclick="add(<%= order.getFruitId()%>)">+</p>
                                                    </div>
                                                    <div class="text price">
                                                        <p>$<%= order.getPrice()%></p>
                                                    </div>
                                                    <div class="total text">
                                                        <p>$<%= df.format(order.getPrice() * order.getQuantity())%></p>
                                                    </div>
                                                </div>
                                            <%
                                            }
                                        }
                                    %>
                                </div>
                                <div class="cart_bottom">
                                    <div class="cart_bottom_child">
                                        <p class="totalPrice">Total : $ <%= df.format(data.getTotalPrice(userID)) %></p>
                                        <div class="btnCheckOut" onclick='procceed()'>
                                            <p>CHECK OUT</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>