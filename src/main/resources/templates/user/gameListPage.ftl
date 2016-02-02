<#include "include/header.ftl" >

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
    <div class="container">
        <h1 class="color-green pull-left">所有游戏</h1>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<!--=== Content Part ===-->
<div class="container">
    <div class="row blog-page blog-item">
        <!-- Left Sidebar -->
        <div class="col-md-12">
            <#if (games?size > 0) >
                <#list games as game>
                    <hr/>
                    <div class="blog margin-bottom-30 clearfix">
                        <div class="col-md-3">
                            <div class="blog-img"><img src="${base+game.post}" class="img-responsive" alt="" /></div>
                        </div>
                        <div class="col-md-9" style="margin-top: 30px">
                            <a href="${base}/game/${game.gameId}">
                            <h3>${game.name?html}</h3>
                            <ul class="list-unstyled list-inline" style="margin-bottom: 10px">
                                <li><i class="icon-calendar"></i>  ${game.publishTime?string("yyyy-MM-dd HH:mm:ss")}</li>
                                <li><i class="icon-tag"></i>  ${gameTypes[game_index].name}</li>
                                <li><i class="icon-comments"></i> ${gameRates[game_index]?string("0.#")}分 / ${commentCounts[game_index]}人评价</li>
                            </ul>
                            <p>
                                ${gameDescribe[game_index]}
                            </p>
                            </a>
                        </div>
                    </div>
                </#list>
            </#if>

        </div>
    </div>
</div>
<#include "include/footer.ftl" >
<@endHtml/>