<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar-static-top">

    <!--Header upper region-->
    <div class="header-upper">
        <div class="header-upper-inner container">
            <div class="row">
                <div class="col-xs-8 col-xs-push-4">

                    <!--social media icons-->
                    <div class="social-media">
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
                            <c:choose>
                                <c:when test="${user == null}">
                                <a href="<c:url value="/users/signup"/>" class="btn btn-link signup" data-toggle="modal">Sign Up</a>
                                </li>
                                <a href="<c:url value="/users/login"/>" class="btn btn-link login" data-toggle="modal">Login</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value="/users/${user.id}"/>" class="btn btn-link login" data-toggle="modal">${user.name}</a>
                                </li>
                                <a href="<c:url value="/users/logout"/>" class="btn btn-link login" data-toggle="modal">Logout</a>
                            </c:otherwise>
                        </c:choose>

                        <div class="btn-group language-menu">
                            <!--language menu-->
                            <a href="#en" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="flag-icon flag-icon-gb"></span></a>
                            <ul class="dropdown-menu dropdown-menu-mini dropdown-menu-primary">
                                <li>
                                    <a href="#en" class="lang-en"><span class="flag-icon flag-icon-gb"></span> English</a>
                                </li>
                                <li>
                                    <a href="#es" class="lang-es"><span class="flag-icon flag-icon-es"></span> Spanish</a>
                                </li>
                                <li>
                                    <a href="#pt" class="lang-pt"><span class="flag-icon flag-icon-pt"></span> Portuguese</a>
                                </li>
                                <li>
                                    <a href="#cn" class="lang-cn"><span class="flag-icon flag-icon-cn"></span> Chinese</a>
                                </li>
                                <li>
                                    <a href="#se" class="lang-se"><span class="flag-icon flag-icon-se"></span> Swedish</a>
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
                    <a class="navbar-brand" href="<c:url value="/"/>" title="Home">
                        <h1>
                            <span>Go</span>Tour
                        </h1>
                    </a>
                    <div class="slogan">Go Easy</div>
                </div>

                <!--Search trigger -->
                <a href="#search" class="search-form-tigger" data-toggle="search-form" data-target=".header-search">
                    </span>
                    <i class="fa fa-search fa-flip-horizontal search-icon"></i>
                </a>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" id="pages-drop" data-toggle="dropdown" data-hover="dropdown" aria-expanded="false">Thematics</a>

                            <ul class="dropdown-menu" role="menu" aria-labelledby="pages-drop">
                                <li><a href="<c:url value="/tours/theme/1"/>" class="menu-item">Free Tours</a></li>
                                <li><a href="<c:url value="/tours/theme/2"/>" class="menu-item">Food Tours</a></li>
                                <li><a href="<c:url value="/tours/theme/3"/>" class="menu-item">Walking Tours</a></li>
                                <li><a href="<c:url value="/tours/theme/4"/>" class="menu-item">Night Tours</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"></li>
                        <li class="dropdown"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>