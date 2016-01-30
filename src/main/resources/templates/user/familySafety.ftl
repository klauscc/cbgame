<#include "include/header.ftl" >

<!--=== Breadcrumbs ===-->
<div class="row breadcrumbs margin-bottom-40">
    <div class="container">
        <h1 class="pull-left">家长监护</h1>
        <ul class="pull-right breadcrumb">
            <li><a href="${base}/familySafety/about">简介</a>  </li>
            <li><a href="${base}/familySafety/process">申请流程</a> </li>
            <li><a href="${base}/familySafety/FAQs">常见问题</a> </li>
            <li><a href="${base}/familySafety/contactUs">联系我们</a> </li>
        </ul>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

    <div class="container">
        <div class="row margin-bottom-30">
            ${article.content}
        </div>
    </div>
<#include "include/footer.ftl" >
<script>
    var url = window.location;
    var element = $('ul.breadcrumb li a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).css('color','#72c02c');
</script>
<@endHtml/>