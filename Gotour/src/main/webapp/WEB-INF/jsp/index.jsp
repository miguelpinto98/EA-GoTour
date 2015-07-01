<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:layout pageTitle="GoTour">
  <div id="highlighted">
    <div class="inner">
      <!--Static Banner-->
      <section class="static-banner container">
        <div class="slide">
          <div class="col-md-7">
            <img src="resources/img/slides/slide1.png" alt="Slide 1" class="img-responsive">
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
            <a href="features.htm">
              <img src="img/features/feature-1.png" alt="Feature 1" class="img-responsive">
            </a>
            <!--<h3 class="title">
              <a href="features.htm">Mobile <span class="de-em">Friendly</span></a>
            </h3>-->
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="features.htm">
              <img src="img/features/feature-2.png" alt="Feature 2" class="img-responsive">
            </a>
            <!--<h3 class="title">
              <a href="features.htm">24/7 <span class="de-em">Support</span></a>
            </h3>-->
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="features.htm">
              <img src="img/features/feature-3.png" alt="Feature 3" class="img-responsive">
            </a>
            <!--<h3 class="title">
              <a href="features.htm">Free Upgrade <span class="de-em">Assistance</span></a>
            </h3>-->
          </div>
          <div class="feature col-sm-6 col-md-3">
            <a href="features.htm">
              <img src="resources/img/features/feature-4.png" alt="Feature 4" class="img-responsive">
            </a>
            <!--<h3 class="title">
              <a href="features.htm">99.9% <span class="de-em">Uptime</span></a>
            </h3>-->
          </div>
        </div>
      </div>
    </div>
  </div>
</t:layout>