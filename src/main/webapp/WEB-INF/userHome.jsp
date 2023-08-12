<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/css/stylee.css">
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <!-- For any Bootstrap that uses JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- MY own CSS -->
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .my-container {
            padding: 35px 45px;
        }
        .justify-center {                   /*     center     */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* pics */
        .view-product {
            border: 2px solid #1254a1;
            border-radius: 10px;
            margin: 0px 20px 20px 0px;
            padding: 15px 10px 0px 10px;
        }
        .view-img {
            width: 200px;
            height: 200px;
            padding: 20px;
            margin: 0 auto;
        }
        .view-image {
            width: 100%;
            height: 300px;
            color: #1254a1;
            margin: 0 auto;
        }
    </style>

</head>
<body class="font">
<!-- NAV BAR -->
<nav class="navbar navbar-expand-lg navbar-light navbar-style">
    <div class="container-fluid">
        <a class="navbar-brand" href="/users/home">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation" style="border: transparent solid 1px; color: #1254a1; font-weight: bold">Categories</button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <li class="nav-item dropdown nav nav-pills">
                <a class="navbar-brand dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
                <ul class="dropdown-menu navbar-style">
                    <c:forEach items="${categories}" var="category">
                        <li><a class="dropdown-item" href="/users/${category.name}">${category.name}s</a></li>
                    </c:forEach>
                </ul>
            </li>
        </div>
        <a class="navbar-brand" href="/viewWishlist">
            <i class="fas fa-heart">
     <span class=" top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.7rem;">
         ${wishlistItemCount}
     </span>
            </i>
        </a>
        <a class="navbar-brand" href="/viewCart">
            <i class="fas fa-shopping-cart">
                <span class=" top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.7rem;">
                    ${numberOfCartItems}
                </span>
            </i>
        </a>
        <a class="navbar-brand" href="/logout" >Log out</a>
    </div>
</nav>


<!-- CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide mt-2 p-2" data-bs-ride="carousel" style="margin-bottom: 40px">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="view-image" onclick="location.href='/users/${categories[0].name}'"><img src="/assets/${categories[0].categoryImage}" class="d-block w-100" alt="${categories[0].name}s"></div>
        </div>
        <c:forEach var="category" items="${categories}" begin="1">
            <div class="carousel-item">
                <div class="view-image" onclick="location.href='/users/${category.name}'"><img src="/assets/${category.categoryImage}" style="height: 300px" class="d-block w-100" alt="${category.name}s"></div>
            </div>
        </c:forEach>
    </div>
</div>



<div class="my-container">

    <!-- PRODUCTS -->
    <div class="row">
        <c:forEach items="${categories}" var="category">
            <c:forEach items="${products}" var="product">
                <c:if test="${category.name eq product.category.name}">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                        <div class="view-product">
                            <a class="ripple nav-link" href="/users/view/${product.id}">
                                <img src="/assets/${product.image}" class="view-img img-fluid rounded" alt="${product.productName}"/>
                            </a>
                            <div class="d-flex">
                                <div class="col">
                                    <a class="justify-center" href="/users/view/${product.id}">${product.productName}</a>
                                    <a class="justify-center" href="/users/${product.category.name}">${product.category.name}</a>
                                    <p class="justify-center">$${product.price}</p>
                                </div>
                                <div class="col">
                                    <form action="/new_wishlist_item" method="post">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <button type="submit" class="btn">
                                            <i class="fas fa-heart" style="color: #1254a1;"></i>
                                        </button>
                                    </form>
                                    <form action="/new_cart_item" method="post">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <button type="submit" class="btn">
                                            <i class="fas fa-shopping-cart" style="color: #1254a1;"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>

</div>
</body>
</html>