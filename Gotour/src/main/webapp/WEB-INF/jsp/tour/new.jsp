<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  

<t:layout pageTitle="GoTour">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li><a href="<c:url value="/tours"/>">Tours</a></li>
        <li class="active">Create</li>
      </ol>

      <div class="alert alert-success" id="notice-success">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4>
          Looking good!
        </h4>
        All systems are go!! 
      </div>

      <div class="alert alert-danger" id="notice-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <h4>
          Error!
        </h4>
        Server meltdown pending!!!
      </div>

      <!-- Add tour form -->
      <form:form action="create" class="form-login form-narrow form-medium form-horizontal" method="POST" role="form" commandName="tourForm">
        <h3 class="title-divider">
          <span>Create <span class="de-em">Tour</span></span>
          <small>Add a new tour for a city!</small>
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
            <form:select path="theme.id" id="tour_theme" class="form-control"  items="${themeList}" itemValue="id" itemLabel="name" />
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
        <div class="price form-group">
          <form:label path="normalPrice" class="col-sm-4">Price</form:label>
            <div class="col-sm-2">
            <form:input path="normalPrice" class="form-control" placeholder="Normal €" />
          </div>
          <div class="col-sm-2">
            <form:input path="studentPrice" class="form-control" placeholder="Student €" />
          </div>
        </div>
        <div class="checkbox"></div>

        <div class="form-group">
          <div class="col-sm-4"></div>
          <div class="col-sm-8">
            <button class="btn btn-primary" type="submit"value="submit">Submit</button>
            <button class="btn btn-default" type="reset" value="Reset">Reset</button>
          </div>
        </div>
      </form:form>
    </div>
  </div>

  <!-- MODAL -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Create a Point of Interest for <small id="poi-title">City</small></h4>
        </div>
        <form role="form" enctype="multipart/form-data">
          <div class="modal-body">
            <h5>
              Point of Interest Information
            </h5>

            <input value="x" id="poi-city" type="hidden" type="text">

            <div class="form-group">
              <label class="sr-only" for="poi_name">Name</label>
              <input type="text" class="form-control" id="poi-name" placeholder="Name" required="true">
            </div>
            <div class="form-group">
              <label class="sr-only" for="poi_desc">Description</label>
              <input type="text" class="form-control" id="poi-desc" placeholder="Description" required="true">
            </div>
            <div class="form-group">
              <label class="sr-only" for="poi-coord">GPS coordinates</label>
              <input type="text" class="form-control" id="poi-coord" placeholder="GPS Coordinates" required="true">
            </div>
            <div class="form-group">
              <label class="sr-only" for="poi-coord">Image</label>
              <input type="file" class="form-control" id="poi-image" required="true">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="poi-save btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</t:layout>

<script>

</script>