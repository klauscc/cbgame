<!--=== Footer ===-->
<div class="container" style="margin-top: 10px">
    <div class="row margin-bottom-10">
        <div class="col-md8">
            <a href="${base}/register" style="margin-right: 20px;font-size: medium"><img class="resize_small" src="${base}/home/assets/img/others/cm.png">&nbsp;&nbsp;防沉迷 </a>
            <a href="${base}/familySafety" style="font-size: large;"><img class="resize_small" src="${base}/home/assets/img/others/jh.png">&nbsp;&nbsp;家长监护 </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md12 bg-light" style="margin-bottom: 0">
            <p align="center" style="margin-bottom: 0">健康游戏公告: 抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防受骗上当 适度游戏益脑 沉迷游戏伤身 合理安排时间 享受健康生活</p>
        </div>
    </div>
</div><!--/container-->
<!--=== End Footer ===-->

<!--=== Copyright ===-->
<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-md8">
                <p align="center">上海触宝信息技术有限公司 版权所有 &copy;2016 <a href="http://www.miitbeian.gov.cn/" target="_blank">沪ICP备12012934号-2</a></p>
            </div>
            <div class="col-md4">
                <a href="${base}/"><img id="logo-footer" src="${base}/home/assets/img/logo.png" style="height: 40px;" class="pull-right" alt="" /></a>
            </div>
        </div><!--/row-->
    </div><!--/container-->
</div><!--/copyright-->
<!--=== End Copyright ===-->

<!-- JS Global Compulsory -->
<script type="text/javascript" src="${base}/common/plugins/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${base}/home/assets/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${base}/common/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="${base}/home/assets/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="${base}/home/assets/plugins/bxslider/jquery.bxslider.js"></script>
<script type="text/javascript" src="${base}/home/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="${base}/home/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="${base}/home/assets/plugins/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="${base}/home/assets/js/app.js"></script>
<script type="text/javascript" src="${base}/home/assets/js/pages/index.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
//        App.initSliders();
        App.initBxSlider1();
        Index.initRevolutionSlider();
        Index.setNavActive();
    });
</script>
<!--[if lt IE 9]>
<script src="${base}/common/js/html5shiv.js"></script>
<script src="${base}/common/js/respond.min.js"></script>
<![endif]-->
