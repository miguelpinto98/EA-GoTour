<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - Login">
  <div id="content">
    <div class="container">
      <form class="form-login form-narrow form-medium form-horizontal">
        <h3 class="title-divider">
          <span>Edit Profile</span> 
        </h3>
        <div class="form-group">
          <label class="col-xs-3" for="editeProfile-type-page">Type</label>
          <div class="col-xs-9 selectContainer">
            <select class="form-control" id="editeProfile-type-page">
              <option>Tourist</option>
              <option>Gide</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-first-name-page">First Name</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="editeProfile-first-name-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-last-name-page">Last Name</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="editeProfile-last-name-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-username-page">Username</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="editeProfile-username-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-email-page">Email</label>
          <div class="col-sm-9">
            <input type="email" class="form-control" id="editeProfile-email-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-password-page">Password</label>
          <div class="col-sm-9">
            <input type="password" class="form-control" id="editeProfile-password-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-phone-page">Phone</label>
          <div class="col-sm-9">
            <input type="phone" class="form-control" id="editeProfile-phone-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-descripton-page">Descripton</label>
          <div class="col-sm-9">
            <input type="phone" class="form-control" id="editeProfile-descripton-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-uploadPhoto-page">Upload Photo </label>
          <div class="col-sm-9">
            <input id="uploadImage" type="file" class="form-control">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-hangouts-page">Hangouts</label>
          <div class="col-sm-9">
            <input type="hangouts" class="form-control" id="editeProfile-hangouts-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-hangouts-page">Facebook</label>
          <div class="col-sm-9">
            <input type="hangouts" class="form-control" id="editeProfile-hangouts-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3" for="editeProfile-hangouts-page">LinkedIn</label>
          <div class="col-sm-9">
            <input type="hangouts" class="form-control" id="editeProfile-hangouts-page">
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-3" for="editeProfile-type-page">Type</label>
          <div class="col-xs-9 selectContainer">
            <select class="form-control" id="editeProfile-type-page">
              <option>Tourist</option>
              <option>Gide</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-3"></div>
          <div class="col-sm-6">
            <button class="btn btn-primary" type="submit">Save</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</t:layout>

