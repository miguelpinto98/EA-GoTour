<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>


<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<t:layout pageTitle="GoTour - Profile">
  <div id="content">
    <div class="container" id="about">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li class="active">${user.name}</li>
      </ol>

      <div class="row">
        <!-- sidebar -->
        <div class="col-md-3 sidebar">

          <!-- Sections Menu-->
          <div class="section-menu">
            <ul class="nav nav-list">
              <li class="nav-header">In This Section</li>
              <li class="active">
                <a href="${context}/users/${user.id}" class="first">
                  About Me 
                  <small>Recent information</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <c:if test="${type eq 1}">
                <li>
                  <a href="${context}/users/${user.id}/enrollments" class="first">
                    Tourists subscribers
                    <small>Tourists inscribed on my tours</small>
                    <i class="fa fa-angle-right"></i>
                  </a>
                </li>
              </c:if>

            </ul>
          </div>
        </div>
        <!--main content-->
        <div class="col-md-9">
          <h2 class="title-divider">
            <span>About <span class="de-em">${user.name}</span></span>
              <c:choose>
                <c:when test="${type == 0}">
                <small>I Am a Tourist</small>
              </c:when>
              <c:otherwise>
                <small>I Am a Guide</small>
              </c:otherwise>
            </c:choose>
          </h2>

          <!-- About me -->
          <div class="row">
            <!-- Image -->
            <div class="col-md-5 col-md-push-7">
              <c:choose>
                <c:when test="${user.avatar != null}">
                  <img src="${context}/resources/img/users/${user.avatar}" alt="About me" class="img-responsive">
                </c:when>
                <c:otherwise>
                  <div class="alert alert-warning" style="text-align: center;">
                    <a href="<c:url value="/users/${user.id}/edit"></c:url>">add an image to your profile</a>
                    </div>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-7 col-md-pull-5">
              <dl>
                <dt>Email</dt>
                <dd><pre class="language-markup">${user.email}</pre></dd>
                  <c:if test="${type == 1}">
                  <dt>Phone</dt>
                  <dd><pre class="language-markup">${user.phone}</pre></dd>
                  </c:if>
                <dt>My description</dt>
                <dd><pre class="language-markup">${user.description}</pre></dd>
              </dl>

              <div class="social-media-branding">
                <a href="<c:url value="/users/${user.id}/edit"></c:url>" class="btn btn-warning">Edit information</a>
                  <!--@todo: replace with real social share links -->
                  <!--<a href="#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                  <a href="#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                  <a href="#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                  <a href="#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>-->
                </div>
              </div>
            </div>

          <c:choose>
            <c:when test="${type == 1}">
              <!-- Latest Tours created -->
              <div class="title-divider margin-top-large">
                <h3>
                  <span>Created <span class="de-em">Tours</span></span>
                  <small>See what I've been working on</small>
                </h3>
              </div>
              <div class="projects-grid">
                <div class="blog-roll blog-grid" data-toggle="isotope-grid" data-isotope-options="{&quot;itemSelector&quot;: &quot;.grid-item&quot;}" style="position: relative; height: 1779.828125px;">

                  <c:forEach items="${user.tours}" var="tour">
                    <div class="col-sm-6 col-md-4 grid-item">
                      <div class="blog-post">
                        <div class="blog-media">
                          <a href="<c:url value="/tours/${tour.id}"></c:url>">
                            <img src="${context}/resources/img/points_of_interest/${tour.pointsOfInterest[0].id}" alt="${tour.name}" class="img-responsive">
                          </a>
                        </div>
                        <div class="margin-top-md">
                          <div class="date-wrapper date-wrapper-horizontal">
                            <a href="${context}/cities/0/${tour.theme.id}" class="tag"><span class="date-m">${tour.theme.name} Tour</span></a>
                            <a href="${context}/cities/${tour.city.id}" class="tag"><span class="date-d">${tour.city.name}</span></a>
                          </div>

                          <h4 class="timeline-item-title">
                            <a href="<c:url value="/tours/${tour.id}"></c:url>">${tour.name}</a>
                            </h4>
                            <p class="timeline-item-description">${fn:substring(tour.description,0,114)}...</p>
                          <a href="<c:url value="/tours/${tour.id}"></c:url>" class="btn btn-link"><i class="fa fa-arrow-circle-right"></i> See more</a>
                          </div>
                        </div>
                      </div>
                  </c:forEach>
                </div>
              </div>

              <!-- REVIEWS USER IN MY TOURS -->
              <div class="title-divider margin-top-large">
                <h3>
                  <span>Reviews <span class="de-em">Received</span></span>
                  <small>Received this reviews on my tours</small>
                </h3>
              </div>
              <div class="projects-grid">
                <c:forEach items="${user.tours}" var="tour">
                  <c:forEach items="${tour.reviews}" var="review">
                    <div class="col-md-4">
                      <blockquote>
                        <p>${fn:substring(review.comment,0,200)}</p>
                        <small>
                          ${review.rating} <i class="fa fa-star"></i>
                          <span class="spacer">/</span> <a href="<c:url value="/tours/${review.tour.id}"></c:url>">@${review.tour.name}</a><span class="spacer"> /</span> <joda:format value="${review.date}" pattern="yyyy-M-dd"  />
                          </small>
                        </blockquote>
                      </div>
                  </c:forEach>
                </c:forEach>
              </div>

            </c:when>
            <c:when test="${type == 0}">
              <div class="margin-top-large">
                <h3>
                  <span>Latest <span class="de-em">Enrollments</span></span>
                  <small>The latest tours</small>
                </h3>


                <c:forEach items="${user.enrollments}" var="enroll">
                  <div class="col-md-4">
                    <div class="timeline-item2">
                      <!--                        <i class="fa fa-coffee fa-4x pull-left"></i> -->
                      <div class="timeline-item-date"><joda:format value="${enroll.date}" pattern="M-yyyy"  /></div>
                      <h4 class="timeline-item-title">
                        <a href="<c:url value="/tours/${enroll.tour.id}"/>">${enroll.tour.name}</a>
                      </h4>
                      <p class="timeline-item-description">${fn:substring(enroll.tour.description,0,150)}</p>
                    </div>
                  </div>

                </c:forEach>

              </div>

              <!-- REVIEWS USER MADE -->
              <div class="title-divider margin-top-large">
                <h3>
                  <span>Latest <span class="de-em">Reviews</span></span>
                  <small>Tours I'm commented</small>
                </h3>
              </div>
              <div class="projects-grid">
                <c:forEach items="${user.reviews}" var="review">
                  <div class="col-md-4">
                    <blockquote>
                      <p>${fn:substring(review.comment,0,100)}</p>
                      <small>
                        ${review.rating} <i class="fa fa-star"></i>
                        <span class="spacer">/</span> <a href="<c:url value="/tours/${review.tour.id}"></c:url>">@${review.tour.name}</a><span class="spacer"> /</span> <joda:format value="${review.date}" pattern="yyyy-M-dd"  />
                        </small>
                      </blockquote>
                    </div>
                </c:forEach>
              </div>
            </div>
          </c:when>
        </c:choose>
      </div>
    </div>
  </div>
</div>
</t:layout>

