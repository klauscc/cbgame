<!DOCTYPE html>
<html lang="en">

<head>
    <#include "../../common.ftl">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title?default("触宝游戏|管理平台")}</title>

    <!-- Bootstrap Core CSS -->
    <link href="${base}/foradmin/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${base}/foradmin/plugins/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="${base}/foradmin/dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${base}/foradmin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${base}/foradmin/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${base}/admin">触乐游戏管理平台</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li><a href="${base}/admin/logout">登出</a> </li>
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fa fa-gamepad fa-fw"></i> 游戏<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${base}/admin/game/add">添加游戏</a>
                            </li>
                            <li>
                                <a href="${base}/admin/game/manage">管理游戏</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa  fa-child fa-fw"></i> 家长监护<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${base}/admin/familySafety/about">简介</a>
                            </li>
                            <li>
                                <a href="${base}/admin/familySafety/process">申请流程</a>
                            </li>
                            <li>
                                <a href="${base}/admin/familySafety/FAQs">常见问题</a>
                            </li>
                            <li>
                                <a href="${base}/admin/familySafety/contactUs">联系我们</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="${base}/admin/about"><i class="fa fa-group fa-fw"></i> 公司简介</a>
                    </li>
                    <li>
                        <a href="${base}/admin/contactUs"><i class="fa fa-envelope fa-fw"></i> 联系我们</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> 用户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${base}/admin/user/manage">管理用户</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-plus-circle"></i> 其它<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${base}/admin/user/changeAdminPassword">修改密码</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
