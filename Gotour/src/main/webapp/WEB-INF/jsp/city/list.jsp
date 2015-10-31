<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - Search Tours">
  <div id="content">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="<c:url value="/"/>">Home</a></li>
        <li class="active">Tours (<c:out default="All Themes" value="${actualTheme.name}"></c:out> - <c:out default="All Cities" value="${actualCity.name}"></c:out>)</li>
        </ol>
        <h2 class="title-divider">
          <span>Search <span class="de-em">Tours</span></span>
        </h2>
        <div class="row">
          <!-- Tour Roll Content-->
          <div class="col-md-9 col-md-push-3 blog-roll blog-list">
            <h4 class="title-divider">
              <span>
              <c:out default="All Themes" value="${actualTheme.name}"/> - 
              <c:out default="All Cities" value="${actualCity.name}" />
              <c:if test="${empty cityTours}">
                <c:out default="(0)" value="(${cityTours.size()})"/>
              </c:if></span>
          </h4>
          <c:choose>
            <c:when test="${empty cityTours}">
              <p>We have no tours here, sorry!</p>
            </c:when>
            <c:otherwise>
              <c:forEach items="${cityTours}" var="tour">
                <!-- Tour Content -->
                <div class="row blog-post" id="tour-post-${tour.id}">
                  <!-- <div class="col-md-1 date-md">
                  <!-- Date desktop 
                  <!--<div class="date-wrapper"> <span class="date-m">Feb</span> <span class="date-d">08</span> </div>
                  <!-- Meta details desktop
                  <!--<p class="text-muted"> <i class="fa fa-user"></i> <a href="#">Tom</a> </p>
                  </div> -->
                  <div class="col-md-11">
                    <div class="tags"><a href="<c:url value="/cities/0/${tour.theme.id}"/>" class="tag">${tour.theme.name}</a> / <a class="type">${tour.city.name}</a></div>
                    <h4 class="title media-heading">
                      <a href="<c:url value="/tours/${tour.id}"/>">${tour.name}</a>
                    </h4>

                    <div class="row">
                      <div class="col-md-4 col-md-push-8">
                        <div class="blog-media">
                          <a href="<c:url value="/tours/${tour.id}"/>">
                            <!--<img src="#" alt="${tour.name}" class="img-responsive">-->
                          </a>
                        </div>
                      </div>
                      <div class="col-md-8 col-md-pull-4">
                        <p>${tour.description}</p>
                        <ul class="list-inline links">
                          <li>
                            <a href="<c:url value="/tours/${tour.id}"/>" class="btn btn-default btn-xs"><i class="fa fa-arrow-circle-right"></i> See more</a>
                          </li>
                          <li>
                            <a class="btn btn-default btn-xs"><i class="fa fa-comment"></i> ${tour.reviews.size()} Comments</a>
                          </li>
                          <li>
                            <p class="text-muted"> <i class="fa fa-user"></i> <a href="/users/${tour.guide.id}">${tour.guide.name}</a> </p>
                          </li>

                          <c:if test="${user.class.name eq 'com.gotour.models.Guide' && tour.guide.id == user.id}">
                            <li>
                              <a href="<c:url value="/tours/${tour.id}/edit"/>" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i> Edit</a>
                            </li>
                            <li>
                              <a data-target="${tour.id}" class="remove-tour btn btn-danger btn-xs"><i class="fa fa-times"></i> Delete</a>
                            </li>
                          </c:if>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>

        </div>


        <!--Sidebar -------------------------------------------->
        <div class="col-md-3 col-md-pull-9 sidebar sidebar-left">
          <div class="inner">
            <c:if test="${user.class.name eq 'com.gotour.models.Guide'}">
              <div class="block">
                <h4 class="title-divider">
                  <span>Guide Menu</span>
                </h4>
                <a href="<c:url value="/tours/new"/>" class="btn btn-success"><i class="fa fa-plus"></i> Create new tour</a>
              </div>
            </c:if>
            <div class="block">
              <h4 class="title-divider">
                <span>Filters</span>
              </h4>
              <form role="form">
                <div class="form-group">
                  <label class="control-label" for="city-filter">City</label>
                  <select name="city" id="city-filter" class="form-control">
                    <c:if test="${not empty actualCity}">
                      <option value="${actualCity.id}">${actualCity.name}</option>
                    </c:if>
                    <option value="0">Select a City</option>
                    <c:forEach items="${cities}" var="city">
                      <option value="${city.id}">${city.name}</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="form-group">
                  <label class="control-label" for="theme-filter">Theme</label>
                  <select name="theme" id="theme-filter" class="form-control">
                    <c:if test="${not empty actualTheme}">
                      <option value="${actualTheme.id}">${actualTheme.name}</option>
                    </c:if>
                    <option value="0">Select a theme</option>
                    <c:forEach items="${thematics}" var="theme">
                      <option value="${theme.id}">${theme.name} Tours</option>
                    </c:forEach>
                  </select>
                </div> 
                <div class="form-group">
                  <label class="control-label" for="range-filter">Price (máx.)</label>
                  <input id="range-filter" type="range" min="0" max="500" />
                </div>
                <div class="form-group">  
                  <a id="href-filter" class="btn btn-info" type="button">Go!</a>
                </div>
              </form>
            </div>

            <!-- @Element: Tag cloud -->
            <div class="block">
              <h4 class="title-divider">
                <span>Thematic</span>
              </h4>
              <div class="tag-cloud">
                <span><a href="<c:url value="/cities/0/1"/>">Free Tours</a> </span>
                <span><a href="<c:url value="/cities/0/2"/>">Food Tours</a> </span>
                <span><a href="<c:url value="/cities/0/3"/>">Walking Tours</a> </span>
                <span><a href="<c:url value="/cities/0/4"/>">Night Tours</a> </span>
              </div>
            </div>

            <!--<div class="block">
              <h4 class="title-divider">
                <span>Price</span>
              </h4>
              <div class="tag-cloud">
                <span><a href="blog-leftbar.htm#">Free</a> (74)</span>
                <span><a href="blog-leftbar.htm#">10-15€</a> (5)</span>
                <span><a href="blog-leftbar.htm#">15-20€</a> (24)</span>
                <span><a href="blog-leftbar.htm#">mais de 20€</a> (96)</span>
              </div>
            </div> -->

            <!-- @Element: Archive -->
            <!--<div class="block">
              <h4 class="title-divider">
                <span>Date</span>
              </h4>
              <ul class="list-unstyled list-lg tags">
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">February 2016</a> (48)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">January 2016</a> (61)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">December 2015</a> (61)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">November 2015</a> (45)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">October 2015</a> (75)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">September 2015</a> (34)</li>
                <li><i class="fa fa-angle-right fa-fw"></i> <a href="blog-leftbar.htm#">August 2015</a> (91)</li>
              </ul>
            </div>-->
          </div>
        </div>
      </div>
    </div>
    <!--.container-->
  </div>


</t:layout>