<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="resourceContext" value="${pageContext.request.contextPath}" />

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>Product List</title>
    <link rel="stylesheet" href="../../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resourceContext}/layout.css">
    <link rel="stylesheet" href="${resourceContext}/style.css">
    <script type="text/javascript" src="../../static/js/bootstrap.min.js"></script>
</head>
<body>
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="products" class="navbar-brand">Online Shop</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/products">Product List</a></li>
                <li><a href="/product">New Product</a></li>
                <li><a href="/cart" class="alert-link">Cart</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="center">

    <ul class="cart-list">
        <c:forEach items="${products}" var="prod">
            <li class="cart-item">
                <h3>${prod.title}</h3>
                <a href="/cart?delete&prodId=${prod.id}" class="btn btn-danger" role="button">Remove</a>
            </li>
        </c:forEach>
    </ul>

    <div class="action-box">
        <a href="/products" class="btn btn-info" role="button">Back to products</a>
    </div>

</div>
</body>
</html>