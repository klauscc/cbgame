<#include "include/header.ftl" >
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">
<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-20">
    <div class="container">
        <h1 class="color-green pull-left">游戏充值</h1>
    </div>
    <!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->
<!--=== Content Part ===-->
<div class="container">
    <div class="row blog-page blog-item">
        <!-- Left Sidebar -->
        <div class="col-md-3">
            <div class="headline"><h3>支付方式</h3></div>
            <div id="payMethod" class="btn-group-vertical" role="group" aria-label="Vertical button group">
                <button type="button" class="btn btn-default btn-success">支付宝</button>
                <button type="button" class="btn btn-default">微信支付</button>
            </div>
        </div>
        <div class="col-md-9">
            <div class="headline"><h4>您当前选择的是<span id="payMethodHead" style="color:#FF6600">支付宝</span>支付方式，请填写一下信息:</h4>
            </div>
            <form role="form" id="paymentForm">
                <div class="form-group">
                    <label>选择游戏</label>
                <@select map=gameList selectedOption="-1" class="form-control" name="gameId"/>
                </div>
                <div class="form-group">
                    <label>充值账户手机号</label>
                    <input type="text" class="form-control" name="tel" placeholder="账户手机号">
                </div>
                <div class="form-group">
                    <label>确认手机号</label>
                    <input type="text" class="form-control" name="telConfirm" placeholder="确认手机号">
                </div>
                <div class="form-group">
                    <label>充值金额</label>
                <@select map={"1":"1 RMB","5":"5 RMB","10":"10 RMB","20":"20 RMB","30":"30 RMB","50":"50 RMB","100":"100 RMB","200":"200 RMB","500":"500 RMB","800":"800 RMB","1000":"1000 RMB","5000":"5000 RMB","10000":"10000 RMB"} selectedOption="1" class="form-control" name="payValue" />
                    <p class="help-block">获得道具:<span id="getCurrency" style="color:#FF6600"> </span></p>
                </div>
                <button id="confirmPayment" class="btn-u btn-u-blue">确认充值</button>
            </form>
        </div>
    </div>
</div>

<#include "include/footer.ftl" >
<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>

<!--lightbox JS -->
<script src="${base}/common/plugins/lightbox2/dist/js/lightbox.min.js"></script>
<script>
    var gamePaymentOptions = {};
    <#if gamePaymentOptions??>
        <#assign keys=gamePaymentOptions?keys>
        <#list keys as key>
            gamePaymentOptions[${key}] = {};
            gamePaymentOptions[${key}].rate=${gamePaymentOptions[key].rate?c};
            gamePaymentOptions[${key}].currency='${gamePaymentOptions[key].currency}';
        </#list>
    </#if>
//    console.log(gamePaymentOptions);

    $(function () {
        var gameId=$('select[name="gameId"]').val();
        var rmb = $('select[name="payValue"]').val();
        var rate = gamePaymentOptions[gameId].rate;
        var currency = gamePaymentOptions[gameId].currency;
        $("#getCurrency").html(rmb*rate+currency);


        $(".btn").click(function () {
            $(this).siblings().removeClass("btn-success");
            $(this).addClass("btn-success");
            $("#payMethodHead").html($(this).html());
        });

        $('select').change(function () {
            var gameId=$('select[name="gameId"]').val();
            var rmb = $('select[name="payValue"]').val();
            var rate = gamePaymentOptions[gameId].rate;
            var currency = gamePaymentOptions[gameId].currency;
            $("#getCurrency").html(rmb*rate+currency);
//            console.log($("#getCurrency"));
        });
        $('#paymentForm').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                tel: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 15,
                            message: '手机号长度不符'
                        },
                        regexp: {
                            regexp: /^[0-9\-\+]+$/,
                            message: '手机号格式不符'
                        }
                    }
                },
                telConfirm: {
                    validators: {
                        callback: {
                            callback: function (value, validator, $field) {
                                var tel = $("input[name='tel']").val();
                                if ($field.val() == tel) {
                                    return {
                                        valid: true,
                                        message: 'ok'
                                    }
                                } else {
                                    return {
                                        valid: false,
                                        message: '两次输入手机号不一致'
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
    });
</script>
<@endHtml/>