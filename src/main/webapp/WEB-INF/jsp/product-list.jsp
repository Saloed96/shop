<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="resourceContext" value="${pageContext.request.contextPath}"/>

<html lang="en">
<head>
    <div th:replace="fragments/header :: header">
    </div>
    <title>Product List</title>
    <link rel="stylesheet" href="${resourceContext}/bootstrap.min.css">
    <link rel="stylesheet" href="${resourceContext}/layout.css">
    <link rel="stylesheet" href="${resourceContext}/style.css">
    <script type="text/javascript" src="${resourceContext}/bootstrap.bundle.min.js"></script>
</head>
<body>
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
                    <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
                        <a href="/cart?add&prodId=${prod.id}" class="btn btn-info" role="button">Add to Cart</a>
                        <a href="/order?prodId=${prod.id}" class="btn btn-info" role="button">Buy</a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="/product/edit/${prod.id}" class="btn btn-warning" role="button">Edit</a>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="/product/delete/${prod.id}" class="btn btn-warning" role="button">Delete</a>
                    </sec:authorize>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="action-box">
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/product" class="btn btn-warning" role="button">New product</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a href="/user" class="btn btn-warning" role="button">Add New User</a>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
            <a href="/login" class="btn btn-warning" role="button">Login</a>
        </sec:authorize>
        <sec:authorize access="!hasRole('ROLE_ANONYMOUS')">
            <a href="/logout" class="btn btn-warning" role="button">Logout</a>
        </sec:authorize>
    </div>

</div>
</body>
</html>
