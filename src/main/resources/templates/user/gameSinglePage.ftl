<#include "include/header.ftl" >
<#assign defaultHeader=base+"/home/assets/img/user/default_header.jpg">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">
<link href="${base}/common/plugins/lightbox2/dist/css/lightbox.min.css" rel="stylesheet">

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
    <div class="container">
        <h1 class="color-green pull-left">游戏详情</h1>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<!--=== Content Part ===-->
<div class="container">
    <div class="row blog-page blog-item">
        <!-- Left Sidebar -->
        <div class="col-md-12">
            <div class="blog margin-bottom-30 clearfix">
                <div class="col-md-12"><h3 style="margin-left: 30px">${game.name}</h3></div>
                <div style="clear:both;"></div>
                <div class="col-md-12" style="border-top: solid 1px #eee">
                    <div class="col-md-4">
                        <div class="blog-img"><img src="${base+game.post}" class="img-responsive" alt="" /></div>
                    </div>
                    <div class="col-md-4" style="margin: 19px 0">
                        <ul class="list-unstyled" style="font-size: 14px">
                            <li>发布时间:  ${game.publishTime?string("yyyy-MM-dd HH:mm:ss")}</li>
                            <li>游戏类型:  ${gameType.name}</li>
                            <li>资费:  ${game.price}</li>
                            <li>游戏平台:  ${game.platform}</li>
                        </ul>
                    </div>
                    <div class="col-md-4" style="margin: 25px 0">
                        <a href="${game.downloadUrl}" target="_blank"><button class="btn-u btn-u-large btn-u-sea">游戏链接</button></a>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div class="headline"><h4>游戏截图 </h4></div>
                <div class="col-md-12" style="clear: both">
                    <ul id="list" class="bxslider recent-work">
                       <#if (gameImages?size > 0) >
                            <#list gameImages as image>
                            <li>
                                <a href="${base+image}" data-lightbox="image">
                                    <em class="overflow-hidden"><img class="img-responsive" src="${base+image}"></em>
                                </a>
                            </li>
                            </#list>

                       </#if>
                    </ul>
                </div>
                <div class="headline"><h4>描述 </h4></div>
                <div class="col-md-12" style="clear: both;">
                    ${game.content}
                </div>
            </div>

            <hr />

        </div>
    </div>
</div>

<#include "include/footer.ftl" >

<!--lightbox JS -->
<script src="${base}/common/plugins/lightbox2/dist/js/lightbox.min.js"></script>

<@endHtml/>