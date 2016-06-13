<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <#include "../../common.ftl">
    <title>${title?default("触宝游戏")}</title>

    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- CSS Global Compulsory-->
    <link rel="stylesheet" href="${base}/common/plugins/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${base}/home/assets/css/style.css" />
    <link rel="stylesheet" href="${base}/home/assets/css/headers/header2.css" />
    <link rel="stylesheet" href="${base}/home/assets/plugins/bootstrap/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${base}/home/assets/css/style_responsive.css" />
    <link rel="shortcut icon" href="${base}/favicon.ico" />
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${base}/home/assets/plugins/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="${base}/home/assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="${base}/home/assets/plugins/bxslider/jquery.bxslider.css" />
    <link rel="stylesheet" href="${base}/home/assets/plugins/revolution_slider/css/rs-style.css" media="screen" />
    <link rel="stylesheet" href="${base}/home/assets/plugins/revolution_slider/rs-plugin/css/settings.css" media="screen" />

        <!-- CSS Theme -->
    <link rel="stylesheet" href="${base}/home/assets/css/themes/default.css" id="style_color" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
<!--=== Header ===-->
<div class="header">
    <div class="container">
        <!-- Logo -->
        <div class="logo" style="padding:10px;">
            <a href="${base}/"><img id="logo-header" src="${base}/home/assets/img/logo.png" style="height: 40px" alt="Logo" /></a>
        </div><!-- /logo -->

        <!-- Menu -->
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav top2">
                    <li id="home">
                        <a href="${base}/">主页
                        </a>
                    </li>
                    <li id="about">
                        <a href="${base}/about">公司简介
                        </a>
                    </li>
                    <li id="game">
                        <a href="${base}/game">游戏
                        </a>
                    </li>
                    <li id="familySafety">
                        <a href="${base}/familySafety" class="dropdown-toggle" data-toggle="dropdown">家长监护
                            <b class="caret" style="padding-bottom: 0"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${base}/familySafety/about">简介</a></li>
                            <li><a href="${base}/familySafety/process">申请流程</a></li>
                            <li><a href="${base}/familySafety/FAQs">常见问题</a></li>
                            <li><a href="${base}/familySafety/contactUs">联系我们</a></li>
                        </ul>
                        <b class="caret-out"></b>
                    </li>
                    <li id="contactUs">
                        <a href="${base}/contactUs">联系我们</a>
                    </li>
                    <li>
                        <a href="${base}/register">会员注册
                        </a>
                    </li>
                </ul>
            </div><!-- /nav-collapse -->
        </nav><!-- /navbar -->

    </div><!-- /container -->
</div><!--/header -->
<!--=== End Header ===-->
