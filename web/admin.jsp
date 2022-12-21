<%-- 
    Document   : home.jp
    Created on : Dec 15, 2022, 11:06:16 PM
    Author     : VothanaCHY
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="num.Fruit"%>
<%@page import="num.DataSQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
    List<Fruit> fruits = data.selectAllFruit();
    List<Fruit> searchFruits = null;
    
    int maxID = data.getMaxIdFruit();
    int maxFruitId =  maxID != -1 ? maxID += 1 : 0;
    
    out.print(maxFruitId);
    
    if(request.getParameter("search") != null && request.getParameter("search") != ""){
        searchFruits = data.searchAllFruit(request.getParameter("search"));
    }
    
%>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Fruit Management</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"
    integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/admin.css" />
  
  <jsp:useBean id="get" class="file.get" />
  
       <script type="text/javascript">
           
        function goLogin(){
            $username = $.trim($('#username').text());
            if($username === "User"){
                window.location.replace("login.jsp");
            }
        };
        
        function editFruit(fruitID){
            $username = $.trim($('#username').text());
            if($username !== "User"){
                window.location.replace("admin.jsp?id=" + fruitID);
            }else{
                window.location.replace("login.jsp");
            }
        };
        
        function deleteFruit(fruitID){
            $username = $.trim($('#username').text());
            if($username !== "User"){
                window.location.replace("remove.jsp?fruitID=" + fruitID);
            }else{
                window.location.replace("login.jsp");
            }
        };
        
        function idFruit(fruitID){
            var $action = 'deleteFruit(' + fruitID + ')';
            $('#deleteFruit').attr("onclick", $action);
        };
        
        $( document ).ready(function() {
            document.getElementById("Image").removeAttribute("title");
            $('#Image').change(function() {
                $file = $(this).val();
                $file = $file.replace(/.*[\/\\]/, '');
                $('#imageName').text($file);
            });
        });
        
        function addFruit(action){
            $username = $.trim($('#username').text());
            if($username !== "User"){
                if(action === 'add'){
                    $('#form').attr("action", 'add.jsp?new=fruit');
                }else if(action === 'update'){
                    $('#form').attr("action", 'add.jsp?update=fruit');
                }
            }else{
                window.location.replace("login.jsp");
            }
        }
           
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
          <a class="link" href="admin.jsp">
            New
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
        <div class="formControl">
            <form role="form" action="" class="form" method="post" enctype="multipart/form-data" id="form">
            <div class="NameCreate">
              <h2> Create Fruit</h2>
            </div>
            <% 
                if(request.getParameter("id") != null && request.getParameter("id") != ""){
                    for(Fruit fruit : fruits){
                        if(fruit.getId() == Integer.parseInt(request.getParameter("id"))){ 
                        %>
                        <input type="hidden" name="id" value="<%= fruit.getId() %>">
                        <div class="inputField">
                          <label class="label" for="FruitName">Fruit Name</label>
                          <input type="text" name="FruitName" id="FruitName" placeholder="FruitName" value="<%= fruit.getName() %>">
                        </div>
                        <div class="inputField">
                          <label class="label" for="Price">Price</label>
                          <input type="number" name="Price" id="Price" placeholder="Price" value="<%= fruit.getPrice()%>">
                        </div>
                        <div class="inputField">
                          <label class="label" for="Description">Description</label>
                          <input type="text" name="Description" id="Description" placeholder="Description" value="<%= fruit.getDescription()%>">
                        </div>
                        <div class="inputField">
                          <label class="label" for="DateIn">Date In</label>
                          <input type="date" name="DateIn" id="DateIn" value="<%= fruit.getDateIn()%>">
                        </div>
                        <div class="inputField">
                          <label class="label" for="Day">Day</label>
                          <input type="number" name="Day" id="Day" placeholder="Day" value="<%= fruit.getDay()%>">
                        </div>
                        <div class="inputField">
                          <label class="label" for="Image" style="font-size: 40px; cursor: pointer; display: flex">
                              <i class="fa-solid fa-image"></i>
                              <span id="imageName" 
                                style="font-size: 20px; padding: 5px; margin-left: 3px; border-radius: 5px ; color: whitesmoke"
                                ><%= fruit.getImage()%>
                             </span>
                          </label>
                          <input type="file" name="Image" id="Image" value="<%= fruit.getImage()%>" style="display: none">
                        </div>
                        <div class="btn_box" >
                            <div class="btn-submit">
                                <button type="submit " class="button-submit" onclick="addFruit('update')"> Update</button>
                            </div>
                        </div>
                        <%
                            break;
                        }
                    }
                }else{
                    %>
                    <input type="hidden" name="id" value="<%= maxFruitId %>">
                    <div class="inputField">
                      <label class="label" for="FruitName">Fruit Name</label>
                      <input type="text" name="FruitName" id="FruitName" placeholder="FruitName">
                    </div>
                    <div class="inputField">
                      <label class="label" for="Price">Price</label>
                      <input type="number" name="Price" id="Price" placeholder="Price">
                    </div>
                    <div class="inputField">
                      <label class="label" for="Description">Description</label>
                      <input type="text" name="Description" id="Description" placeholder="Description">
                    </div>
                    <div class="inputField">
                      <label class="label" for="DateIn">DateIn</label>
                      <input type="date" name="DateIn" id="DateIn">
                    </div>
                    <div class="inputField">
                      <label class="label" for="Day">Day</label>
                      <input type="number" name="Day" id="Day" placeholder="Day">
                    </div>
                    <div class="inputField">
                        <label class="label" for="Image" style="font-size: 40px; cursor: pointer; display: flex">
                            <i class="fa-solid fa-image"></i>
                            <span id="imageName" 
                                  style="font-size: 20px; padding: 5px; margin-left: 3px; border-radius: 5px ; color: whitesmoke"
                                  >
                            </span>
                        </label>
                        <input type="file" name="Image" id="Image" style="display: none">
                    </div>
                    <div class="btn_box" >
                        <div class="btn-submit">
                            <button type="submit " class="button-submit" onclick="addFruit('add')"> Create New</button>
                        </div>
                    </div>
                    <%
                }
           %>
          </form>
        </div>
        <div class="tableFruit">
            <h3> Fruit List</h3>
            <table class="table table-striped table-hover">
                <thead action>
                  <tr>
                    <th scope="col">Fruit Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Description</th>
                    <th scope="col">Date In</th>
                    <th scope="col">Day</th>
                    <th scope="col">Image</th>
                    <th scope="col"> Action</th>
                  </tr>
                </thead>
            </table>
            <div class="list">
              <table class="table table-striped table-hover">
                <tbody>
                    <%
                        if(!fruits.isEmpty()){
                            for(Fruit fruit : fruits){ 
                            %>
                              <tr class="table-tr">
                                <td><%= fruit.getName() %></td>
                                <td>$<%= fruit.getPrice()%></td>
                                <td><%= fruit.getDescription()%></td>
                                <td><%= fruit.getDateIn()%></td>
                                <td><%= fruit.getDay()%></td>
                                <th scope="row" class="fruitImg">
                                  <img src="<%= get.getFilePath(fruit.getImage(), String.valueOf(fruit.getId())) %>">
                                </th>
                                <td>
                                    <a class='btn btn-primary btn-sm' onclick="editFruit(<%= fruit.getId() %>)"> Edit</a>
                                    <a class='btn btn-danger btn-sm' href="#myModal" data-toggle="modal" onclick="idFruit(<%= fruit.getId() %>)"> Delete</a>
                                </td>
                              </tr>
                            <%
                            }
                        } 
                    %>
                </tbody>
              </table>
            </div>
        </div>
      </div>
    </div>
  </div>
  <div id="myModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header flex-column">
                <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                </div>						
                <h4 class="modal-title w-100">Are you sure?</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                    <p>Do you really want to delete this fruit? This process cannot be undone.</p>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button id="deleteFruit" type="button" class="btn btn-danger" onclick="">Delete</button>
            </div>
        </div>
    </div>
</div> 
</body>

</html>
