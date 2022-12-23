<%-- 
    Document   : add
    Created on : Dec 20, 2022, 10:51:28 PM
    Author     : VothanaCHY
--%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="num.Fruit"%>
<%@page import="file.upload"%>
<%@page import="num.DataSQL"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%
    Cookie[] cookies = request.getCookies();
    DataSQL data = new DataSQL();
    upload file = new upload();
    List<FileItem> fileItems = null;    
    String contentType = request.getContentType();
        String FullName = "User";
    String userID = "0";
    String url = "";
    boolean isWrong = false;
    
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

    if(request.getParameter("add") != null && request.getParameter("add") != ""){
    
        data.order(userID, String.valueOf(request.getParameter("item")), "");
        url = "cart.jsp";
        
    }else if(request.getParameter("item") != null && request.getParameter("item") != ""){
    
        data.order(userID, String.valueOf(request.getParameter("item")), "");
        url = "store.jsp?id=" + String.valueOf(request.getParameter("item"));
        
    }else if(request.getParameter("new") != null && request.getParameter("new") != ""){
    
        if ((contentType.contains("multipart/form-data"))) {
            fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        }
    
        file.uploadFile(fileItems);
        data.createFruit(fileItems);
        url = "admin.jsp";
        
    }else if(request.getParameter("update") != null && request.getParameter("update") != ""){
    
        if ((contentType.contains("multipart/form-data"))) {
            fileItems = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        }

        file.uploadFile(fileItems);
        data.updateFruit(fileItems);
        url = "admin.jsp";
        
    }else{
    
        out.print("\nSomething wrong !");
        isWrong = true;
        
    }
%>

<% if(!isWrong) { %>
    <script>
        $( document ).ready(function() {
            window.location.replace("<%= url %>");
        });
    </script>
<% } %>