<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - edit">
  <div id="content">
  <div class="container">
    <!-- Edit tour form -->
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

    <form:form action="edit" class="form-login form-narrow form-medium form-horizontal" method="POST" role="form" commandName="tourForm">
        <h3 class="title-divider">
          <span>Edit <span class="de-em">Tour</span></span>
          <small>Edit a for a city!</small>
        </h3>

      <div class="form-group">
          <form:label path="name" class="col-sm-4">Name</form:label>
          <div class="col-sm-6">
            <form:input path="name" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <form:label path="description" class="col-sm-4">Description</form:label>
            <div class="col-sm-6">
            <form:textarea path="description" class="form-control" />
        </div>
      </div>
      <div class="form-group">
          <form:label path="theme" class="col-sm-4">Thematic</form:label>
            <div class="col-sm-6">
            <form:select path="theme.id" class="form-control"  items="${themeList}" itemValue="id" itemLabel="name" />
          </div>
      </div>
      <div class="form-group">
          <form:label path="city.id" class="col-sm-4">City</form:label>
            <div class="col-sm-6">
            <form:select path="city.id" id="tour_city" class="form-control"  items="${cityList}" itemValue="id" itemLabel="name" />
          </div>
        </div>
        <div class="form-group">
          <form:label path="pointsOfInterest" class="col-sm-4">Points of Interest</form:label>
            <div class="col-sm-4">
              <!--<select class="poi-multiple form-control" multiple="multiple" style="width: 100%">
                <option value="AL">Alabama</option>
                <option value="AL">ccccc</option>
              </select>-->
            <form:select path="points" class="poi-multiple form-control" multiple="multiple">
              <c:forEach items="${poisList}" var="poi">
                <option value="${poi.id}">${poi.name}</option>
              </c:forEach>
            </form:select>
          </div>
          <div class="col-sm-1">
            <a href="#" class="poi-add">
              <i class="fa fa-plus fa-2x"></i>
            </a>
          </div>
        </div>
      <div class="form-group">
          <form:label path="duration" class="col-sm-4">Duration</form:label>
            <div class="col-sm-4">
            <form:input path="duration" class="form-control" />
          </div>
        </div>
        
      <div class="form-group">
        <form:label path="language" class="col-sm-4">Language</form:label>
          <div class="col-sm-4">
            <form:input path="language" class="form-control" />
          </div>
          <div class="col-sm-1">
            <a href="#" class="poi-add">
              <i class="fa fa-plus fa-2x"></i>
              <i class="fa fa-minus fa-2x"></i>
            </a>
          </div>
        </div>
      <div class="form-group">
          <form:label path="normalPrice" class="col-sm-4">Price</form:label>
            <div class="col-sm-2">
            <form:input path="normalPrice" class="form-control" placeholder="Normal €"/>
          </div>
          <div class="col-sm-2">
            <form:input path="studentPrice" class="form-control" placeholder="Student €"/>
          </div>
          <div class="col-sm-2">
            <div class="checkbox">
              <label>
                <form:checkbox path="free"/>It's free.
              </label>
            </div>
          </div>
      </div>
      <div class="form-group">
        <form:label path="photo" class="col-sm-4">Upload Photo </form:label>
          <div class="col-sm-4">
            <input id="uploadImage" type="file" class="form-control">
          </div>
      </div>
      <div class="form-group">
        <form:label path="video" class="col-sm-4">Upload Video </form:label>
          <div class="col-sm-4">
            <input id="uploadImage" type="file" class="form-control">
          </div>
      </div>
    
      <div class="checkbox">
        <label>
          <input type="checkbox" value="term">
          I agree with the Terms and Conditions. 
        </label>
      </div>
      <button class="btn btn-primary" type="submit">Save</button>
    </form:form>
  </div>
  </div>
</t:layout>
