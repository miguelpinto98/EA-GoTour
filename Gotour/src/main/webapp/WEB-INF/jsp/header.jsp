<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar-static-top">

  <!--Header upper region-->
  <div class="header-upper">
    <div class="header-upper-inner container">
      <div class="row">
        <div class="col-xs-8 col-xs-push-4">

          <!--social media icons-->
          <div class="social-media">
            <!--@todo: replace with company social media details-->
            <a href="#"> <i class="fa fa-twitter-square"></i> </a>
            <a href="#"> <i class="fa fa-facebook-square"></i> </a>
            <a href="#"> <i class="fa fa-linkedin-square"></i> </a>
            <a href="#"> <i class="fa fa-google-plus-square"></i> </a>
          </div>
        </div>
        <div class="col-xs-4 col-xs-pull-8">

          <!--user menu-->
          <div class="btn-group user-menu">
            <a href="login.htm" class="btn btn-link login-mobile"><i class="fa fa-user"></i></a>
            <a href="index.html#signup-modal" class="btn btn-link signup" data-toggle="modal">Sign Up</a>
            </li>
            <a href="index.html#login-modal" class="btn btn-link login" data-toggle="modal">Login</a> 
            <div class="btn-group language-menu">
              <!--language menu-->
              <a href="index.html#en" class="btn btn-link dropdown-toggle" data-toggle="dropdown"><span class="flag-icon flag-icon-gb"></span></a>
              <ul class="dropdown-menu dropdown-menu-mini dropdown-menu-primary">
                <li>
                  <a href="index.html#es" class="lang-es"><span class="flag-icon flag-icon-es"></span> Spanish</a>
                </li>
                <li>
                  <a href="index.html#pt" class="lang-pt"><span class="flag-icon flag-icon-pt"></span> Portguese</a>
                </li>
                <li>
                  <a href="index.html#cn" class="lang-cn"><span class="flag-icon flag-icon-cn"></span> Chinese</a>
                </li>
                <li>
                  <a href="index.html#se" class="lang-se"><span class="flag-icon flag-icon-se"></span> Swedish</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--Header search region - hidden by default -->
  <div class="header-search">
    <form class="search-form container">
      <input type="text" name="search" class="form-control search" value="" placeholder="Search">
      <button type="button" class="btn btn-link"><span class="sr-only">Search </span><i class="fa fa-search fa-flip-horizontal search-icon"></i></button>
      <button type="button" class="btn btn-link close-btn" data-toggle="search-form-close"><span class="sr-only">Close </span><i class="fa fa-times search-icon"></i></button>
    </form>
  </div>

  <!--Header & Branding region-->
  <div class="header" data-toggle="clingify">
    <div class="header-inner container">
      <div class="navbar">
        <div class="pull-left">
          <!--branding/logo-->
          <a class="navbar-brand" href="#" title="Home">
            <h1>
              <span>Go</span>Tour
            </h1>
          </a>
          <div class="slogan">Go Easy</div>
        </div>
      </div>
    </div>
  </div>
</div>