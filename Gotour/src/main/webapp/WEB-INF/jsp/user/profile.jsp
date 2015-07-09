<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<t:layout pageTitle="GoTour - Profile">
  <div id="content">
    <div class="container" id="about">
      <div class="row">
        <!-- sidebar -->
        <div class="col-md-3 sidebar">

          <!-- Sections Menu-->
          <div class="section-menu">
            <ul class="nav nav-list">
              <li class="nav-header">In This Section</li>
              <li class="active">
                <a href="team-member.htm">
                  Team Member 
                  <small>Individual Display</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <!--main content-->
        <div class="col-md-9">
          <h2 class="title-divider">
            <span>The <span class="de-em">Team</span></span>
          </h2>
          <!-- The team list -->
          <div class="team team-list margin-top-large">
            <!--Team Member jimi-->
            <div class="team-member team-member-full">
              <div class="row">
                <div class="col-sm-2">
                  <img src="img/team/jimi.jpg" class="img-thumbnail" alt="Jimi" />
                  <a href="editarPerfil.htm#">Edit Profile</a>
                </div>
                <div class="col-sm-7">
                  <h3 class="name">
                    Jimi
                  </h3>
                  <p class="role">Guide</p>
                  <p class="member-since">Team member since: Oct 2013</p><br/>

                  <p>Phone: 935 860 200</p>
                  <p>Hello</p>
                  <p>Loquor quis vero. Commodo ea genitus ille iusto mauris nulla pecus praemitto si. Dolus gravis macto tincidunt. Damnum luctus molior obruo probo quibus uxor.</p>
                  <div class="social-media-branding">
                    <!--@todo: replace with real social share links -->
                    <a href="team-member.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                  </div>
                </div>
                <div class="col-sm-3">
                  <h5 class="margin-top-large">
                    Posts By Jimi
                  </h5>
                  <div class="blog-roll-mini">
                    <!-- Member blog posts 1 -->
                    <div class="row blog-post">
                      <div class="col-xs-3">
                        <div class="blog-media">
                          <a href="blog-post.htm">
                            <img src="img/blog/fly.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                          </a>
                        </div>
                      </div>
                      <div class="col-xs-9">
                        <h5>
                          <a href="team-member.htm#">CAVES OF PORT WINE</a>
                        </h5>
                      </div>
                    </div>
                    <!-- Member blog posts 2 -->
                    <div class="row blog-post">
                      <div class="col-xs-3">
                        <div class="blog-media">
                          <a href="blog-post.htm">
                            <img src="img/blog/butterfly.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                          </a>
                        </div>
                      </div>
                      <div class="col-xs-9">
                        <h5>
                          <a href="team-member.htm#">FOOD TOUR</a>
                        </h5>
                      </div>
                    </div>
                    <!-- Member blog posts 3 -->
                    <div class="row blog-post">
                      <div class="col-xs-3">
                        <div class="blog-media">
                          <a href="blog-post.htm">
                            <img src="img/blog/fly.jpg" alt="Picture of frog by Ben Fredericson" class="img-responsive" />
                          </a>
                        </div>
                      </div>
                      <div class="col-xs-9">
                        <h5>
                          <a href="team-member.htm#">GRANADA GOURMET TOUR</a>
                        </h5>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- The team list -->
          <div class="team team-list margin-top-large">
            <h4>
              Other Team Members
            </h4>          
            <!--Team Member adele-->
            <div class="team-member">
              <div class="row">
                <div class="col-sm-2">
                  <a href="team-member.htm" title="View Adele's profile">
                    <img src="img/team/adele.jpg" class="img-thumbnail" alt="Adele" />
                  </a>
                </div>
                <div class="col-sm-10">
                  <h4 class="name">
                    <a href="team-member.htm" title="View Adele's profile">Adele</a>
                  </h4>
                  <p class="role">Guide</p>
                  <p>Hello</p>
                  <p>Phone: 930 870 200</p>
                  <div class="social-media-branding social-media-branding-sm">
                    <!--@todo: replace with real social share links -->
                    <a href="team-member.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <!--Team Member bono-->
            <div class="team-member">
              <div class="row">
                <div class="col-sm-2">
                  <a href="team-member.htm" title="View Bono's profile">
                    <img src="img/team/bono.jpg" class="img-thumbnail" alt="Bono" />
                  </a>
                </div>
                <div class="col-sm-10">
                  <h4 class="name">
                    <a href="team-member.htm" title="View Bono's profile">Bono</a>
                  </h4>
                  <p class="role">Guide</p>
                  <p>Hello</p>
                  <p>Phone: 930 870 200</p>

                  <div class="social-media-branding social-media-branding-sm">
                    <!--@todo: replace with real social share links -->
                    <a href="team-member.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                  </div>
                </div>
              </div>
            </div>

            <!--Team Member robert-->
            <div class="team-member">
              <div class="row">
                <div class="col-sm-2">
                  <a href="team-member.htm" title="View Robert's profile">
                    <img src="img/team/robert.jpg" class="img-thumbnail" alt="Robert" />
                  </a>
                </div>
                <div class="col-sm-10">
                  <h4 class="name">
                    <a href="team-member.htm" title="View Robert's profile">Robert</a>
                  </h4>
                  <p class="role">Guide</p>
                  <p>Hello</p>
                  <p>Phone: 930 870 200</p>

                  <div class="social-media-branding social-media-branding-sm">
                    <!--@todo: replace with real social share links -->
                    <a href="team-member.htm#" class="social-link branding-twitter"><i class="fa fa-twitter-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-facebook"><i class="fa fa-facebook-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-linkedin"><i class="fa fa-linkedin-square"></i></a>
                    <a href="team-member.htm#" class="social-link branding-google-plus"><i class="fa fa-google-plus-square"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </t:layout>

