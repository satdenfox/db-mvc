<%--
  Created by IntelliJ IDEA.
  User: denis
  Date: 19.08.2017
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add customer form</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/site.css"/>

</head>
<body>
<div class="container">
    <hr>
    <div id="header" class="text-success text-center">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
    <hr>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h6>Add new Customer</h6>
                </div>
                <div class="card-body">
                    <form:form modelAttribute="customer" action="/customer/add" method="post">
                        <div class="form-group">
                            <label for="textInput">First name</label>
                            <form:input path="firstName" class="form-control" id="textInput" placeholder="Type Customer's first name here"/>
                        </div>
                        <div class="form-group">
                            <label for="textInput2">Last name name</label>
                            <form:input path="lastName" class="form-control" id="textInput2" placeholder="Type Customer's last name here"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail">Email address</label>
                            <form:input path="email" type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter email"/>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a class="btn btn-warning" href="/customer/list">Cancel</a>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

</body>
</html>
