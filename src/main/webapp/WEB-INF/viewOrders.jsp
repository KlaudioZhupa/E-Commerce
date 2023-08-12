<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <style>
        .background-image {
            background-image: url('/assets/shopping_cart.gif');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>

</head>
<body class="background-image">
<ul class="nav nav-pills bg-dark d-flex justify-content-between p-2">
    <li class="nav-item">
        <a class="nav-link active"  href="/admin/home">Dashboard</a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
        <ul class="dropdown-menu">
            <c:forEach items="${categories}" var="category">
                <li><a class="dropdown-item" href="/admin/category/${category.id}">${category.name}</a></li>
            </c:forEach>
        </ul>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/admin/newCat">New Category</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/admin/newP">New Product</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
    </li>
</ul>
    <table class="container table table-striped border border-3 border-dark text-center mt-3">
        <thead>
        <tr>
            <th>OrderId</th>
            <th>Date of order</th>
            <th>Total Price</th>
            <th>Action</th>
        </tr>
        </thead>
    <tbody>
    <c:forEach items="${orders}" var="order">
        <tr>
            <td><a href="/admin/orderDetails/${order.id}">${order.id}</a></td>
            <td>${order.orderDate}</td>
            <td>${order.orderItem}</td>
            <td>Confirm</td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html>
