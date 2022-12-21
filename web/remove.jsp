<%-- 
    Document   : remove
    Created on : Dec 20, 2022, 10:55:00 PM
    Author     : VothanaCHY
--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@page import="num.DataSQL"%>
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
    String url = "";
    
    if(request.getParameter("remove") != null && request.getParameter("remove") != ""){
        data.order(userID, String.valueOf(request.getParameter("item")), "remove");
        url = "cart.jsp";
    }else if(request.getParameter("item") != null && request.getParameter("item") != ""){
        data.deleteCart(String.valueOf(request.getParameter("oderID")), String.valueOf(request.getParameter("item")));
        url = "cart.jsp";
    }else if(request.getParameter("fruitID") != null && request.getParameter("fruitID") != ""){
        data.deleteFruit(request.getParameter("fruitID"));
        url = "admin.jsp";
    }
    
%>

<script>
        $( document ).ready(function() {
            window.location.replace("<%= url %>");
        });
</script>