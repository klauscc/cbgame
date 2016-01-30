<!DOCTYPE html>
<!--[if IE 7]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<head>
<#include "../common.ftl">
    <title>${title?default("触宝游戏")}</title>

    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
<#assign defaultHeader=base+"/home/assets/img/user/default_header.jpg">
<link href="${base}/common/plugins/lightbox2/dist/css/lightbox.min.css" rel="stylesheet">
<body>

<a href="${defaultHeader}"  class="example-image-link" data-lightbox="image" data-title="haha.test"><img class="img-responsive"></a>


<#--<script type="text/javascript" src="${base}/common/plugins/jquery/dist/jquery.min.js"></script>-->

<!--lightbox JS -->
<script src="${base}/common/plugins/lightbox2/dist/js/lightbox-plus-jquery.js"></script>
<@endHtml/>