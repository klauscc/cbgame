<#include "include/header.ftl">
<#macro sliderContent gameId src title content data_x>

    <img src="${base+src}" xmlns="http://www.w3.org/1999/html"/>

    <div class="caption sft big_black" style="background-color: rgba(0,0,0,0)" data-x="${data_x}" data-y="120" data-speed="300" data-start="1200" data-easing="easeOutExpo">
        ${title}
    </div>
    <div class="caption lfb medium_grey" data-x="${data_x}" style="background-color: rgba(0,0,0,0)" data-y="215" data-speed="300" data-start="1400" data-easing="easeOutExpo">
        ${content?substring(0,9)}
    </div>
    <div class="caption lfb medium_grey" data-x="${data_x}" style="background-color: rgba(0,0,0,0)" data-y="250" data-speed="300" data-start="1600" data-easing="easeOutExpo">
        ${content?substring(10,19)}...<a href="${base}/game/${gameId}">查看详情</a>
    </div>
</#macro>



<!--=== Slider ===-->
<div class="fullwidthbanner-container">
    <div class="fullwidthabnner">
        <ul>
            <#if (games?size < 4)>
                <#if (games?size > 0)>
                    <#list games as game>
                        <li data-transition="3dcurtain-vertical" data-slotamount="10" data-masterspeed="300" data-thumb="${base}/home/assets/img/sliders/revolution/thumbs/thumb1.jpg">
                            <@sliderContent gameId="${game.gameId}" src="${game.post}" title="${game.name}" content="${game.content}" data_x=150 />
                        </li>
                    </#list>
                </#if>
            <#else >
                <!-- THE FIRST SLIDE -->
                <li data-transition="3dcurtain-vertical" data-slotamount="10" data-masterspeed="300" data-thumb="${base}/home/assets/img/sliders/revolution/thumbs/thumb1.jpg">
                    <@sliderContent gameId="${games[0].gameId}" src="${games[0].post}" title="${games[0].name}" content="${games[0].content}" data_x=150 />
                </li>

                <!-- THE SECOND SLIDE -->
                <li data-transition="papercut" data-slotamount="15" data-masterspeed="300" data-delay="9400" data-thumb="${base}/home/assets/img/sliders/revolution/thumbs/thumb2.jpg">
                    <@sliderContent gameId="${games[1].gameId}" src="${games[1].post}" title="${games[1].name}" content="${games[1].content}" data_x=175 />
                </li>

                <!-- THE THIRD SLIDE -->
                <li data-transition="slideleft" data-slotamount="1" data-masterspeed="300" data-thumb="${base}/home/assets/img/sliders/revolution/thumbs/thumb3.jpg">
                    <@sliderContent gameId="${games[2].gameId}" src="${games[2].post}" title="${games[2].name}" content="${games[2].content}" data_x=200 />
                </li>

                <!-- THE FOURTH SLIDE -->
                <li data-transition="flyin" data-slotamount="1" data-masterspeed="300" data-thumb="${base}/home/assets/img/sliders/revolution/thumbs/thumb4.jpg">
                    <@sliderContent gameId="${games[3].gameId}" src="${games[3].post}" title="${games[3].name}" content="${games[3].content}" data_x=225 />
                </li>
            </#if>
        </ul>
        <div class="tp-bannertimer tp-bottom"></div>
    </div>
</div>
<!--=== End Slider ===-->

<!--=== Content Part ===-->
<div class="container" style="margin-top: 30px">
    <!-- Service Blocks -->
    <div class="row-fluid servive-block">
        <div class="span4">
            <h4>关于触乐</h4>
            <p><i class="icon-bullhorn"></i></p>
            <p>上海触乐信息科技有限公司，是一家致力于手游开发、推广的新型互联网公司，工作环境优美，氛围轻松。</p>
        </div>
        <div class="span4">
            <h4>商务合作</h4>
            <p><i class="icon-lightbulb"></i></p>
            <p>我们有着优秀的商务团队，丰富的运营经验，触乐游戏欢迎与您合作。</p>
        </div>
        <div class="span4">
            <h4>联系我们</h4>
            <p><i class="icon-envelope"></i></p>
            <p>邮箱：taric.gao@cootek.cn</br>
                联系电话：021-51602610</br>
                公司地址：上海市徐汇区虹梅路2007号7号楼2、3层</p>
        </div>
    </div><!--/row-fluid-->
    <!-- //End Service Blokcs -->

    <!-- quality games -->
    <div class="headline"><h3>精品游戏 &nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 50%;color:#72c02c "> 本网站所有游戏适合18岁以上用户</span></h3></div>
    <div class="row margin-bottom-40">
        <ul id="list" class="bxslider recent-work">
        <#list games as game>
            <li>
                <a href="${base}/game/${game.gameId?c}">
                    <em class="overflow-hidden"><img src="${base+game.post}" alt="${game.name}" class="img-responsive"/></em>
                    <span>
                        <strong>${game.name?html}</strong>
                        <i>
                        ${game.content?substring(0,20)?html}...
                        </i>
                    </span>
                </a>
            </li>
        </#list>
        </ul>
    </div><!--/row-->
    <!-- //End quality games-->
</div><!--/container-->
<!-- End Content Part -->

<#include "include/footer.ftl">
<@endHtml/>