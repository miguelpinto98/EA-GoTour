<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:layout pageTitle="GoTour - Sign Up">
  <div id="content">
    <div class="container">
      <form:form method="POST" action="new" class="form-login form-wrapper form-medium form-horizontal" role="form">
        <h3 class="title-divider">
          <span>Sign Up</span> 
          <small>Already signed up? <a href="<c:url value="/users/login"/>">Login here</a>.</small>
        </h3>

        <div class="form-group">
          <label class="col-sm-3" for="signup-first-name-page">First Name</label>
          <div class="col-sm-9">
            <input name="name" type="text" class="form-control" id="signup-first-name-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="signup-last-name-page">Last Name</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="signup-last-name-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="signup-email-page">Email</label>
          <div class="col-sm-9">
            <input name="email" type="email" class="form-control" id="signup-email-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="signup-password-page">Password</label>
          <div class="col-sm-9">
            <input type="password" class="form-control" id="signup-password-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="signup-phone-page">Phone</label>
          <div class="col-sm-9">
            <input type="phone" class="form-control" id="signup-phone-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-3" for="signup-type-page">Type</label>
          <div class="col-xs-9 selectContainer">
            <select class="form-control" id="signup-type-page">
              <option>Tourist</option>
              <option>Guide</option>
            </select>
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
        <br/>
      </form:form>
    </div>
  </div>
</t:layout>