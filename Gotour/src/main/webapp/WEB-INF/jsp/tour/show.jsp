<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!-- ======== @Region: #content ======== -->
<t:layout pageTitle="GoTour">
  <div id="content">
    <div class="container">
      <h2 class="title-divider">
        <span>Historical and Enchanted Tour <span class="de-em">Braga</span></span>
        <small>Free Tour</small>
      </h2>

      <div class="col-md-9">

        <div class="jumbotron">
          <div class="btn-group">
            <button type="button" class="btn btn-lg btn-info">June 15, Monday, 9h / English</button>
            <button aria-expanded="false" type="button" class="btn btn-lg btn-info dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
            <ul class="dropdown-menu dropdown-menu-info" role="menu">
              <li><a href="">June 23, Tuesday, 14h / Portuguese</a></li>
            </ul>
          </div>
          <div class="btn-group">
            <button type="button" class="btn btn-lg btn-primary">BOOK NOW</button>
          </div>
        </div>

        <p id="description">Find out about Braga's mysteries by taking a tour through its narrow and medieval streets. Learn about the legends, be amazed by the 'gverreiros' way of living and enjoy the city through the local's perspective.</p>

        <div class="timeline timeline-left">
          <div class="timeline-breaker">The Start</div>
          <!--Timeline item 1-->
          <div class="timeline-item animated fadeIn de-02">
            <h4 class="timeline-item-title">
              Sameiro
            </h4>
            <p class="timeline-item-description">Gilvus ideo mauris pala paulatim quia refero vicis. Autem caecus dolore interdico jumentum lenis loquor modo rusticus ut.</p>
          </div>
          <!--Timeline item 1-->
          <div class="timeline-item animated fadeIn de-02">
            <h4 class="timeline-item-title">
              Bom Jesus
            </h4>
            <p class="timeline-item-description">Gilvus ideo mauris pala paulatim quia refero vicis. Autem caecus dolore interdico jumentum lenis loquor modo rusticus ut.</p>
          </div>
          <!--Timeline item 1-->
          <div class="timeline-item animated fadeIn de-02">
            <h4 class="timeline-item-title">
              Sé Cathedral
            </h4>
            <p class="timeline-item-description">Gilvus ideo mauris pala paulatim quia refero vicis. Autem caecus dolore interdico jumentum lenis loquor modo rusticus ut.</p>
          </div>
          <div class="timeline-breaker timeline-breaker-bottom">The End</div>
        </div>

        <!-- Logos carousel Uses Owl Carousel plugin All options here are customisable from the data-owl-carousel-settings="{OBJECT}" item via data- attributes: http://www.owlgraphic.com/owlcarousel/#customizing ie. data-settings="{"items": "4", "lazyLoad":"true", "navigation":"true"}" -->
        <div class="customers-carousel" data-toggle="owl-carousel" data-owl-carousel-settings='{"items": 3, "lazyLoad":true, "navigation":true, "scrollPerPage":true}'>

          <a href="img/sameiro.jpg">
            <img data-src="${context}/resources/img/points_of_interest/Braga/Bom Jesus.jpg" class="lazyOwl img-responsive underlay" />
            <h6>
              Bom Jesus
            </h6>
          </a>
          <a href="elements.htm#">
            <img data-src="${context}/resources/img/points_of_interest/Braga/Bom Jesus.jpg" class="lazyOwl img-responsive underlay" />
            <h6>
              Sameiro
            </h6>
          </a>
          <a href="elements.htm#">
            <img data-src="${context}/resources/img/points_of_interest/Braga/Bom Jesus.jpg" class="lazyOwl img-responsive underlay" />
            <h6>
              SÃ© Cathedral
            </h6>
          </a>
          <a href="elements.htm#">
            <img data-src="${context}/resources/img/points_of_interest/Braga/Bom Jesus.jpg" class="lazyOwl img-responsive underlay" />
            <h6>
              Municipal Square
            </h6>
          </a>

        </div>

        <div class="comments" id="comments">
          <h3>
            Reviews (10)
          </h3>
          <ul class="media-list">
            <li class="media">
              <a class="pull-left" href="blog-post-slideshow.htm#">
                <img src="${context}/resources/img/team/robert.jpg" alt="Picture of Alex" class="media-object img-thumbnail img-responsive" />
              </a>
              <div class="media-body">
                <ul class="list-inline meta text-muted">
                  <li><i class="fa fa-calendar"></i> Sat 7th Feb 2015</li>
                  <li><i class="fa fa-user"></i> <a href="blog-post-slideshow.htm#">Joe</a></li>
                  <li><span class="glyphicon glyphicon-star" aria-hidden="true"></span><span class="glyphicon glyphicon-star" aria-hidden="true"></span></li>
                </ul>
                <h5 class="media-heading">
                  Nisi rhoncus nisi porttitor risus ridiculus tristique, quis.
                </h5>
                <p>Nisi rhoncus nisi porttitor risus ridiculus tristique, quis.Nisi rhoncus nisi porttitor risus ridiculus tristique, quis.Nisi rhoncus nisi porttitor risus ridiculus tristique, quis.Nisi rhoncus nisi porttitor risus ridiculus tristique, quis.</p>
              </div>
            </li>
            <li class="media">
              <a class="pull-left" href="blog-post-slideshow.htm#">
                <img src="${context}/resources/img/team/adele.jpg" alt="Picture of Erin" class="media-object img-thumbnail img-responsive" />
              </a>
              <div class="media-body">
                <ul class="list-inline meta text-muted">
                  <li><i class="fa fa-calendar"></i> Sun 11th Jan 2015</li>
                  <li><i class="fa fa-user"></i> <a href="blog-post-slideshow.htm#">Alex</a></li>
                  <li><span class="glyphicon glyphicon-star" aria-hidden="true"></span></li>
                </ul>
                <h5 class="media-heading">
                  Urna natoque in phasellus rhoncus aliquet penatibus
                </h5>
                <p>Urna natoque in phasellus rhoncus aliquet penatibusUrna natoque in phasellus rhoncus aliquet penatibusUrna natoque in phasellus rhoncus aliquet penatibusUrna natoque in phasellus rhoncus aliquet penatibus</p>
              </div>
            </li>
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
              <li><i class="fa fa-angle-right fa-fw"></i>English <h7><span class="flag-icon flag-icon-gb"></span></h6></li>
                <li><i class="fa fa-angle-right fa-fw"></i>Portuguese <h7><span class="flag-icon flag-icon-pt"></span></h6></li>
                  </ul>
                  </div>

                  <!-- @Element: Archive -->
                  <div class="block">
                    <h4 class="title-divider">
                      <span>Prices</span>
                    </h4>
                    <ul class="list-unstyled list-lg">
                      <li><i class="fa fa-angle-right fa-fw"></i>Normal: 10â¬</li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Students: 2â¬</li>
                    </ul>
                  </div>

                  <!-- @Element: Archive -->
                  <div class="block">
                    <h4 class="title-divider">
                      <span>Guide</span>
                    </h4>
                    <ul class="list-unstyled list-lg">
                      <li><i class="fa fa-angle-right fa-fw"></i><a href="blog-post-slideshow.htm#">Maria</a></li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Phone: 912333123</li>
                      <li><i class="fa fa-angle-right fa-fw"></i>Email: <a href="mailto:someone@example.com">maria@gmail.com</a></li>
                    </ul>
                  </div>

                  </div>
                  </div>
                  </div>
                  </div>
                </t:layout>