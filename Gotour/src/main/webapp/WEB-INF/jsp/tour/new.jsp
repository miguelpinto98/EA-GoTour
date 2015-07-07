<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout pageTitle="GoTour">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">Tours</a></li>
        <li class="active">Create</li>
      </ol>
      <!-- Add tour form -->
      <form class="form-login form-narrow form-medium form-horizontal" role="form">
        <h3 class="title-divider">
          <span>Create <span class="de-em">Tour</span></span> 
          <small>Add a new tour for a city!</small>
        </h3>

        <div class="form-group">
          <label class="col-sm-4" for="name">Name</label>
          <div class="col-sm-8">
            <input type="text" class="form-control" id="name">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4" for="desc">Description</label>
          <div class="col-sm-8">
            <textarea class="form-control" id="desc"></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4" for="city">City</label>
          <div class="col-sm-6">
            <select class="form-control" id='city'>
              <option>Porto</option>
              <option>Braga</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4" for="poi">Points of Interest</label>
          <div class="col-sm-6">
          </div>
          <div class="col-sm-1">
            <a href="#">
              <i class="fa fa-plus fa-2x"></i>
            </a>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4" for="duration">Duration</label>
          <div class="col-sm-6">
            <input type="text" class="form-control" id="duration">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-4" for="price">Price</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" id="price" placeholder="Normal">
          </div>
          <div class="col-sm-2">
            <input type="text" class="form-control" placeholder="Student">
          </div>
          <div class="col-sm-2">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="fre">It's free.
              </label>
            </div>
          </div>
        </div>

        <div class="form-group">
          <label class="col-sm-4" for="lang">Language</label>
          <div class="col-sm-6">
            <select class="form-control" id="lang">
              <option>Portuguese</option>
              <option>English</option>
              <option>Spanish</option>
            </select>
          </div>
          <div class="col-sm-1">
            <a href="#">
              <i class="fa fa-plus fa-2x"></i>
            </a>
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
      </form>
    </div>
  </div>
</t:layout>