<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Order Details</title>
</head>
<body>
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
<div class="container mt-5">
    <h4>Details of order with id: ${order.id}</h4>
    ${order.notes}
    <c:forEach items="${order.orderItem}" var="item">
        ${item.product}
        ${item.quantity}
        ${item.product.price}
        ${item.quantity * item.product.price}
    </c:forEach>
</div>
</body>
</html>