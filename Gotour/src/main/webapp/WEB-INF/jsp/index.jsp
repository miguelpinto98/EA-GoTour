<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gotour</title>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/app.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/bootstrap.min.css" />
    
    <!-- JS -->
    <script src="${context}/resources/js/app.js"></script>
  </head>
  <body>
    <h4>Gotour</h4>
    Spring says: <span class="blue">${msg}</span>
  </body>
</html>
