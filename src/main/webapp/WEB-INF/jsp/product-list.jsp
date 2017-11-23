<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="resourceContext" value="${pageContext.request.contextPath}"/>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>Product List</title>

    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/static/css/layout.css">
    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/static/css/style.css">
    <script type="text/javascript" src="${resourceContext}/src/main/webapp/static/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="static/js/html5shiv.min.js"></script>
    <script src="static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="product" class="navbar-brand">Online Shop</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="products">Product List</a></li>
                <li><a href="product">New Product</a></li>
                <li><a href="cart">Cart</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container" id="homeDiv">
    <div class="jumbotron text-center">
        <h1>Welcome to Online-Shop</h1>
    </div>
</div>

<script src="../../static/js/jquery-1.11.1.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>

<%--
<form:form modelAttribute="searchForm">
    <form:input path="searchText"/>
    <input type="submit" value="Search"/>
</form:form>

<ul>
    <c:forEach items="${products}" var="prod">
        <li>
            <h3>${prod.title} ( ${prod.balance} )</h3>
            <p>${prod.description}</p>
            <a href="/product/${prod.id}">Edit</a>
        </li>
    </c:forEach>
</ul>

<div>
    <a href="${pageContext.request.contextPath}/product">New product</a>
</div>
--%>


<div class="center">

    <form:form modelAttribute="searchForm" cssClass="search-box">
        <form:input path="searchText"/>
        <input type="submit" class="btn btn-success" value="Search"/>
    </form:form>

    <ul class="prod-list">
        <c:forEach items="${products}" var="prod">
            <li class="prod-item">
                <h3>${prod.title} ( ${prod.balance} )</h3>
                <p>${prod.description}</p>
                <div class="action-box">
                    <a href="#" class="btn btn-info" role="button">Add to Cart</a>
                    <a href="#" class="btn btn-info" role="button">Buy</a>
                    <a href="/product/edit/${prod.id}" class="btn btn-warning" role="button">Edit</a>
                    <a href="/product/delete/${prod.id}" class="btn btn-danger" role="button">Delete</a>

                </div>
            </li>
        </c:forEach>
    </ul>


    <div class="action-box">
        <a href="/product" class="btn btn-warning" role="button">New product</a>
    </div>

</div>


</body>
</html>
