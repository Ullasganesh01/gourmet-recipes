<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />
</head>

<body>
    <div class="backend-msg text-center">
        <h1>Error Page</h1>
        <c:forEach items="${ errorList }" var="error">
            <li>
                ${error.getObjectName()} = ${error.getDefaultMessage()} =
                ${error.toString()}
            </li>
        </c:forEach>
        <div>
            <h4>${errorMsg}</h4>
            <h4>${IllegalMsg}</h4>
        </div>
    </div>
    <div class="text-center">
        <a href="login">
            <button type="button" class="btn btn-outline-danger btn-md me-2">
                BACK
            </button>
        </a>
    </div>

    <script src="./resources/cdn/popper.min.js"></script>
    <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>
</body>

</html>