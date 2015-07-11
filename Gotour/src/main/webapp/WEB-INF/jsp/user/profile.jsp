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
                <a href="about-me.htm" class="first">
                  About Me 
                  <small>More About Me</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <li>
                <a href="team.htm">
                  The Team 
                  <small>Team List</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <li>
                <a href="team-grid.htm">
                  The Team 
                  <small>Team Grid</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <li>
                <a href="team-member.htm">
                  Team Member 
                  <small>Individual Display</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
              <li>
                <a href="contact.htm">
                  Contact Us
                  <small>How to get in touch</small>
                  <i class="fa fa-angle-right"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <!--main content-->
        <div class="col-md-9">
          <h2 class="title-divider">
            <span>About <span class="de-em">Me</span></span>
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
                <c:when test="${user.avatar}">
                  <img src="#" alt="About me" class="img-responsive">
                </c:when>
                <c:otherwise>
                  <div class="alert alert-warning" style="text-align: center;">
                    <a href="<c:url value="/users/${user.id}/edit"></c:url>">add an image to your profile</a>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-md-7 col-md-pull-5">
              <c:choose>
                <c:when test="${user.description}">
                  <p class="lead">${user.description}</p>
                </c:when>
                <c:otherwise>
                  <p></p>
                </c:otherwise>
              </c:choose>
              
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

          <div class="title-divider margin-top-large">
            <h3>
              <span>Services <span class="de-em">&amp; Skills</span></span>
            </h3>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-html5 primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    HTML5
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="64" aria-valuemin="0" aria-valuemax="100" style="width: 64%;"> 64% </div>
                  </div>
                </div>
              </div>
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-css3 primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    CSS3
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="59" aria-valuemin="0" aria-valuemax="100" style="width: 59%;"> 59% </div>
                  </div>
                </div>
              </div>
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-linux primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    System Admin
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"> 85% </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-android primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    Android
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;"> 78% </div>
                  </div>
                </div>
              </div>
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-windows primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    Windows
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="79" aria-valuemin="0" aria-valuemax="100" style="width: 79%;"> 79% </div>
                  </div>
                </div>
              </div>
              <div class="row margin-top-md">
                <div class="col-md-2"><i class="fa fa-fw fa-3x fa-github-alt primary-colour-dark"></i></div>
                <div class="col-md-10">
                  <h5 class="margin-top-none">
                    GitHub
                  </h5>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="97" aria-valuemin="0" aria-valuemax="100" style="width: 97%;"> 97% </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Timeline -->
          <h3 class="title-divider margin-top-large">
            <span>Work <span class="de-em">Experience</span></span>
          </h3>
          <div class="timeline timeline-left">
            <div class="timeline-marker"></div>
            <!--Timeline item 1-->
            <div class="timeline-item timeline-item-first animated fadeIn de-02">
              <div class="timeline-item-date">Feb 2011 - March 2012</div>
              <h5 class="timeline-item-title">
                Frontend Developer @ Code Monkeys
              </h5>
              <p class="timeline-item-description">Exputo genitus hos jus luptatum quae qui scisco ullamcorper vel.</p>
            </div>
            <!--Timeline item 2 -->
            <div class="timeline-item animated fadeIn de-04">
              <div class="timeline-item-date">April 2012 - June 2012</div>
              <h5 class="timeline-item-title">
                Freelance Drupal Developer
              </h5>
              <p class="timeline-item-description">Gemino ludus nulla quadrum refoveo sino torqueo vindico. Appellatio esse saepius secundum te.</p>
            </div>
            <!--Timeline item 3- - NOTE: .highlight class -->
            <div class="timeline-item highlight animated fadeIn de-06">
              <div class="timeline-item-date">July 2012 - March 2013</div>
              <h5 class="timeline-item-title">
                Wordpress-er @ One Tree Media Inc.
              </h5>
              <p class="timeline-item-description">Abdo haero mauris nutus. Appellatio aptent erat gilvus gravis os quidem vindico.</p>
            </div>
            <!--Timeline item 4 - NOTE: the .right class-->
            <div class="timeline-item timeline-item-last animated fadeIn de-08">
              <div class="timeline-item-date">Feb 2013 - Present</div>
              <h5 class="timeline-item-title">
                CEO &amp; Developer @ Themelize.me
              </h5>
              <p class="timeline-item-description">Consectetuer ex meus natu neo obruo quia utinam. Hendrerit loquor premo tum.</p>
            </div>
            <div class="timeline-marker timeline-marker-bottom"></div>
          </div>

          <!-- Latest Projects-->
          <div class="title-divider margin-top-large">
            <h3>
              <span>Latest <span class="de-em">Projects</span></span>
              <small>See what I've been working on</small>
            </h3>
          </div>
          <div class="projects-grid">
            <!-- Uses magnific popup plugin to show enlarged version of image in gallery @see: http://dimsemenov.com/plugins/magnific-popup/documentation.html -->
            <div class="row" data-toggle="magnific-popup" data-magnific-popup-settings="{&quot;delegate&quot;: &quot;a.project&quot;, &quot;gallery&quot;:{&quot;enabled&quot;:true}}">

              <!--Timeline item 1-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-1.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-1-sm.jpg" alt="Project 1" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      Cui Iustum Metuo Sed Velit
                    </h5>
                  </span>
                </a>
              </div>

              <!--Timeline item 2-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-2.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-2-sm.jpg" alt="Project 2" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      Camur Luctus Saluto Sit Tation
                    </h5>
                  </span>
                </a>
              </div>

              <!--Timeline item 3-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-3.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-3-sm.jpg" alt="Project 3" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      At Facilisis Pecus Persto Valetudo
                    </h5>
                  </span>
                </a>
              </div>

              <!--Timeline item 4-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-4.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-4-sm.jpg" alt="Project 4" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      Commoveo Haero Quia Saepius Suscipit
                    </h5>
                  </span>
                </a>
              </div>

              <!--Timeline item 5-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-5.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-5-sm.jpg" alt="Project 5" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      Gemino Lenis Loquor Probo Singularis
                    </h5>
                  </span>
                </a>
              </div>

              <!--Timeline item 6-->
              <div class="col-sm-6 col-md-6 grid-item">
                <a href="img/projects/project-6.jpg" class="project overlay-wrapper">
                  <img src="img/projects/project-6-sm.jpg" alt="Project 6" class="img-responsive">
                  <span class="overlay">
                    <i class="fa fa-2x fa-arrow-circle-right primary-colour"></i> 
                    <h5>
                      Antehabeo Autem Gemino Interdico Loquor
                    </h5>
                  </span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</t:layout>

