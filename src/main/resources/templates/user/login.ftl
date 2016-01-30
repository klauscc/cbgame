<#include "include/header.ftl">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-40">
    <div class="container">
        <h1 class="color-green pull-left">登陆</h1>
    </div><!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">
    <div class="row">
        <form class="log-page" style="margin-bottom: 15%" method="post" id="loginForm" action="${base}/login">
        <h3>登陆</h3>
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="icon-user"></i></span>
            <input class="form-control" type="text" name="userName" />
        </div>
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="icon-lock"></i></span>
            <input class="form-control" type="password" name="password" />
        </div>
        <div class="form-group input-group">
        <input type="text" id="token" name="token" class="form-control" placeholder="验证码">
        <span class="input-group-addon" style="padding: 0"><img src="${base}/pcrimg" style="height: 30px" id="checkCodeImg"></span>
        </div>
        <div id="loginMsg" class="col-lg-12" style="padding: 6px;display: none;"></div>
        <button class="btn-u pull-right" type="submit">登陆</button>
            <hr />
        </form>
    </div><!--/row-fluid-->
</div><!--/container-->
<!--=== End Content Part ===-->


<#include "include/footer.ftl">

<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>
<script type="text/javascript">
$(function () {
    $('#loginForm')
        .formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userName: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
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
                        if(data.error != 0){
                            $('#loginMsg').addClass('alert alert-danger').css('display','block').text(data.msg);
                            changeImg();
                        } else{
                            $('#loginMsg').removeClass('alert-danger').addClass('alert-success').css('display','block').text(data.msg);
                            window.location.href= base+data.to;
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
<@endHtml />