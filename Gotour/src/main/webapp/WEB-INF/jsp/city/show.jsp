<%-- 
    Document   : show
    Created on : 8/jul/2015, 0:38:57
    Author     : Cristiana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<t:layout pageTitle="GoTour - Show city">
  <div id="content">
    <div class="container"
        <!--main content-->
        <div class="col-md-12">
            <h2 class="title-divider">
                <span><span class="de-em">Braga</span></span>
             </h2>

            <h4 class="title">
                <span><span class="de-em">Points of interest</span></span>
            </h4>

          <!-- The team -->
            <div class="team team-grid margin-top-large">
                <div class="row" data-toggle="isotope-grid" data-isotope-options='{"layoutMode": "fitRows", "itemSelector": ".grid-item"}'>

                    <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                        <div class="team-member">
                            <a href="team-member.htm" title="BomJesus">
                            <img src="img/team/jimi.jpg" class="img-thumbnail" alt="Jimi" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Bom Jesus</a>
                        </h5>
                        <p class="role">Descrição</p>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                        <div class="team-member">
                            <a href="team-member.htm" title="Se">
                            <img src="img/team/adele.jpg" class="img-thumbnail" alt="Adele" />
                            </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Sé de Braga</a>
                        </h5>
                        <p class="role">Descrição</p>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                        <div class="team-member">
                        <a href="team-member.htm" title="BasilicaCongregados">
                            <img src="img/team/bono.jpg" class="img-thumbnail" alt="Bono" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Basílica dos Congregados</a>
                        </h5>
                        <p class="role">Descrição</p>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                        <div class="team-member">
                            <a href="team-member.htm" title="BasilicaSameiro">
                                <img src="img/team/robert.jpg" class="img-thumbnail" alt="Robert" />
                            </a>
                            <h5 class="name">
                                <a href="team-member.htm" title="">Basílica do Sameiro</a>
                            </h5>
                            <p class="role">Descrição</p>
                        </div>
                    </div>
                </div>
            </div>


            <h4 class="title">
                <span><span class="de-em">Tours</span>   </span><button type="button" class="btn btn-primary">View more</button>
            </h4>

            <!-- The team -->
            <div class="team team-grid margin-top-large">
                <div class="row" data-toggle="isotope-grid" data-isotope-options='{"layoutMode": "fitRows", "itemSelector": ".grid-item"}'>

                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="Gastronomic">
                            <img src="img/team/jimi.jpg" class="img-thumbnail" alt="Jimi" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Gastronomic tour</a>
                        </h5>
                        <p class="role">Descrição</p>
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="Cultural">
                            <img src="img/team/adele.jpg" class="img-thumbnail" alt="Adele" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Cultural tour</a>
                        </h5>
                        <p class="role">Descrição</p>
                    </div>
                </div>


                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="Archaeological">
                            <img src="img/team/bono.jpg" class="img-thumbnail" alt="Bono" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">Archaeological tour</a>
                        </h5>
                        <p class="role">Descrição</p>
                    </div>
                </div>

                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="BasilicaSameiro">
                            <img src="img/team/robert.jpg" class="img-thumbnail" alt="Robert" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="">tour...</a>
                        </h5>
                        <p class="role">Descrição</p>
                    </div>
                </div>
                </div>
            </div>

            <h4 class="title">
                <span><span class="de-em">Guides</span></span>
            </h4>

            <div class="team team-grid margin-top-large">
                <div class="row" data-toggle="isotope-grid" data-isotope-options='{"layoutMode": "fitRows", "itemSelector": ".grid-item"}'>

                <!--Team Member jimi-->
                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                    <a href="team-member.htm" title="View Jimi's profile">
                        <img src="img/team/jimi.jpg" class="img-thumbnail" alt="Jimi" />
                    </a>
                    <h5 class="name">
                        <a href="team-member.htm" title="View Jimi's profile">Jimi</a>
                    </h5>
                    <p class="role">Descrição</p>
                    <div class="social-media-branding social-media-branding-xs">
                        <!--@todo: replace with real social share links -->
                        <a href="team-grid.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                    </div>
                    </div>
                </div>

                 <!--Team Member adele-->
                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="View Adele's profile">
                            <img src="img/team/adele.jpg" class="img-thumbnail" alt="Adele" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="View Adele's profile">Adele</a>
                        </h5>
                        <p class="role">Descrição</p>
                        <div class="social-media-branding social-media-branding-xs">
                            <!--@todo: replace with real social share links -->
                            <a href="team-grid.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                        </div>
                    </div>
                </div>

                 <!--Team Member bono-->
                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="View Bono's profile">
                            <img src="img/team/bono.jpg" class="img-thumbnail" alt="Bono" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="View Bono's profile">Bono</a>
                        </h5>
                        <p class="role">Descrição</p>
                    <div class="social-media-branding social-media-branding-xs">
                        <!--@todo: replace with real social share links -->
                        <a href="team-grid.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                        <a href="team-grid.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                    </div>
                    </div>
                </div>

                <!--Team Member robert-->
                <div class="col-xs-6 col-sm-4 col-md-3 grid-item">
                    <div class="team-member">
                        <a href="team-member.htm" title="View Robert's profile">
                            <img src="img/team/robert.jpg" class="img-thumbnail" alt="Robert" />
                        </a>
                        <h5 class="name">
                            <a href="team-member.htm" title="View Robert's profile">Robert</a>
                        </h5>
                        <p class="role">Descrição</p>
                        <div class="social-media-branding social-media-branding-xs">
                            <!--@todo: replace with real social share links -->
                            <a href="team-grid.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                            <a href="team-grid.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</t:layout>
