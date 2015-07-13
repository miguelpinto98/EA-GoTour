<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:layout pageTitle="GoTour - Sign Up">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li class="active">Sign Up</li>
      </ol>
      
      <form:form method="POST" action="new" class="form-login form-wrapper form-medium form-horizontal" role="form" commandName="userForm">
        <h3 class="title-divider">
          <span>Sign Up</span> 
          <small>Already signed up? <a href="<c:url value="/users/login"/>">Login here</a>.</small>
        </h3>

        <div class="form-group">
          <label class="col-xs-3" for="type">Type</label>
          <div class="col-xs-9">
            <select name="userType" class="form-control" id="user-type">
              <option value="0">Tourist</option>
              <option value="1">Guide</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <form:label path="name" class="col-sm-3">Name</form:label>
            <div class="col-sm-9">
            <form:input path="name" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <form:label path="email" class="col-sm-3">Email</form:label>
            <div class="col-sm-9">
            <form:input path="email" type="email" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <form:label path="password" class="col-sm-3">Password</form:label>
            <div class="col-sm-9">
            <form:input path="password" type="password" class="form-control" />
          </div>
        </div>
        <div class="phone form-group" style="display: none;">
          <label for="phone" class="col-sm-3">Phone</label>
          <div class="col-sm-9">
            <input name="phone" type="text" class="form-control" id="phone" >
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-3"></div>
          <div class="col-xs-9">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="term">I agree with the Terms and Conditions.
              </label>
            </div>
            <br/>
            <button class="btn btn-primary" type="submit">Sign up</button>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</t:layout>