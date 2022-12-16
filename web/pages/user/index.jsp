<%@page import="javax.script.ScriptEngineFactory"%>
<%@page import="javax.script.ScriptEngineFactory"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="java.util.List"%>
<%@page import="num.User"%>
<%@page import="num.User"%>
<!doctype html>
<%@ page import="num.DataSQL"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css"/>
    
    <jsp:useBean id="bean" class="num.DataSQL" />
    
    <jsp:useBean id="get" class="file.get" />
    
  </head>
  <body>
      
      <%
            String filename = "1 (12).png";
            String id = "1";
            if(request.getParameter("id") != null){
                filename = request.getParameter("file");
                out.print(filename);
            }
        %>
        
        <img src=" <% out.print(get.getFilePath(filename, id , "user")); %>" width="300" height="300">
      
      
      <% 
        DataSQL data = new DataSQL();
        List<User> users = data.selectAllUsers();
        for(User user : users){
                out.print("<br>");
             out.print(user.getId());
             out.print("<br>");
             out.print(user.getFullName());
             out.print("<br>");
             out.print(user.getUsername());
             out.print("<br>");
             out.print(user.getPassword());
        }
%>
      
      
<!--      <div class="parent">
          <div class="box_container">
            <div class="header">
                <div class="menu">
                    <div class="link">Home</div>
                    <div class="link">Store</div>
                    <div class="link">
                        <p class="badge">2</p>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                </div>
                <div class="profile">
                    <div class="link" style="background: none">Omega 3</div>
                    <div class="profileImg">
                        <img src="./images/1/Red Cherry .png" >
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="view">
                    <div class="searchBox">
                        <input type="text">
                    </div>
                    <div class="fruitViewer">
                        <div class="tittleView">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="imageView">
                             <img src="./images/1/Red Cherry .png" >
                        </div>
                        <div class="btnAdd">
                            <p>ADD TO CART</p>
                        </div>
                    </div>
                </div>
                <div class="store">
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                                        <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                                        <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                                        <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                    <div class="item">
                        <div class="tittle">
                            <span>Mango</span>
                            <span>$2.0</span>
                        </div>
                        <div class="image">
                            <img src="./WEB-INF/assets/image/Red Cherry .png" >
                        </div>
                    </div>
                </div>
            </div>
          </div>
      </div>-->
  </body>
</html>