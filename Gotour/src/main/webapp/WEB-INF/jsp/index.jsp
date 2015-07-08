<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<c:set var="context" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<t:layout pageTitle="GoTour">
  <div id="highlighted">
    <div class="inner">
      <!--Static Banner-->
      <section class="static-banner container">
        <div class="slide">
          <div class="col-md-7">
            <img src="${context}/resources/img/slides/slide1.png" alt="Slide 1" class="img-responsive">
          </div>
          <div class="col-md-5 caption">
            <h2>
              Search for a city or a tour
            </h2>
            <p>Perfect platform to know new city tours!</p>
            <form:form method="POST" action="/searchByCityTour" role="form">
              <div class="row">
                <div class="col-md-9">
                  <div class="input-group input-group-lg">
                    <%--<form:label path="" class="sr-only" for="city-field">City</form:label>--%>
                    <input class="form-control"/>
                    <%--<form:input path="" type="text" class="form-control" id="city-field" placeholder="City"/>--%>
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </section>
    </div>
  </div>

  <div id="content">
    <div class="container">
      <div class="block features">
        <h2 class="title-divider">
          <span>Thematic <span class="de-em">Tours</span></span>
          <small>The easiest way to find the theme for a tour in a city.</small>
        </h2>
        <div class="row">
          <div class="feature col-sm-6 col-md-3">
            <a href="<c:url value="/tours/theme/1"/>">
              <img src="${context}/resources/img/features/feature-1.png" alt="free tours" class="img-responsive">
            </a>
            <h3 class="title">
              <a href="<c:url value="/tours/theme/1"/>">Free <span class="de-em">Tours</span></a>
            </h3>
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="<c:url value="/tours/theme/2"/>">
              <img src="${context}/resources/img/features/feature-2.png" alt="food tours" class="img-responsive">
            </a>
            <h3 class="title">
              <a href="<c:url value="/tours/theme/2"/>">Food <span class="de-em">Tours</span></a>
            </h3>
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="<c:url value="/tours/theme/3"/>">
              <img src="${context}/resources/img/features/feature-3.png" alt="walking tours" class="img-responsive">
            </a>
            <h3 class="title">
              <a href="<c:url value="/tours/theme/3"/>">Walking <span class="de-em">Tours</span></a>
            </h3>
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="<c:url value="/tours/theme/4"/>">
              <img src="${context}/resources/img/features/feature-4.png" alt="night tours" class="img-responsive">
            </a>
            <h3 class="title">
              <a href="<c:url value="/tours/theme/4"/>">Night <span class="de-em">Tours</span></a>
            </h3>
          </div>
        </div>
        <div class="block testimonials margin-top-large">
          <h2 class="title-divider">
            <span>Last <span class="de-em">Reviews</span></span>
            <small>See the recommendations of our tourists</small>
          </h2>
          <div class="row">
            <div class="col-md-4">
              <blockquote>
                <p>"It's totally awesome, we're could imagine life without it!"</p>
                <small>
                  <img src="#" alt="#" class="img-circle">
                  Jimi Bloggs <span class="spacer">in</span> <a href="#">tour z</a>
                </small>
              </blockquote>
            </div>
            <div class="col-md-4">
              <blockquote>
                <p>"10 out of 10, highly recommended!"</p>
                <small>
                  <img src="#" alt="#" class="img-circle">
                  Steve Bloggs <span class="spacer">in</span> <a href="#">tour y</a>
                </small>
              </blockquote>
            </div>
            <div class="col-md-4">
              <blockquote>
                <p>"Our productivity &amp; sales are up! Couldn't be happier with this product!"</p>
                <small>
                  <img src="#" alt="#" class="img-circle">
                  Adele Bloggs <span class="spacer">in</span> <a href="#">tour x</a>
                </small>
              </blockquote>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</t:layout>