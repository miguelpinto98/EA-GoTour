<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!-- ======== @Region: #content ======== -->
<t:layout pageTitle="${tour.name}">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li><a href="<c:url value="/tours/"/>">Tours</a></li>
        <li class="active">${tour.name}</li>
      </ol>
      <h2 class="title-divider">
        <span>${tour.name} <span class="de-em">${city.name}</span></span>
        <small>${theme.name} Tour</small>
      </h2>

      <div class="col-md-9">

        <div class="jumbotron">

          <c:choose>
            <c:when test="${empty enrollments}">
              <h2>There is no available date right now.</h1>
              </c:when>
              <c:otherwise>
                <h2>Book Now!</h1>
                </c:otherwise>
              </c:choose>
              <div class="btn-group">
                <select id="language" class="form-control" style="width:175px">
                  <option value="" selected disabled>Select a language</option>
                  <c:forEach items="${idioms}" var="idiom">
                    <option value="${idiom.id}">${idiom.name}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="btn-group" style="width:200px">
                <select id="tour_date" class="form-control" disabled>
                  <option id="default_date" value="-1" selected disabled>Select a date</option>
                  <c:forEach items="${enrollments}" var="enrollment">
                    <option value="${enrollment.id}" languageId="${enrollment.language.id}" hidden><joda:format value="${enrollment.date}" style="SS" /> (${enrollment.date.dayOfWeek().getAsShortText()})</option>
                  </c:forEach>
                </select>
              </div>

              <div class="btn-group">
                <select id="tickets" class="form-control" style="width: 120px" disabled>
                  <c:forEach var="i" begin="1" end="10">
                    <option>${i} Ticket<c:if test="${i > 1}">s</c:if></option>
                  </c:forEach>
                </select>
              </div>

              <c:choose>
                <c:when test="${user != null}">
                  <div class="btn-group">
                    <button id="book" type="button" class="btn btn-primary" disabled>Book</button>
                  </div>
                </c:when>
                <c:otherwise>
                  <div><a href="${context}/users/login">Login</a> To Book</div>
                </c:otherwise>
              </c:choose>
              <div >
                <a href="<c:url value="/tours/${tour.id}/schedule"/>" class="btn btn-warning">Schedule</a>
                <a href="<c:url value="/tours/${tour.id}/delete"/>" class="btn btn-danger">Delete</a>
              </div>

              <span id="is_enrolled" style="color:green" hidden>You already bought tickets for this day!</span>
              </div>

              <div id="message_success" class="alert alert-success" hidden>
                <button type="button" class="close" data-dismiss="alert">×</button>
                <h4>
                  Booked!
                </h4>
                Booking completed with success!! 
              </div>

              <div id="message_error" class="alert alert-danger" hidden>
                <button type="button" class="close" data-dismiss="alert">×</button>
                <h4>
                  Error!
                </h4>
                <p>The tour reached it's limit in the specified date!!!</p>
              </div>

              <p id="description">${tour.description}</p>

              <div class="timeline timeline-left">
                <div class="timeline-breaker">The Start</div>
                <c:forEach items="${pois}" var="poi">
                  <div class="timeline-item animated fadeIn de-02">
                    <h4 class="timeline-item-title">
                      ${poi.name}
                    </h4>
                    <p class="timeline-item-description">${poi.description}</p>
                  </div>
                </c:forEach>
                <div class="timeline-breaker timeline-breaker-bottom">The End</div>
              </div>

              <!-- Logos carousel Uses Owl Carousel plugin All options here are customisable from the data-owl-carousel-settings="{OBJECT}" item via data- attributes: http://www.owlgraphic.com/owlcarousel/#customizing ie. data-settings="{"items": "4", "lazyLoad":"true", "navigation":"true"}" -->
              <div class="customers-carousel" data-toggle="owl-carousel" data-owl-carousel-settings='{"items": 3, "lazyLoad":true, "navigation":true, "scrollPerPage":true}'>

                <c:forEach items="${pois}" var="poi">
                  <a href="${context}/resources/img/points_of_interest/${poi.name}.jpg">
                    <img data-src="${context}/resources/img/points_of_interest/${poi.id}.jpg" class="lazyOwl img-responsive underlay" style="width:300px;height:175px" />
                    <h6>
                      ${poi.name}
                    </h6>
                  </a>
                </c:forEach>
              </div>

              <div class="comments" id="comments">
                <h3>
                  Reviews (<span id="review-number">${reviews.size()}</span>)
                </h3>
                <ul class="media-list">
                  <c:forEach items="${reviews}" var="review">
                    <li class="media">
                      <a class="pull-left" href="/tourists/${review.tourist.id}">
                        <img src="${context}/resources/img/users/${review.tourist.id}.jpg" alt="Picture of ${review.tourist.name}" class="media-object img-thumbnail img-responsive" />
                      </a>
                      <div class="media-body">
                        <ul class="list-inline meta text-muted">
                          <li><i class="fa fa-calendar"></i> <joda:format value="${review.date}" style="SS" /></li>
                          <li><i class="fa fa-user"></i> <a href="/tourists/${review.tourist.id}">${review.tourist.name}</a></li>
                          <li>
                            <c:forEach begin="1" end="${review.rating}">
                              <span class="glyphicon glyphicon-star" aria-hidden="true"></span></span>
                            </c:forEach>
                          </li>
                        </ul>
                        <h5 class="media-heading">
                          ${review.title}
                        </h5>
                        <p>${review.comment}</p>
                      </div>
                    </li>
                  </c:forEach>
                </ul>
                  <form:form method="POST" commandName="reviewForm" class="comment-form" role="form">
                  <h4>
                    Add Comment
                  </h4>
                  <div class="form-group">
                    <form:label path="title" class="sr-only">Title (Abstract)</form:label>
                    <form:input path="title" class="form-control" placeholder="Title (Abstract)"/>
                  </div>
                  <div class="form-group">
                    <form:label path="rating" class="sr-only">Rating</form:label>
                    <form:input path="rating" type="number"  class="form-control" placeholder="Rating"/>
                  </div>
                  <div class="form-group">
                    <form:label path="comment" class="sr-only">Comment</form:label>
                    <form:textarea path="comment" class="form-control" placeholder="Comment" rows="8"/>
                  </div>
                  <a type="submit" class="btn btn-primary">Submit</a>
                </form:form>
              </div>
              </div>


              <!--Sidebar-->
              <div class="col-md-3 sidebar sidebar-right">
                <div class="inner">
                  <!-- @Element: Archive -->
                  <div class="block">
                    <h4 class="title-divider">
                      <span>Languages</span>
                    </h4>
                    <ul class="list-unstyled list-lg tags">
                      <c:forEach items="${idioms}" var="idiom">
                        <li><i class="fa fa-angle-right fa-fw"></i>${idiom.name} <h7><span class="flag-icon flag-icon-${idiom.code}"></span></h6></li>
                        </c:forEach> 
                    </ul>
                  </div>
                  <!-- @Element: Archive -->
                  <div class="block">
                    <h4 class="title-divider">
                      <span>Price</span>
                    </h4>
                    <ul class="list-unstyled list-lg">
                      <li><i class="fa fa-angle-right fa-fw"></i>Normal: ${tour.normalPrice}</li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Student: ${tour.studentPrice}</li>
                    </ul>
                  </div>

                  <div class="block">
                    <h4 class="title-divider">
                      <span>Duration</span>
                    </h4>
                    <ul class="list-unstyled list-lg">
                      <li><i class="fa fa-angle-right fa-fw"></i>${tour.duration}</li>
                    </ul>
                  </div>

                  <div class="block">
                    <h4 class="title-divider">
                      <span>Guide</span>
                    </h4>
                    <ul class="list-unstyled list-lg">
                      <li><i class="fa fa-angle-right fa-fw"></i><a href="${context}/guides/${guide.id}">${guide.name}</a></li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Phone: ${guide.phone}</li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Email: <a href="mailto:${guide.email}">${guide.email}</a></li>
                    </ul>
                  </div>


                </div>
              </div>
              </div>
              </div>
              <script>
                $('#language option').on("click", function () {
                  var languageId = $(this).attr("value");
                  $("#tour_date").removeAttr("disabled");
                  $("#tickets").removeAttr("disabled");
                  $("#book").removeAttr("disabled");
                  var selected = false;
                  $("#tour_date option").each(function () {
                    if (!selected && $(this).attr("languageId") === languageId) {
                      $(this).prop('selected', true);
                      selected = true;
                    }
                    if ($(this).attr("languageId") == languageId) {
                      $(this).removeAttr("hidden");
                    }
                    else if ($(this).attr("value") != "-1") {
                      $(this).removeAttr('selected');
                      $(this).prop('hidden', true);
                    }
                  });
                  if (!selected) {
                    $("#default_date").prop('selected', true);
                  }
                  $("#tour_date option").trigger("click");
                });
                $("#book").click(function () {
                  $.ajax({
                    method: 'POST',
                    url: '/Gotour/enrollments/' + $("#tour_date option:selected").attr("value"),
                    success: function (confirmed) {
                      if (confirmed) {
                        $("#book").prop("disabled", true);
                        $("#message_success").removeAttr("hidden");
                      }
                      else
                        $("#message_error").removeAttr("hidden");
                    },
                    error: function () {
                      $("#message_error").removeAttr("hidden");
                      $("#message_error p").text("There is no available tour for the selected language!");
                    }
                  });
                });
                $("#tour_date option").on("click", function () {
                  $("#is_enrolled").prop('hidden', true);
                  if ($("#tour_date option:selected").attr("value") == -1) {
                    return;
                  }
                  $.ajax({
                    method: 'GET',
                    url: '/Gotour/enrollments/' + $("#tour_date option:selected").attr("value") + '/users',
                    success: function (confirmed) {
                      if (confirmed) {
                        $("#is_enrolled").removeAttr("hidden");
                      }
                    },
                    error: function () {
                    }
                  });
                });
              </script>
            </t:layout>