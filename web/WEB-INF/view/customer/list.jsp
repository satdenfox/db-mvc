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
    <title>This is customer list</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/site.css"/>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

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
                <a class="btn btn-success" href="/customer/showFormForAdd">Add new Customer</a>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${customers}" var="customer">
                            <%--Передача через параметр--%>
                            <c:url var="updateLink" value="/customer/showFormForUpdate">
                                <c:param name="id" value="${customer.id}"/>
                            </c:url>
                            <tr>
                                <td>${customer.firstName}</td>
                                <td>${customer.lastName}</td>
                                <td>${customer.email}</td>
                                <td class="text-center">
                                    <a href="${updateLink}" class="btn btn-info btn-sm">Update</a>
                                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" id="${customer.id}">Delete</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure to delete the Customer?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <a type="button" class="btn btn-primary link-to-change" href="">Delete</a>
                </div>
            </div>
        </div>
    </div>


    <script>
        $(function () {
            $('#deleteModal').on('show.bs.modal', function(e) {
                $('.link-to-change').attr("href", "/customer/delete/" + e.relatedTarget.id);
            });
        });

    </script>

</body>
</html>
