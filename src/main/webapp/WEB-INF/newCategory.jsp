<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Add Category</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<ul class="nav nav-pills bg-dark p-2 d-flex justify-content-between">
    <li class="nav-item">
        <a class="nav-link" href="/admin/home">Dashboard</a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
        <ul class="dropdown-menu">
            <c:forEach items="${category}" var="category">
                <li><a class="dropdown-item" href="/admin/category/${category.id}">${category.name}</a></li>
            </c:forEach>
        </ul>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="/admin/newCat">New Category</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/admin/newP">New Product</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
    </li>
</ul>
<table class="container table table-striped-columns table-bordered form border border-dark border-3 mt-3">
    <tbody>
    <form:form modelAttribute="newCategory" action="/admin/newCategory" method="post" class="form gap-3 d-flex flex-column">
    <tr>
        <td class="col-sm-6">
            <form:label path="name" class="ms-2 fw-semibold col-form-label">Category Name:</form:label></td>
        <td>
            <form:errors path="name" class="errors text-danger"/>
            <form:input path="name" type="text" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="categoryImage" class="ms-2 fw-semibold col-form-label">Category Image:</form:label></td>
        <td>
            <form:errors path="categoryImage" class="errors text-danger"/>
            <form:input path="categoryImage" type="file" class="form-control"/>
        </td>
    </tr>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="2">
            <input class="form-control btn btn-primary" type="submit" value="Submit">
        </td>
    </tr>
    </tfoot>
    </form:form>
</table>

<table class="container w-25 table table-striped-columns table-bordered form border border-dark border-3 mt-3">
    <c:forEach items="${category}" var="cat">
        <tr>
            <td class="col-5">Category Name: </td>
            <td>${cat.name}</td>
            <td><form:form action="/admin/${cat.id}/deleteCat" method="delete">
                <button class="btn btn-danger mx-1">Delete</button>
            </form:form></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
