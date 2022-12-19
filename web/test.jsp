<%-- 
    Document   : home.jp
    Created on : Dec 15, 2022, 11:06:16 PM
    Author     : VothanaCHY
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="num.Cart"%>
<%@page import="num.Order"%>
<%@page import="java.io.OutputStream"%>
<%@page import="num.DataSQL"%>
<%@page import="java.util.List"%>
<%@page import="num.Fruit"%>
<%@page import="num.Fruit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <jsp:useBean id="bean" class="num.DataSQL" />
        <jsp:useBean id="file" class="file.upload" />
        <jsp:useBean id="get" class="file.get" />
        
        <script>
            function procceed(){
                window.location.replace("thank.jsp?procceed=done");
            }
        </script>
        
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

            out.print("<br> USER ID:" + userID);
            DataSQL data = new DataSQL();
            DecimalFormat df = new DecimalFormat("#.##");
            
            out.print("<br><br>==================================");
            
            String fruitID = "2";

            boolean isAdded = data.order(userID, fruitID);
    
            if(isAdded){
              out.print("<br>" + "Success");
            }else{
              out.print("<br>" + "Failed");
            }
            
            out.print("<br><br>==================================");

            Cart cart = data.getACartByFruidID(userID, "8", fruitID);
            if(cart != null){
                  out.print("<br>" + "OrderID : " +  cart.getOrderID());
                  out.print("<br>" + "CartID : " +  cart.getCartID());
                  out.print("<br>" + "FruitID : " +  cart.getFruitID());
                  out.print("<br>" + "Qty : " +  cart.getQuantity());
            }else{
              out.print("<br>" + "No CART for this user");
            }

            out.print("<br><br>==================================");
            
            out.print("<br>ALL FRUIT THAT THIS USER ORDERING<br>");
            List<Order> orders = data.getActiveOrder(userID);
            if(!orders.isEmpty()){
                for(Order order : orders){
                  out.print("<br>" + "OrderID : " + order.getOrderID());
                  out.print("<br>" + "FruitId : " + order.getFruitId());
                  out.print("<br>" + "Name : " + order.getName());
                  out.print("<br>" + "Image : " + order.getImage());
                  out.print("<br>" + "Price : $" + order.getPrice());
                  out.print("<br>" + "Quantity : " + order.getQuantity());
                  out.print("<br>" + "Total : $" + df.format(order.getPrice() * order.getQuantity()));
                  out.print("<br><br>==================================");
                }
            }else{
              out.print("<br>" + "No Order for this user");
            }
            
            double totalPrice = data.getTotalPrice(userID);
            out.print("<br>                           Total: <b style='color:red;'>$" + df.format(totalPrice) + "</b>" );
          
        %>
        
        <br>
        <br>
        <button onclick='procceed()'>Done Order</button>

        
        <div style="width: 100%; height: 20px; background: red; margin: 100px 0 20px 0"></div>
        <h2 style="text-align: center; width: 100%">TEST</h2>

        <% 
            if(request.getParameter("id") != null){
                boolean result = file.uploadFile(request);
                if(result)
                    out.print("Success upload file");
                else
                    out.print("Fail to upload");
            }
        %>

        <form id="form" role="form" action="" method="post" enctype="multipart/form-data">
            <div class="btn btn-success btn-file">
                <i class="fa fa-cloud-upload"></i>
                 Browse
                 <input type="file" name="file" id="image" />
            </div>
            <button type="submit" value="submit" name='submit'>submit</button>
        </form>

        <%
            String filename = "1 (12).png";
            String id = "1";
            if(request.getParameter("id") != null){
                filename = request.getParameter("file");
            }
        %>

        <img src=" <% out.print(get.getFilePath(filename, id)); %>" width="300" height="300">

        <script type="text/javascript">
            $('input[type=file]').change(function () {
                var $fileName =  $('#image').val(); 
                var $test = "index.jsp?id=1&file=" + $fileName.substring($fileName.lastIndexOf("\\") + 1, $fileName.length);
                $('#form').attr("action", $test);
                //alert($test);
            });
        </script>
    </body>
</html>
