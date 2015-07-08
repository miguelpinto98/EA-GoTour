<%-- 
    Document   : searchTours
    Created on : 9/jul/2015, 0:20:27
    Author     : Cristiana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - searchTours">
    <div id="content">
        <div class="container">
            <h2 class="title-divider">
                <span>Pesquisar <span class="de-em">Tours</span></span>
            </h2>
        <div class="row">
          <!--Blog Roll Content-->
            <div class="col-md-9 col-md-push-3 blog-roll blog-list">
            <!-- Blog post -->
                <div class="row blog-post">
                    <div class="col-md-1 date-md">
                         <!-- Date desktop -->
                        <div class="date-wrapper"> <span class="date-m">Feb</span> <span class="date-d">08</span> </div>
                        <!-- Meta details desktop -->
                        <p class="text-muted"> <i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Jimi</a> </p>
                    </div>
                  <div class="col-md-11">
                        <div class="tags"><a href="blog-leftbar.htm#" class="tag">Fotos</a> / <a href="blog-leftbar.htm#" class="type">Video</a></div>
                            <h4 class="title media-heading">
                                <a href="blog-post.htm">Cultural Tour Braga</a>
                            </h4>
                        <!-- Meta details mobile -->
                        <ul class="list-inline meta text-muted">
                            <li><i class="fa fa-calendar"></i> Sun 8th Feb 2015</li>
                            <li><i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Tom</a></li>
                        </ul>
                        <div class="row">
                            <div class="col-md-4 col-md-push-8">
                                <div class="blog-media">
                                    <a href="blog-post.htm">
                                        <img src="img/blog/frog.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-8 col-md-pull-4">
                                <p>Ad antehabeo bene exputo lucidus magna natu nulla sit utinam. Ille laoreet luctus premo quae te tincidunt verto volutpat vulpes.</p>
                                <ul class="list-inline links">
                                    <li>
                                        <a href="blog-post.htm" class="btn btn-default btn-xs"><i class="fa fa-arrow-circle-right"></i> Read more</a>
                                    </li>
                                    <li>
                                        <a href="blog-post.htm#comments" class="btn btn-default btn-xs"><i class="fa fa-comment"></i> 40 Comments</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Blog post -->
                <div class="row blog-post">
                    <div class="col-md-1 date-md">
                        <!-- Date desktop -->
                        <div class="date-wrapper"> <span class="date-m">Jan</span> <span class="date-d">20</span> </div>
                        <!-- Meta details desktop -->
                        <p class="text-muted"> <i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Joe</a> </p>
                    </div>
                        <div class="col-md-11">
                        <div class="tags"><a href="blog-leftbar.htm#" class="tag">Fotos</a> / <a href="blog-leftbar.htm#" class="type">Video</a></div>
                        <h4 class="title media-heading">
                            <a href="blog-post.htm">Wine Tour Porto</a>
                        </h4>
                        <!-- Meta details mobile -->
                        <ul class="list-inline meta text-muted">
                            <li><i class="fa fa-calendar"></i> Tue 20th Jan 2015</li>
                            <li><i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Joe</a></li>
                        </ul>
                        <div class="row">
                            <div class="col-md-4 col-md-push-8">
                                <div class="blog-media">
                                    <div class="slider-wrapper">
                                        <div class="flexslider slider-mini-nav" data-slidernav="auto" data-transition="fade">
                                            <div class="slides">
                                                <div class="slide">
                                                    <img src="img/blog/ape.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                                 </div>
                                                <div class="slide">
                                                    <img src="img/blog/water-pump.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                                </div>
                                                <div class="slide">
                                                  <img src="img/blog/fly.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                                </div>
                                                <div class="slide">
                                                  <img src="img/blog/bee.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 col-md-pull-4">
                                <p>Abico appellatio commoveo gravis molior nisl praemitto quae ullamcorper. Jus mos nostrud vulpes wisi. Aptent erat euismod vel vulputate. Dignissim enim esse ex ludus natu patria quia saepius.</p>
                                <ul class="list-inline links">
                                    <li>
                                        <a href="blog-post.htm" class="btn btn-default btn-xs"><i class="fa fa-arrow-circle-right"></i> Read more</a>
                                    </li>
                                    <li>
                                        <a href="blog-post.htm#comments" class="btn btn-default btn-xs"><i class="fa fa-comment"></i> 49 Comments</a>
                                    </li>
                                 </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Blog post -->
                    <div class="row blog-post">
                        <div class="col-md-1 date-md">
                            <!-- Date desktop -->
                            <div class="date-wrapper"> <span class="date-m">Jan</span> <span class="date-d">12</span> </div>
                            <!-- Meta details desktop -->
                            <p class="text-muted"> <i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Alex</a> </p>
                        </div>
                        <div class="col-md-11">
                            <div class="tags"><a href="blog-leftbar.htm#" class="tag">Fotos</a> / <a href="blog-leftbar.htm#" class="type">Video</a></div>
                                <h4 class="title media-heading">
                                    <a href="blog-post.htm">Tour Ria de Aveiro</a>
                                </h4>
                                <!-- Meta details mobile -->
                                <ul class="list-inline meta text-muted">
                                    <li><i class="fa fa-calendar"></i> Mon 12th Jan 2015</li>
                                    <li><i class="fa fa-user"></i> <a href="blog-leftbar.htm#">Alex</a></li>
                                </ul>
                                <div class="row">
                                    <div class="col-md-4 col-md-push-8">
                                        <div class="blog-media">
                                            <object width="560" height="315">
                                                <param name="movie" value="//www.youtube.com/v/qpWlaOeGZ_4?hl=en_US&amp;version=3&amp;rel=0"></param>
                                                <param name="allowFullScreen" value="true"></param>
                                                <param name="allowscriptaccess" value="always"></param>
                                                <embed src="http://www.youtube.com/v/qpWlaOeGZ_4?hl=en_US&version=3&rel=0" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></embed>
                                            </object>
                                        </div>
                                    </div>
                                    <div class="col-md-8 col-md-pull-4">
                                        <p>Exerci importunus quis suscipit. Dolor ex iriure saluto si. Abigo inhibeo interdico ludus luptatum sagaciter te vulpes. Accumsan damnum similis venio.</p>
                                        <ul class="list-inline links">
                                            <li>
                                              <a href="blog-post.htm" class="btn btn-default btn-xs"><i class="fa fa-arrow-circle-right"></i> Read more</a>
                                            </li>
                                            <li>
                                              <a href="blog-post.htm#comments" class="btn btn-default btn-xs"><i class="fa fa-comment"></i> 57 Comments</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pagination">
                            <button type="button" class="btn btn-default btn-lg btn-block">Load More</button>
                        </div>
                    </div>
                    <!--Sidebar-->
                    <div class="col-md-3 col-md-pull-9 sidebar sidebar-left">
                        <div class="inner">

                            <!-- @Element: Search form -->
                            <div class="block">
                                <form role="form">
                                    <div class="input-group">
                                        <label class="sr-only" for="search-field">Search</label>
                                        <input type="search" class="form-control" id="search-field" placeholder="City">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">Go!</button>
                                        </span>
                                    </div>
                                </form>
                            </div>

                    <!-- @Element: Tag cloud -->
                    <div class="block">
                        <h4 class="title-divider">
                            <span>Tematics</span>
                        </h4>
                        <div class="tag-cloud">
                            <span><a href="blog-leftbar.htm#">Cultural</a> (74)</span>
                            <span><a href="blog-leftbar.htm#">Wine</a> (5)</span>
                            <span><a href="blog-leftbar.htm#">Gastronomic</a> (24)</span>
                            <span><a href="blog-leftbar.htm#">Night</a> (96)</span>
                            <span><a href="blog-leftbar.htm#">Walking</a> (49)</span>
                        </div>
                    </div>

                    <div class="block">
                        <h4 class="title-divider">
                            <span>Price</span>
                        </h4>
                        <div class="tag-cloud">
                            <span><a href="blog-leftbar.htm#">Free</a> (74)</span>
                            <span><a href="blog-leftbar.htm#">10-15€</a> (5)</span>
                            <span><a href="blog-leftbar.htm#">15-20€</a> (24)</span>
                            <span><a href="blog-leftbar.htm#">mais de 20€</a> (96)</span>
                        </div>
                    </div>

                    <!-- @Element: Archive -->
                    <div class="block">
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
                    </div>

                    <!-- @Element: Popular/recent tabs -->
                    <div class="block">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="blog-leftbar.htm#popular" data-toggle="tab">Popular</a></li>
                            <li><a href="blog-leftbar.htm#latest" data-toggle="tab">Latest</a></li>
                        </ul>
                        <div class="tab-content tab-content-bordered">
                            <!-- Popular tab content -->
                            <div class="tab-pane fade in active blog-roll-mini" id="popular">
                                <!-- Popular blog post 1 -->
                                <div class="row blog-post">
                                    <div class="col-xs-4">
                                        <div class="blog-media">
                                            <a href="blog-post.htm">
                                                <img src="img/blog/water-pump.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-8">
                                        <h5>
                                            <a href="blog-leftbar.htm#">Archaeological spaces</a>
                                        </h5>
                                    </div>
                                </div>
                                <!-- Popular blog post 2 -->
                                <div class="row blog-post">
                                    <div class="col-xs-4">
                                        <div class="blog-media">
                                            <a href="blog-post.htm">
                                                <img src="img/blog/ape.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-xs-8">
                                        <h5>
                                          <a href="blog-leftbar.htm#">Port wine cellars</a>
                                        </h5>
                                    </div>
                                </div>


                            <!-- Latest tab content -->
                            <div class="tab-pane fade blog-roll-mini" id="latest">
                                <!-- Latest blog post 1 -->
                                <div class="row blog-post">
                                    <div class="col-xs-4">
                                        <div class="blog-media">
                                            <a href="blog-post.htm">
                                              <img src="img/blog/fly.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                            </a>
                                        </div>
                                    </div>
                                <div class="col-xs-8">
                                    <h5>
                                        <a href="blog-leftbar.htm#">Holy Luzia</a>
                                    </h5>
                                </div>
                            </div>
                              <!-- Latest blog post 2 -->
                            <div class="row blog-post">
                                <div class="col-xs-4">
                                    <div class="blog-media">
                                        <a href="blog-post.htm">
                                            <img src="img/blog/water-pump.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-8">
                                    <h5>
                                        <a href="blog-leftbar.htm#">Belém Tower</a>
                                    </h5>
                                </div>
                            </div>

                            </div>
                        </div>
                    </div>

                    <!-- @Element: Subscrive button -->
                    <div class="block">
                        <a href="blog-leftbar.htm#" class="btn btn-warning"><i class="fa fa-rss"></i> Subscribe via RSS feed</a>
                    </div>

                    <!-- Follow Widget -->
                    <div class="block">
                        <h4 class="title-divider">
                            <span>Follow Us On</span>
                        </h4>
                      <!--@todo: replace with real social media links -->
                        <ul class="list-unstyled social-media-branding">
                            <li>
                              <a href="blog-leftbar.htm#" class="soci al-link branding-twitter"><i class="fa fa-twitter-square fa-fw"></i> Twitter</a>
                            </li>
                            <li>
                              <a href="blog-leftbar.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square fa-fw"></i> Facebook</a>
                            </li>
                            <li>
                              <a href="blog-leftbar.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square fa-fw"></i> LinkedIn</a>
                            </li>
                            <li>
                              <a href="blog-leftbar.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square fa-fw"></i> Google+</a>
                            </li>
                        </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--.container-->
          </div>

  
</t:layout>