<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns='http://www.w3.org/1999/xhtml' xmlns:th='http://www.thymeleaf.org'>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: 'arial';
        }
        #checkout-form input,
        #checkout-form button {
            display: block;
            margin: 12px;
        }

        /* Add background image */
        .background-image {
            background-image: url('/assets/credit_card.jpg');
            background-size: cover;
            background-repeat: no-repeat;
        }

    </style>
</head>
<body class="background-image">
<form action='/charge' method='POST' id='checkout-form'>
    <input type='hidden' th:value='${amount}' name='amount' />
    <label>Price:<span th:text='${amount/100}' /></label>
    <!-- NOTE: data-key/data-amount/data-currency will be rendered by Thymeleaf -->
    <script src="/resources/static/js/checkout.js"></script> <!-- Include your checkout.js script here -->

    <script
            src='https://checkout.stripe.com/checkout.js'
            class='stripe-button'
            th:attr='data-key=${stripePublicKey},
                         data-amount=${amount},
                         data-currency=${currency}'
            data-name='Checkout'
            data-description='Do not be so cheap, just click pay;)'
            data-image='http://www.baeldung.com/wp-content/themes/baeldung/favicon/android-chrome-192x192.png'
            data-locale='auto'
            data-zip-code='false'>
    </script>
</form>
</body>
</html>