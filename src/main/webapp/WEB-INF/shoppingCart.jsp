<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <!-- For any Bootstrap that uses JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- MY own CSS -->
    <style>
        .navbar-background {
            background-color: #f8f9fa; /* Light gray background color */
        }

        body {
            background-color: #f8f9fa; /* Light gray background color */
        }

        .container {
            background-color: #ffffff; /* White background color */
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1254a1; /* Blue text color */
        }

        th {
            background-color: #1254a1; /* Blue background color */
            color: black; /* White text color */
        }

        .table-bordered {
            border: 1px solid #dee2e6; /* Light gray border */
        }

        /* Customize button styling */
        .btn-primary {
            background-color: #1254a1; /* Blue background color */
            border-color: #1254a1; /* Blue border color */
        }

        .btn-primary:hover {
            background-color: #0c457d; /* Darker blue background color on hover */
            border-color: #0c457d; /* Darker blue border color on hover */
        }

        .btn-secondary {
            background-color: #6c757d; /* Gray background color */
            border-color: #6c757d; /* Gray border color */
        }

        .btn-secondary:hover {
            background-color: #5a6268; /* Darker gray background color on hover */
            border-color: #5a6268; /* Darker gray border color on hover */
        }

        /* Add background image */
        .background-image {
            background-image: url('/assets/cart.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body class="background-image">
<nav class="navbar navbar-expand-lg navbar-light navbar-background">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation" style="border: transparent solid 1px; color: #1254a1; font-weight: bold">Categories</button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <li class="nav-item dropdown nav nav-pills">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
                <ul class="dropdown-menu ">
                    <c:forEach items="${categories}" var="category">
                        <li><a class="dropdown-item" href="/users/${category.name}">${category.name}</a></li>
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
            </i>
        </a>
        <a class="navbar-brand" href="/logout" style="color: #1254a1; font-weight: bold">Log out</a>
    </div>
</nav>
<div class="container">
    <h1>Shopping Cart</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cartItems}" var="cartItem">
            <tr>
                <td>${cartItem.product.productName}</td>
                <td>$${cartItem.product.price}</td>
                <td>
                    <img src="/assets/${cartItem.product.image}" alt="${cartItem.product.productName}" width="100" height="100">
                </td>
                <td>
                    <form:form action="/cart_item/${cartItem.id}/delete" method="delete">
                        <button class="btn btn-danger mx-1">Delete</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p class="text-end fs-4">Total Price: <span class="text-danger">$${totalPrice}</span></p>
    <div class="d-flex gap-3 justify-content-end">
        <form action="/shippingDetails" method="post">
            <input type="hidden" name="totalPrice" value="${totalPrice}">
            <input type="submit" class="btn btn-primary" value="Next">
        </form>

        <a href="/" class="btn btn-secondary">Cancel</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>