<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Login/Register</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
<div class="main">
    <input type="checkbox" id="chk" aria-hidden="true">
    <div class="signup">
        <form:form modelAttribute="newUser" action="/register" method="post">
            <label for="chk" aria-hidden="true">Sign up</label>
            <div>
                    <form:errors path="username" class="errors text-danger"/>
                    <form:input path="username" type="text" placeholder="Username" />
            </div>
            <div>
                    <form:errors path="firstname" class="errors text-danger"/>
                    <form:input path="firstname" type="text" placeholder="FirstName"/>
            </div>
            <div>
                    <form:errors path="lastname" class="errors text-danger"/>
                    <form:input path="lastname" type="text" placeholder="Lastname"/>
            </div>
            <div>
                    <form:errors path="email" class="errors text-danger"/>
                    <form:input path="email" type="text" placeholder="Email"/>
            </div>
            <div>
                    <form:errors path="password" class="errors text-danger"/>
                    <form:input path="password" type="password" placeholder="Password"/>
            </div>
            <div>
                    <form:errors path="confirm" class="errors text-danger"/>
                    <form:input path="confirm" type="password" placeholder="Confirm Password"/>
            </div>

            <div>
                    <button>Sign Up</button>
            </div>
        </form:form>
    </div>

    <div class="login">
            <form:form modelAttribute="newLogin" action="/login" method="post">
                <label for="chk" aria-hidden="true">Login</label>
                <div>
                        <form:errors path="email" class="errors text-danger"/>
                        <form:input path="email" type="text" placeholder="Email"/>
                </div>
                <div>
                        <form:input path="password" placeholder="Password" type="password" class="form-control"/>
                        <form:errors path="password" class="errors text-danger"/>
                </div>
                <div>
                    <button>Login</button>
                </div>
            </form:form>
    </div>
</div>
</body>
</html>
