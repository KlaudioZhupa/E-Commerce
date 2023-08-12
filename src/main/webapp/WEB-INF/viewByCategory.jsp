<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Products By Category</title>
    <style>
        .background-image {
            background-image: url('/assets/giphy.gif');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body class="background-image">
<ul class="nav nav-pills bg-dark p-2 d-flex justify-content-between">
    <li class="nav-item">
        <a class="nav-link" href="/admin/home">Dashboard</a>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
        <ul class="dropdown-menu">
            <c:forEach items="${category}" var="category">
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
        <th>Product Name</th>
        <th>Brand</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.productName}</td>
            <td>${product.brand}</td>
            <td>${product.quantity}</td>
            <td>${product.price}£</td>
            <td class="d-flex justify-content-center">
                <a href="/admin/${product.id}/edit">
                    <button class="btn btn-primary mx-1">Edit</button>
                </a>
                <form:form action="/admin/${product.id}/delete" method="delete">
                    <button class="btn btn-danger mx-1">Delete</button>
                </form:form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>