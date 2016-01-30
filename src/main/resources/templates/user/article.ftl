<#include "include/header.ftl" >
<!--=== Breadcrumbs ===-->
<div class="row breadcrumbs margin-bottom-40">
    <div class="container">
        <h1 class="pull-left">${article.title}</h1>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">
    <div class="row margin-bottom-30">
        <div class="col-md-12">
            ${article.content}
        </div>
    </div><!--/row-->
</div>
<#include "include/footer.ftl" >
<@endHtml/>