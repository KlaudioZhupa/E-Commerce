<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Wishlist</title>
    <link rel="stylesheet" href="/css/stylee.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

         .background-image {
             background-image: url('/assets/wishlist.jpg');
             background-size: cover;
             background-repeat: no-repeat;
         }

    </style>
</head>
<body class="font background-image" >
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
            <i class="fas fa-heart"> <span class=" top-0 start-100 translate-middle badge rounded-pill bg-danger">
                ${wishlistItemCount}
            </span></i>
        </a>
        <a class="navbar-brand" href="/viewCart">
            <i class="fas fa-shopping-cart"><span class=" top-0 start-100 translate-middle badge rounded-pill bg-danger">
                ${numberOfCartItems}
            </span></i>
        </a>
        <a class="navbar-brand" href="/logout" >Log out</a>
    </div>
</nav>

<div class="container">
    <h1 class="mt-2">Wishlist</h1>
    <table class="table border border-3 border-dark text-center">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${wishlistItems}" var="wishlistItem">
            <tr>
                <td>${wishlistItem.product.productName}</td>
                <td>$${wishlistItem.product.price}</td>
                <td>
                    <img src="/assets/${wishlistItem.product.image}" alt="${wishlistItem.product.productName}" width="100" height="100">
                </td>
                <td class="d-flex">
                    <form:form action="/wishlist_item/${wishlistItem.id}/delete" method="delete">
                        <button class="btn btn-danger mx-1">Remove</button>
                    </form:form>
                    <form action="/add_wishlist_item_to_cart" method="post">
                        <input type="hidden" name="productIds" value="${wishlistItem.product.id}">
                        <button type="submit" class="btn btn-primary">
                            Add to <i class="fas fa-shopping-cart"></i>
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex gap-2 justify-content-end">
        <form action="/add_wishlist_item_to_cart" method="post">
            <c:forEach items="${wishlistItems}" var="wishlistItem">
                <input type="hidden" name="productIds" value="${wishlistItem.product.id}">
            </c:forEach>
            <button type="submit" class="btn btn-primary">
                Add all products to <i class="fas fa-shopping-cart"></i>
            </button>
        </form>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>