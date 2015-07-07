
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout pageTitle="GoTour">
  <div id="content">
  <div class="container">
    <!-- Add tour form -->
    <form class="form-login form-wrapper form-horizontal form-medium" role="form">
      <h3 class="title-divider">
        <span>Add Tour</span> 
       <!--  <small>Already signed up? <a href="login.htm">Login here</a>.</small>-->
      </h3>

      <div class="form-group">
        <label class="col-sm-3" for="addTour-name-page">Name Of Tour</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" id="addTour-name-page">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-price-page">Price</label>
        <div class="col-sm-9">
          <input type="email" class="form-control" id="addTour-price-page">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-description-page">Description</label>
        <div class="col-sm-9">
         <input type="password" class="form-control" id="addTour-description-page">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-points-interest-page">Points of interest</label>
        <div class="col-sm-9">
         <input type="password" class="form-control" id="addTour-points-interest-page">
         <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Add Points</button>

         <!-- Modal -->
          <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Add Point of interest</h4>
                </div>
                <div class="modal-body">
                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-language-page">Language</label>
        <div class="col-sm-6">
          <input type="language" class="form-control" id="addTour-language-page">
            <input type="button" id="adicionar" value="+"/>
            <input type="button" id="remover" value="-"/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-uploadPhoto-page">Upload Photo </label>
        <div class="col-sm-9">
         <input id="uploadImage" type="file" class="form-control">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3" for="addTour-uploadVideo-page">Upload Video </label>
        <div class="col-sm-9">
         <input id="uploadVideo" type="file" class="form-control">
        </div>
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox" value="term">
          I agree with the Terms and Conditions. 
        </label>
      </div>
      <button class="btn btn-primary" type="submit">Sign up</button>
    </form>
  </div>
</div>
</t:layout>

