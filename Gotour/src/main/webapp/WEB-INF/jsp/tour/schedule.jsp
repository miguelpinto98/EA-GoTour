<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<t:layout pageTitle="GoTour">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li><a href="<c:url value="/tours"/>">Tours</a></li>
        <li><a href="<c:url value="/tours/${tour.id}"/>">${tour.name}</a></li>
        <li class="active">Schedule</li>
      </ol>
      <div class="row">
        <div class="col-md-6">
          <h2 class="title-divider">
            <span>Schedule <span class="de-em">Tours</span></span>
            <small></small>
          </h2>

          <form:form action="${context}/tours/schedule" commandName="enrollment" role="form" method="POST" >

            <form:input path="tour.id" type="hidden" value="${tour.id}" />

            <div class="form-group">
              <form:label path="date">Date</form:label>
              
              <div class="input-group date" id="datetimepicker1">
                <form:input path="date" class="form-control" placeholder="End date" />
                <span class="input-group-addon">
                  <span class="glyphicon glyphicon-calendar"></span>
                </span>
              </div>
            </div>
            <div class="form-group">
              <form:label path="maxEnrollments">Maximum number of enrollments</form:label>
              <form:input path="maxEnrollments" type="number" class="form-control" placeholder="Maximum number of entries" />
            </div>
            <div class="form-group">
              <form:label path="language">Language</form:label>
              <form:select path="language.id" items="${langList}" itemValue="id" itemLabel="name" class="form-control" />
            </div>
            <div class="form-group">
              
            </div>



            <button class="btn btn-primary" type="submit"value="submit">Submit</button>
            <button class="btn btn-default" type="reset" value="Reset">Reset</button>
          </form:form>
        </div>
        <!-- Tour Information -->
        <div class="col-md-6">
          <h2 class="title-divider">
            <span>Tour <span class="de-em">Information</span></span>
            <small></small>
          </h2>
        </div>
      </div>
    </div>
  </div>
</t:layout>

<script type="text/javascript">
  $(function () {
    $('#datetimepicker1').datetimepicker();
  });
</script>