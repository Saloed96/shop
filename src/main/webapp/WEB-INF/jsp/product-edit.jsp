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

    <title>Product Edit</title>

    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/layout.css">
    <link rel="stylesheet" href="${resourceContext}/src/main/webapp/style.css">
    <script type="text/javascript" src="${resourceContext}/src/main/webapp/static/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="static/js/html5shiv.min.js"></script>
    <script src="static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="products" class="navbar-brand">Online Shop</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/products">Product List</a></li>
                <li><a href="/product">New Product</a></li>
                <li><a href="/cart">Cart</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container center">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="margin-top: 150px;">
            <form:form modelAttribute="product">
                <fieldset>
                    <form:label path="title">Title:</form:label>
                    <br/>
                    <form:input path="title"/>
                    <br/>
                    <form:label path="title">Description:</form:label>
                    <br/>
                    <form:input path="description"/>
                    <br/>
                    <form:label path="title">Cost:</form:label>
                    <br/>
                    <form:input path="cost"/>
                    <br/>
                    <form:label path="title">Balance:</form:label>
                    <br/>
                    <form:input path="balance"/>
                    <br/>
                    <%--<form:label path="title">Image:</form:label>--%>
                    <%--<br/>--%>
                    <%--<form:button name="Browse" value="/browse" path="image"/>--%>
                    <%--<br/>--%>
                    <p>
                        <label for="image">Product Images: </label>
                        <input type="file" name="image" multiple="multiple"/>
                    </p>
                </fieldset>
                <input type="submit" value="Save" class="btn-primary form-control" style="margin-top: 20px;"/>
            </form:form>
        </div>
    </div>

</div>

</body>
</html>
