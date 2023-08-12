<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Add Category/Product</title>
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
        <a class="nav-link" href="/admin/newCat">New Category</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="/admin/newP">New Product</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
    </li>
</ul>
<table class="container table table-striped-columns table-bordered form border border-dark border-3 mt-3">
    <tbody>
    <form:form modelAttribute="newProduct" action="/admin/newProduct" method="post" class="form gap-3 d-flex flex-column">
    <tr>
        <td class="col-sm-6">
            <form:label path="productName" class="ms-2 fw-semibold col-form-label">Product Name:</form:label></td>
        <td>
            <form:errors path="productName" class="errors text-danger"/>
            <form:input path="productName" type="text" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="category" class="ms-2 fw-semibold col-form-label">Category:</form:label></td>
        <td>
            <select class="form-control border-dark" name="categoryId" id="categoryId">
            <c:forEach var="categoryP" items="${category}">
                <option value="${categoryP.id}">${categoryP.name}</option>
            </c:forEach>
        </select>

        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="brand" class="ms-2 fw-semibold col-form-label">Brand:</form:label></td>
        <td>
            <form:errors path="brand" class="errors text-danger"/>
            <form:input path="brand" type="text" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="color" class="ms-2 fw-semibold col-form-label">Color:</form:label></td>
        <td>
            <form:errors path="color" class="errors text-danger"/>
            <form:input path="color" type="text" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="image" class="ms-2 fw-semibold col-form-label">Image:</form:label></td>
        <td>
            <form:errors path="image" class="errors text-danger"/>
            <form:input path="image" type="file" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="description" class="ms-2 fw-semibold col-form-label">Description:</form:label>
        </td>
        <td>
            <form:errors path="description" class="errors text-danger"/>
            <form:textarea path="description" type="text" class="form-control"/>
        </td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="price" class="ms-2 fw-semibold col-form-label">Price</form:label>
        </td>
        <td>
            <form:errors path="price" class="errors text-danger"/>
            <form:input path="price" type="number" class="form-control"/></td>
    </tr>
    <tr>
        <td class="col-sm-6">
            <form:label path="quantity" class="ms-2 fw-semibold col-form-label">Quantity</form:label>
        </td>
        <td>
            <form:errors path="quantity" class="errors text-danger"/>
            <form:input path="quantity" type="number" class="form-control"/></td>
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


</body>
</html>
