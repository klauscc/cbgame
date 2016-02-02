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
            <div class="blog margin-bottom-30">
                <div class="col-md-12"><h3 style="margin-left: 30px">${game.name}</h3></div>
                <div style="clear:both;"></div>
                <div class="col-md-12" style="border-top: solid 1px #eee">
                    <div class="col-md-4">
                        <div class="blog-img"><img src="${base+game.post}" class="img-responsive" alt="" /></div>
                    </div>
                    <div class="col-md-4" style="margin-top: 30px">
                        <ul class="list-unstyled" style="font-size: 18px">
                            <li>发布时间:  ${game.publishTime?string("yyyy-MM-dd HH:mm:ss")}</li>
                            <li>游戏类型:  ${gameType.name}</li>
                            <li>资费:  ${game.price}</li>
                            <li>游戏平台:  ${game.platform}</li>
                            <li>评分: ${rate?string("0.#")}分 / ${comments?size}人评价</li>
                        </ul>
                    </div>
                </div>
                <div style="clear:both;"></div>
                <div class="headline"><h4>游戏截图 </h4></div>
                <div class="col-md-12" style="clear: both">
                    <ul id="list" class="bxslider recent-work">
                       <#if (gameImages?size > 0) >
                            <#list gameImages as image>
                                <a href="${base+image}" data-lightbox="image">
                                    <img class="img-responsive" src="${base+image}">
                                </a>
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

            <div class="headline"><h4>评论 </h4></div>
        <#if (comments?size > 0)>
            <#list comments as comment>
                <div class="media">
                    <a class="pull-left">
                        <img class="media-object" src="${defaultHeader}" alt="" />
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">${comment.nickName} <span style="left: 20%">评分: ${comment.rate?string("0.#")}分</span><span>发表于${comment.timeAdded?string("yyyy-MM-dd HH:mm:ss")}</span></h4>
                        <p>${comment.content} </p>
                    </div>
                </div><!--/media-->
                <hr />
            </#list>
            </#if>
            <hr />
            <!-- Leave a Comment -->
            <div class="post-comment">
                <h3 class="color-green">添加评论</h3>
                <form id="commentForm" method="post" action="${base}/comment/add" class="form-horizontal">
                <input type="hidden" name="gameId" value="${game.gameId}">
                <input type="hidden" name="currentUrl" value="${currentUrl}">
                <div class="form-group col-lg-5">
                <label class="control-label col-lg-2">昵称</label>
                <div class="col-lg-6"> <input type="text" name="nickName" class="form-control" /></div>
                </div>
                <div style="clear:both;"></div>
                <div class="form-group col-lg-5">
                    <label class="control-label col-lg-2">评分</label>
                    <div class="col-lg-8">
                        <div id="commentRate" ></div>
                        <div id="commentRateHint"></div>
                    </div>
                </div>

                <div class="form-group col-lg-10">
                <label class="control-label">内容</label>
                <textarea name="content" rows="8" class="form-control"></textarea>
                </div>

                <div class="form-group col-lg-4">
                    <label class="col-lg-2 control-label">验证码</label>
                    <div class="col-lg-4"><input type="text" id="token" name="token" class="form-control"></div>
                    <div class="col-lg-2"><img src="${base}/pcrimg" style="height: 30px;margin-bottom: 10px" id="checkCodeImg"></div>
                </div>
                <div class="form-group col-lg-6">
                    <div id="commentMsg" class="col-lg-9" style="padding: 6px;display: none;"></div>
                    <div class="col-lg-3"><button type="submit" class="btn-u">发表评论</button></div>
                </div>
                </form>
            </div><!--/post-comment-->
        </div>
    </div>
</div>

<#include "include/footer.ftl" >
<script type="text/javascript" src="${base}/home/assets/plugins/jquery-raty/lib/jquery.raty.min.js"></script>

<!--lightbox JS -->
<script src="${base}/common/plugins/lightbox2/dist/js/lightbox.min.js"></script>
<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#commentRate').raty(
            {
                cancelOff     : base+'/home/assets/plugins/jquery-raty/lib/img/cancel-off.png',
                cancelOn      : base+'/home/assets/plugins/jquery-raty/lib/img/cancel-on.png',
                starHalf      : base+'/home/assets/plugins/jquery-raty/lib/img/star-half.png',
                starOff       : base+'/home/assets/plugins/jquery-raty/lib/img/star-off.png',
                starOn        : base+'/home/assets/plugins/jquery-raty/lib/img/star-on.png',
                precision: true,
                target: '#commentRateHint',
                targetKeep: true,
                score: 5,
                scoreName: 'rate'
            }
    );
    $('#commentForm')
        .formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                content: {
                    validators: {
                        notEmpty: {
                            message: '评论内容不能为空'
                        }
                    }
                }
            }
        })
        .on('success.form.fv',function(e) {
            e.preventDefault();
            var $form = $(e.target),
            fv = $form.data('formValidation');
                // Use Ajax to submit form data
            $.ajax({
                url: $form.attr('action'),
                type: 'POST',
                data: $form.serialize(),
                success: function (result) {
                    var data = eval("("+result+")");
                    console.log(data);
                    if(data.error == 1){

                        $('#commentMsg').addClass('alert alert-danger').css('display','block').text(data.msg);
                        changeImg();
                    } else{
                        $('#commentMsg').removeClass('alert-danger').addClass('alert-success').css('display','block').text(data.msg);
                        window.location.reload();
                    }
                }
            });
            fv.disableSubmitButtons(false);
        });
    $('#checkCodeImg').click(changeImg);


});
function changeImg() {
    var imgSrc = $('#checkCodeImg');
    var src = imgSrc.attr('src');
    imgSrc.attr('src', chgUrl(src));
}
function chgUrl(url) {
    var timestamp = (new Date()).valueOf();
    if(url.indexOf('?') != -1){
        url = url.split('?')[0];
    }
        url = url + "?timestamp=" + timestamp;
    return url;
}


</script>
<@endHtml/>