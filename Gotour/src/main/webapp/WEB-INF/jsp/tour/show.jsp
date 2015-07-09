<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!-- ======== @Region: #content ======== -->
<t:layout pageTitle="${tour.name}">
    <div id="content">
        <div class="container">
            <h2 class="title-divider">
                <span>${tour.name} <span class="de-em">${city.name}</span></span>
                <small>${theme.name} Tour</small>
            </h2>

            <div class="col-md-9">

                <div class="jumbotron">
                    <div class="btn-group">
                        <c:forEach items="${enrollments}" var="enrollment" varStatus="status">
                            <c:choose>
                                <c:when test="${status.first}">
                                    <button id="${enrollment.id}" type="button" class="btn btn-lg btn-info"><joda:format value="${enrollment.date}" style="SS" /> ${enrollment.date.dayOfWeek().getAsShortText()} (${enrollment.language.name})</button>
                                    <button aria-expanded="false" type="button" class="btn btn-lg btn-info dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
                                </c:when>
                                <c:when test="${status.count == 2}">
                                    <ul class="dropdown-menu dropdown-menu-info" role="menu">
                                    </c:when>
                                    <c:when test="${status.last}">
                                        <li id="${enrollment.id}"><a href=""><joda:format value="${enrollment.date}" style="SS" /> ${enrollment.date.dayOfWeek().getAsShortText()} (${enrollment.language.name})</a></li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <li id="${enrollment.id}"><a href=""><joda:format value="${enrollment.date}" style="SS" /> ${enrollment.date.dayOfWeek().getAsShortText()} (${enrollment.language.name})</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-lg btn-primary">BOOK NOW</button>
                    </div>
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
                        Reviews (${reviews.size()})
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
                            <li><i class="fa fa-angle-right fa-fw"></i>${tour.normalPrice}€</li>
                        </ul>
                    </div>

                    <!-- @Element: Archive -->
                    <div class="block">
                        <h4 class="title-divider">
                            <span>Guide</span>
                        </h4>
                        <ul class="list-unstyled list-lg">
                            <li><i class="fa fa-angle-right fa-fw"></i><a href="/guides/${guide.id}">${guide.name}</a></li>
                            <li><i class="fa fa-angle-right fa-fw"></i>Phone: ${guide.phone}</li>
                            <li><i class="fa fa-angle-right fa-fw"></i>Email: <a href="mailto:${guide.email}">${guide.email}</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</t:layout>