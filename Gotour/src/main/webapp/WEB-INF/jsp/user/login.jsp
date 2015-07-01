<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - Login">
  <div id="content">
    <div class="container">
      <form:form method="POST" action="/users/signin" class="form-login form-wrapper form-medium form-horizontal" role="form">
        <h3 class="title-divider">
          <span>Login</span> 
          <small>Not signed up? <a href="<c:url value="/users/signup"/>">Sign up here</a>.</small>
        </h3>
        <div class="form-group">
          <label class="col-sm-3" for="login-email-page">Email</label>
          <div class="col-sm-9">
            <input type="email" id="login-email-page" class="form-control email" placeholder="Email">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="login-password-page">Password</label>
          <div class="col-sm-9">
            <input type="password" id="login-password-page" class="form-control password" placeholder="Password">
          </div>
        </div>
        <button type="button" class="btn btn-primary">Login</button>
        | <a href="#">Forgotten Password?</a> 
      </form:form>
    </div>
  </div>
</t:layout>