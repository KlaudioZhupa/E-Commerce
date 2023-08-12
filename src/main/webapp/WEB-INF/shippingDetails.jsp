<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shipping Details</title>
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
        /*nav bar*/
        .navbar-background {
            background-color: #90caf9;
        }

        /* HEADER classes */
        .header {
            font-size: 40px;
            font-weight: bold;
            font-family: sans-serif;
            color: #1254a1;
            margin: 20px 0px;
        }

        .navbar-background {
            background-color: #f9f8f9; /* Light gray background color */
        }

        /* Add more styling rules as needed */

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

        label {
            color: #343a40; /* Dark gray text color */
        }

        /* Customize form input styling */
        .form-control {
            background-color: #f8f9fa; /* Light gray background color */
            border-color: #ced4da; /* Light gray border color */
            color: #212529; /* Dark gray text color */
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
            background-image: url('/assets/plane.jpg');
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
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Category</a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${categories}" var="category">
                            <li><a class="dropdown-item" href="/admin/${category.name}">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
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
        <a class="navbar-brand" href="/logout" style="color: #1254a1; font-weight: bold">Log out</a>
    </div>
</nav>
<div class="container">
    <h1>Shipping Details</h1>
    <form action="/shippingDetails" method="post" modelAttribute="shippingDetails">
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" class="form-control" id="firstName" name="firstName">
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" class="form-control" id="lastName" name="lastName">
        </div>

        <div class="form-group">
            <label for="address1">Address Line 1:</label>
            <input type="text" class="form-control" id="address1" name="address1">
        </div>

        <div class="form-group">
            <label for="address2">Address Line 2:</label>
            <input type="text" class="form-control" id="address2" name="address2">
        </div>

        <div class="form-group">
            <label for="country">Country:</label>
            <input type="text" class="form-control" id="country" name="country">
        </div>

        <div class="form-group">
            <label for="city">City:</label>
            <input type="text" class="form-control" id="city" name="city">
        </div>

        <div class="form-group">
            <label for="zipCode">Zip Code:</label>
            <input type="text" class="form-control" id="zipCode" name="zipCode">
        </div>

        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
        </div>
    </form>

    <div class="d-flex gap-3 justify-content-end mt-2">
        <form action="/checkout" method="post" id="checkout-form">
            <input type="hidden" name="totalPrice" value="${totalPrice}">
            <input type="hidden" name="stripeToken" value=""> <!-- Leave the value empty -->

            <input type="submit" class="btn btn-primary" value="Next">
        </form>
        <a href="/viewCart" class="btn btn-secondary">Cancel</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
