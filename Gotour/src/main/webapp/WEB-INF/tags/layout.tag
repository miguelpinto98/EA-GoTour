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
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/colour-blue.css" />
    <link rel="stylesheet" type="text/css" href="${context}/resources/css/select2.css" />
    
    <!-- JS -->
    <script src="${context}/resources/js/jquery.min.js"></script>
    <script src="${context}/resources/js/bootstrap.min.js"></script>
    <script src="${context}/resources/js/script.min.js"></script>
    <script src="${context}/resources/js/select2.full.js"></script>
    <script src="${context}/resources/js/select2.sortable.js"></script>
    <script src="${context}/resources/js/app.js"></script>
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Rambla' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Calligraffitti' rel='stylesheet' type='text/css'>
  </head>
  <body class="page">
    <!-- HEADER -->
    <div id="navigation" class="wrapper">
      <jsp:include page="/WEB-INF/jsp/header.jsp" />
    </div>
    
    <!-- BODY -->
    <jsp:doBody/>
    
    <!-- FOOTER -->
    <footer id="footer">
      <jsp:include page="/WEB-INF/jsp/footer.jsp" />
    </footer>
  </body>
</html>
