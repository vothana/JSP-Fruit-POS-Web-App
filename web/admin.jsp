<%-- 
    Document   : home.jp
    Created on : Dec 15, 2022, 11:06:16 PM
    Author     : VothanaCHY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fruit Management</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js" integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/admin.css"/>
        
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
                </div>
                <div class="profile">
                    <div class="link" style="background: none">Omega 3</div>
                    <div class="profileImg">
                        <img src="./images/1/Red Cherry .png" >
                    </div>
                </div>
            </div>
            <div class="box-Admin">
                
                 <div class="container">
        <div class="box">
            <div class="formControl">
                
                <form action="" class="form">
                  <div class="NameCreate">
                    <h2> Create Fruit</h2>
                    
                </div>
                    <div class="inputField">
                        <label class="label" for="FruitID">FruitID</label>
                        <input type="text" name="FruitID" id="FruitID" placeholder="FruitID">
                    </div>
                    <div class="inputField">
                        <label class="label" for="FruitName">FruitName</label>
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
                        <label class="label" for="Discount">Discount</label>
                        <input type="number" name="Discount" id="Discount" placeholder="Discount">
                    </div>
                     <div class="inputField">
                        <label class="label" for="DateIn">DateIn</label>
                        <input type="date" name="DateIn" id="DateIn" >
                    </div>
                    <div class="inputField">
                        <label class="label" for="Day">Day</label>
                        <input type="number" name="Day" id="Day" placeholder="Day">
                    </div>
                     <div class="inputField">
                        <label class="label" for="Image">Image</label>
                        <input type="file" name="Image" id="Image">
                    </div>

                    <div class="btn-submit">
                     
                     
                   <button type="submit " class="button-submit"> Create New</button>

                  </div>

                </form>
            </div>
            <div class="list">
                <h3> Fruit List</h3>
                <!-- <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0"> -->
                    
                  
                <table class="table table-striped table-dark table-hover">
                    <thead action> 
                      <tr>
                        <th scope="col">FruitID</th>
                        <th scope="col">FruitName</th>
                        <th scope="col">Price</th>
                        <th scope="col">Description</th>
                        <th scope="col">Discount</th>
                        <th scope="col">DateIn</th>
                        <th scope="col">Day</th>
                        <th scope="col">Image</th>
                        <th scope="col"> Action</th>

                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        
                        <td>01</td>
                        <td>Mango</td>
                        <td>5$</td>
                        <td>Mango Fruit</td>
                        <td>20%</td>
                        <td>27/02/2013</td>
                        <td>27</td>
                        <th scope="row"> <img src="https://i.pravatar.cc/75?img=32" > </th>
                        <td>
                          <a  class= 'btn btn-primary btn-sm'href=''> Edit</a>
                          <a  class= 'btn btn-danger btn-sm' href=''> Delete</a>
                      </td>
                       
                      </tr>
                      <tr>
                        <td>02</td>
                        <td>Banna</td>
                        <td>5$</td>
                        <td>Mango Fruit</td>
                        <td>20%</td>
                        <td>27/02/2013</td>
                        <td>27</td>
                        <th scope="row"> <img src="https://i.pravatar.cc/75?img=42" > </th>
                        <td>
                          <a  class= 'btn btn-primary btn-sm'href=''> Edit</a>
                          <a  class= 'btn btn-danger btn-sm' href=''> Delete</a>
                       </td>
                      </tr>

                      <tr>
                        <td>03</td>
                        <td>Apple</td>
                        <td>5$</td>
                        <td>Mango Fruit</td>
                        <td>20%</td>
                        <td>27/02/2013</td>
                        <td>27</td>
                        <th scope="row"> <img src="https://i.pravatar.cc/75?img=52" > </th>
                        <td>
                          <a  class= 'btn btn-primary btn-sm'href=' '> Edit</a>
                          <a  class= 'btn btn-danger btn-sm' href=' '> Delete</a>
                      </td>
                      </tr>
                      <tr>
                        <td>04</td>
                        <td>cherry</td>
                        <td>5$</td>
                        <td>Mango Fruit</td>
                        <td>20%</td>
                        <td>27/02/2013</td>
                        <td>27</td>
                        <th scope="row"> <img src="https://i.pravatar.cc/75?img=62" > </th>
                        <td>
                          <a  class= 'btn btn-primary btn-sm'href=''> Edit</a>
                          <a  class= 'btn btn-danger btn-sm' href=''> Delete</a>
                      </td>
                      </tr>
                      <tr>
                        <td>05</td>
                        <td>Blue berry</td>
                        <td>5$</td>
                        <td>Mango Fruit</td>
                        <td>20%</td>
                        <td>27/02/2013</td>
                        <td>27</td>
                        <th scope="row"> <img src="https://i.pravatar.cc/75?img=22" > </th>
                        <td>
                          <a  class= 'btn btn-primary btn-sm'href=''> Edit</a>
                          <a  class= 'btn btn-danger btn-sm' href=''> Delete</a>
                      </td>
                      </tr>
                     
                    </tbody>
                  </table>
                <!-- </div>  -->
                
            </div>
        </div>
    </div>
                
                
            </div>
          </div>
      </div>
    </body>
</html>
