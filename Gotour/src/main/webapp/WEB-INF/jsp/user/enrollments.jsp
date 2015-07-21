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
        <li class="active">${_user.name}</li>
      </ol>

      <div class="row">
        <!-- sidebar -->
        <div class="col-md-3 sidebar">

          <!-- Sections Menu-->
          <div class="section-menu">
            <ul class="nav nav-list">
              <li class="nav-header">In This Section</li>
              <li>
                <a href="${context}/users/${_user.id}" class="first">
                  About Me 
                  <small>Recent information</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <c:if test="${type eq 1}">
                <li class="active">
                  <a href="${context}/users/${_user.id}/enrollments" class="first">
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
            <span>About <span class="de-em">${_user.name}</span></span>
            <small>I Am a Guide</small>
          </h2>

          <!-- About me -->
          <div class="row">
            <!-- Image -->
            <div class="col-md-5 col-md-push-7">
              <c:choose>
                <c:when test="${_user.avatar != null}">
                  <img src="${context}/resources/img/users/${_user.avatar}" alt="About me" class="img-responsive">
                </c:when>
                <c:otherwise>
                  <div class="alert alert-warning" style="text-align: center;">
                    <a href="<c:url value="/users/${_user.id}/edit"></c:url>">add an image to your profile</a>
                    </div>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-7 col-md-pull-5">
              <dl>
                <dt>Email</dt>
                <dd><pre class="language-markup">${_user.email}</pre></dd>
                  <c:if test="${type == 1}">
                  <dt>Phone</dt>
                  <dd><pre class="language-markup">${_user.phone}</pre></dd>
                  </c:if>
                <dt>My description</dt>
                <dd><pre class="language-markup">${_user.description}</pre></dd>
              </dl>

              <div class="social-media-branding">
                <a href="<c:url value="${context}/users/${_user.id}/edit"></c:url>" class="btn btn-warning">Edit information</a>
                <a href="<c:url value="/tours/new"/>" class="btn btn-success"> Create new tour</a>

                <!--@todo: replace with real social share links -->
                  <!--<a href="#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                  <a href="#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                  <a href="#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                  <a href="#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>-->
                </div>
              </div>
            </div>

            <!-- Latest Tours created -->
            <div class="title-divider margin-top-large">
              <h3>
                <span>Tourists <span class="de-em">Subscribers</span></span>
                <small>See what I've been working on</small>
              </h3>
            </div>
            <div class="panel-group" id="accordion">
            <c:forEach items="${_user.tours}" var="tour">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${tour.id}" aria-expanded="false" class="collapsed"> (${tour.id}) ${tour.name} </a> 
                  </h4>
                </div>
                <div id="collapse${tour.id}" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                  <div class="panel-body">
                    <ul class="list-unstyled">
                      <c:forEach items="${tour.enrollments}" var="enroll">
                        <li>
                          <b><joda:format value="${enroll.date}" style="SS" /> (${enroll.date.dayOfWeek().getAsShortText()})</b>

                          <c:if test="${not empty enroll.tourists}">
                            <ul>
                              <c:forEach items="${enroll.tourists}" var="user">
                                <li><a href="<c:url value="/users/${_user.id}"></c:url>">${_user.name}</a></li>
                              </c:forEach>
                            </ul>
                          </c:if>
                        </li>
                      </c:forEach>
                    </ul>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>




        </div>

      </div>
    </div>
  </div>
</t:layout>

