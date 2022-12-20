<%-- 
    Document   : remove
    Created on : Dec 20, 2022, 10:55:00 PM
    Author     : VothanaCHY
--%>

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
    
    if(request.getParameter("remove") != null && request.getParameter("remove") != ""){
        data.order(userID, String.valueOf(request.getParameter("item")), "remove");
    }else if(request.getParameter("item") != null && request.getParameter("item") != ""){
        data.deleteCart(String.valueOf(request.getParameter("oderID")), String.valueOf(request.getParameter("item")));
    }
%>

<script>
    window.location.replace("cart.jsp");
</script>