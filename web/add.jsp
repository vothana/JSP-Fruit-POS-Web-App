<%-- 
    Document   : add
    Created on : Dec 20, 2022, 10:51:28 PM
    Author     : VothanaCHY
--%>
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
    
    String url = "";
        
    DataSQL data = new DataSQL();
    if(request.getParameter("add") != null && request.getParameter("add") != ""){
        data.order(userID, String.valueOf(request.getParameter("item")), "");
        url = "cart.jsp";
    }else if(request.getParameter("item") != null && request.getParameter("item") != ""){
        data.order(userID, String.valueOf(request.getParameter("item")), "");
        url = "store.jsp";
    }
%>

<script>
    window.location.replace("<%= url %>");
</script>