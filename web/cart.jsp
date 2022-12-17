<%-- Document : home.jp Created on : Dec 15, 2022, 11:06:16 PM Author : VothanaCHY --%>
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
                                <p class="badge">2</p>
                                <i class="fa-solid fa-cart-shopping"></i>
                            </a>
                        </div>
                        <div class="profile">
                            <div class="link" style="background: none">Omega 3</div>
                            <div class="profileImg">
                                <img src="./images/1/Red Cherry .png">
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
                                        <p>3 Items</p>
                                    </div>
                                </div>
                                <div class="cart_center">
                                    <div class="cart_center_header">
                                        <p>FRUIT DETAIL</p>
                                        <p>QUANTITY</p>
                                        <p>PRICE</p>
                                        <p>TOTAL</p>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                    <div class="cart_item">
                                        <div class="detail_box">
                                            <div class="image">
                                                <img
                                                    src="https://www.collinsdictionary.com/images/full/fruit_163436567.jpg" />
                                            </div>
                                            <div class="detail">
                                                <p>Manggo</p>
                                                <p style="font-size: 12px;">Mango 300g</p>
                                                <p>Remove</p>
                                            </div>
                                        </div>
                                        <div class="qty text">
                                            <p class="count">-</p>
                                            <p class="qty_text">2</p>
                                            <p class="count">+</p>
                                        </div>
                                        <div class="text price">
                                            <p>$2.3</p>
                                        </div>
                                        <div class="total text">
                                            <p>$4.6</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart_bottom">
                                    <div class="cart_bottom_child">
                                        <p>Total : $4.8</p>
                                        <div class="btnCheckOut">
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