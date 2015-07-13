<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<t:layout pageTitle="GoTour">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li class="active">Tours</li>
      </ol>
      
      <ol>
        <c:forEach items="${cityList}" var="city">
          <li><c:out value="${city.name}" /></li>
        </c:forEach>
      </ol>
    </div>
  </div>
</t:layout>