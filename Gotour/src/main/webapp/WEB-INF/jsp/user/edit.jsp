<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<t:layout pageTitle="GoTour - Login">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li><a href="<c:url value="/users/${user.id}"/>">${user.name}</a></li>
        <li class="active">Edit</li>
      </ol>
      
      <form:form action="${context}/users/edit" class="form-login form-narrow form-horizontal" commandName="userForm" method="POST" enctype="multipart/form-data">
        <h3 class="title-divider">
          <span>Edit Profile</span> 
        </h3>
        
        <form:input type="hidden" path="id"/>
        <input type="hidden" name="type" value="${type}"/>
        
        <div class="form-group">
          <form:label path="name" class="col-sm-3">Name</form:label>
            <div class="col-sm-9">
            <form:input path="name" class="form-control"></form:input>
            </div>
          </div>
          <div class="form-group">
          <form:label path="email" class="col-sm-3">Email</form:label>
            <div class="col-sm-9">
            <form:input path="email" class="form-control"></form:input>
            </div>
          </div>
          <div class="form-group">
          <form:label path="description" class="col-sm-3">Description</form:label>
            <div class="col-sm-9">
            <form:textarea path="description" class="form-control"/>
          </div>
        </div>
        <c:if test="${type==1 && not empty user.tours}">
          <div class="form-group">
            <form:label path="phone" class="col-sm-3">Phone Number</form:label>
              <div class="col-sm-9">
              <form:textarea path="phone" class="form-control"/>
            </div>
          </div>
        </c:if>
        <div class="form-group">
          <form:label path="avatar" class="col-sm-3">Photo</form:label>
          <div class="col-sm-9">
            <input type="file" name="file" id="avatar" class="form-control"/>
          </div>
        </div>
        <div class="form-group">
          <form:label path="password" class="col-sm-3">Password</form:label>
          <div class="col-sm-9">
            <input type="password" name="password" id="password" class="form-control" placeholder="Enter password to confirm the data"/>
          </div>
        </div>
        <div class="form-group">
        <label for="conf_password" class="col-sm-3">New Password</label>
          <div class="col-sm-9">
            <input type="conf_ password" name="conf_password" id="conf_password" class="form-control" placeholder="Enter new password on this field if you need"/>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-3"></div>
          <div class="col-sm-6">
            <button class="btn btn-primary" type="submit">Save</button>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</t:layout>

