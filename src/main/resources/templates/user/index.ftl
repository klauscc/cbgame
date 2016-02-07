<#include "include/header.ftl">

<!--=== Slider ===-->
<div class="flexslider">
    <ul class="slides">
        <#if (games?size > 0)>
            <#list games as game>
                <#if (game_index > 3) ><#break ></#if>
                <li>
                    <a href="${base}/game/${game.gameId}">
                        <img src="${base+game.post}"  />
                    </a>
                </li>
            </#list>
        </#if>
    </ul>

</div>
<!--=== End Slider ===-->

<!--=== Content Part ===-->
<div class="container" style="margin-top: 30px">
    <!-- Service Blocks -->
    <div class="row-fluid servive-block">
        <div class="span4">
            <h4>关于触宝</h4>

            <p><i class="icon-bullhorn"></i></p>

            <p>触宝科技被誉为“全球十大最创新公司 ”，用户遍布160多个国家和地区，触宝电话和触宝输入法两款APP用户总数过6亿。  BBC、CNN、TechCrunch和Engadget等国外知名媒体都曾对触宝科技有过报导。</p>
        </div>
        <div class="span4">
            <h4>商务合作</h4>

            <p><i class="icon-lightbulb"></i></p>

            <p>我们有着优秀的商务团队，丰富的运营经验，触乐游戏欢迎与您合作。</p>
        </div>
        <div class="span4">
            <h4>联系我们</h4>

            <p><i class="icon-envelope"></i></p>

            <p>邮箱：Life-bd@cootek.cn</br>
                联系电话：13681796079</br>
                公司地址：上海市徐汇区虹梅路2007号7号楼2、3层</p>
        </div>
    </div>
    <!--/row-fluid-->
    <!-- //End Service Blokcs -->

    <!-- quality games -->
    <div class="headline"><h3>精品游戏 &nbsp;&nbsp;&nbsp;&nbsp;<span
            style="font-size: 50%;color:#72c02c "> 本网站所有游戏适合18岁以上用户</span></h3></div>
    <div class="row margin-bottom-40">
        <ul id="list" class="bxslider recent-work">
        <#list games as game>
            <#--<#if (game.images != "")>-->
                <#--<#assign imageSrc = game.images?split("|")[0]>-->
            <#--<#else >-->
                <#--<#assign imageSrc = game.post>-->
            <#--</#if>-->
            <li>
                <a href="${base}/game/${game.gameId?c}">
                    <em class="overflow-hidden"><img src="${base+game.post}" alt="${game.name}" class="img-responsive"/></em>
                    <span>
                        <strong>${game.name?html}</strong>
                        <i>
                        <#--${game.content?substring(0,20)?html}...-->
                        </i>
                    </span>
                </a>
            </li>
        </#list>
        </ul>
    </div>
    <!--/row-->
    <!-- //End quality games-->
</div><!--/container-->
<!-- End Content Part -->

<#include "include/footer.ftl">
<script>
    $(function () {
        $('.flexslider').flexslider({
            animation: "slide"
        });
    });
</script>
<@endHtml/>