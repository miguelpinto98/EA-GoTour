<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@attribute name="pageTitle" required="false" type="java.lang.String" %>

<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${pageTitle}</title>
    
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/app.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/flag-icon.min.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/custom-style.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/theme-style.min.css" />
    
    <!-- JS -->
    <script src="${context}/resources/js/app.js"></script>
    <script src="${context}/resources/js/jquery.min.js"></script>
    <script src="${context}/resources/js/bootstrap.min.js"></script>
    <script src="${context}/resources/js/script.min.js"></script>
  </head>
  <body>
    <!-- HEADER -->
    <div id="navigation" class="wrapper">
      <jsp:include page="header.jsp" />
    </div>
    
    <!-- BODY -->
    <div id="content">
      <jsp:doBody/>
    </div>
    
    <!-- FOOTER -->
    <footer id="footer">
      <jsp:include page="footer.jsp" />
    </footer>
  </body>
</html>
