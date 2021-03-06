<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<!-- ======== @Region: #content ======== -->
<t:layout pageTitle="${tour.name}">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li><a href="<c:url value="/cities"/>">Tours</a></li>
        <li class="active">${tour.name}</li>
      </ol>
      <c:if test="${notice}">
        <div class="alert alert-success alert-dismissible" role="alert">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          ${notice}
        </div>
      </c:if>

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
                <select id="language-book" class="form-control" style="width:175px">
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
                    <c:if test="${user.class.name eq 'com.gotour.models.Tourist'}">
                      <button id="book" type="button" class="btn btn-primary" disabled>Book</button>
                    </c:if>
                  </div>
                </c:when>
                <c:otherwise>
                  <div><a href="${context}/users/login">Login</a> To Book</div>
                </c:otherwise>
              </c:choose>
              <c:if test="${user.id eq tour.guide.id}">
                <div >
                  <a href="<c:url value="/tours/${tour.id}/schedule"/>" class="btn btn-warning">Schedule</a>
                  <a href="<c:url value="/tours/${tour.id}/edit"/>" class="btn btn-primary"> Edit</a>
                  <a href="<c:url value="/tours/${tour.id}/delete"/>" class="btn btn-danger">Delete</a>
                  <a href="<c:url value="/tours/new"/>" class="btn btn-success"> Create new tour</a>
                </div>
              </c:if>


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

                  <a class="point-href" data-target="${poi.id}">
                    <img data-src="${context}/resources/img/points_of_interest/${poi.image}" class="lazyOwl img-responsive underlay" style="width:300px;height:175px" />
                    <h6>
                      ${poi.name}
                    </h6>
                  </a>

                </c:forEach>
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
                      <li><i class="fa fa-angle-right fa-fw"></i><a href="${context}/users/${guide.id}">${guide.name}</a></li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Phone: ${guide.phone}</li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Email: <a href="mailto:${guide.email}">${guide.email}</a></li>
                    </ul>
                  </div>


                </div>
              </div>


              <div class="col-md-12">
                <div class="comments" id="comments">
                  <h3>
                    Reviews (<span id="review-number">${reviews.size()}</span>)
                  </h3>
                  <div class="col-md-6">
                    <ul class="media-list">
                      <c:forEach items="${reviews}" var="review">

                        <li class="media">
                          <a class="pull-left" href="${context}/users/${review.tourist.id}">
                            <img src="${context}/resources/img/users/${review.tourist.avatar}" alt="Picture of ${review.tourist.name}" class="media-object img-thumbnail img-responsive" />
                          </a>
                          <div class="media-body">
                            <ul class="list-inline meta text-muted">
                              <li><i class="fa fa-calendar"></i> <joda:format value="${review.date}" style="SS" /></li>
                              <li><i class="fa fa-user"></i> <a href="${context}/users/${review.tourist.id}">${review.tourist.name}</a></li>
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
                  </div>

                  <div class="col-md-6">
                    <c:choose>
                      <c:when test="${user != null && user.class.name != 'com.gotour.models.Guide'}">
                        <form:form action="${context}/reviews/new" method="POST" commandName="reviewForm" class="comment-form" role="form">
                          <h4>
                            Add Comment ${user.name}
                          </h4>
                          <form:input path="tour.id" id="review_tour" type="hidden" value="${tour.id}" />

                          <div class="form-group">
                            <form:label path="title" class="sr-only">Title (Abstract)</form:label>
                            <form:input path="title" id="review_title" class="form-control" placeholder="Title (Abstract)" required="true"/>
                          </div>
                          <div class="form-group">
                            <form:label path="rating" class="sr-only">Rating</form:label>
                            <form:input path="rating" id="review_rating" type="number" min="1" max="5" class="form-control" placeholder="Rating" required="true"/>
                          </div>
                          <div class="form-group">
                            <form:label path="comment" class="sr-only">Comment</form:label>
                            <form:textarea path="comment" id="review_comment" class="form-control" placeholder="Comment" rows="8" required="true"/>
                          </div>
                          <button class="btn btn-primary" type="submit"value="submit">Submit</button>
                        </form:form>
                      </c:when>
                      <c:when test="${user.class.name == 'com.gotour.models.Guide'}">

                      </c:when>
                      <c:otherwise>
                        <h4>
                          Please, <a href="${context}/users/login">log in</a> to add a review
                        </h4>
                      </c:otherwise>
                    </c:choose>


                  </div>
                </div>


              </div>

              </div>
              </div>

              <!-- Modal -->
              <div class="modal fade" id="poiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="point-title">Modal title</h4>
                    </div>
                    <div class="modal-body">
                      <dl>
                        <dt>Description</dt>
                        <dd id="point-desc">...</dd>
                        <dt>Location</dt>
                        <dd id="point-loc">...</dd>
                        <dt></dt>
                        <dd>
                          <br/>
                          <img src="" id="point-img" alt="Picture" width="100%"></img>
                        </dd>
                      </dl>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      <c:if test="${user.id eq tour.guide.id}">
                        <button type="button" class="btn btn-warning">Edit</button>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>              

            </t:layout>



