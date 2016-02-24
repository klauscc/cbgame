<#include "include/header.ftl">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">

<@adminTemplate title="修改游戏充值配置">
    <#if flag??>
    <div class="alert alert-success">
    ${msg}
    </div>
    </#if>

<form role="form" id="changePaymentOption" method="post">
    <div class="form-group">
        <label>选择游戏</label>
        <@select map=gameMap selectedOption='${editGameId!"-1"}' class="form-control" name="gameId" />
    </div>
    <div class="col-lg-6">
        <div class="form-group">
            <label>汇率</label>
            <input type="text" class="form-control" name="rate" value=""/>
            <p class="help-block">兑换汇率，多组以";"分开,以";"结尾。例如: <span style="color: red">1:100;2:200;</span></p>
        </div>
    </div>
    <div class="col-lg-6 clearfix">
        <div class="form-group">
            <label>货币单位</label>
            <input type="text" class="form-control" name="currency" value=""/>

            <p class="help-block">兑换的货币名称</p>
        </div>
    </div>
    <button class="btn btn-primary" type="submit">修改</button>
</form>

</@adminTemplate>
<#include "include/footer.ftl">
<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>

<script>
    var gamePaymentOptions = {};
    <#if gamePaymentOptions??>
        <#assign keys=gamePaymentOptions?keys>
        <#list keys as key>
        gamePaymentOptions[${key}] = {};
        gamePaymentOptions[${key}].rate ="${gamePaymentOptions[key].rate}";
        gamePaymentOptions[${key}].currency = '${gamePaymentOptions[key].currency}';
        </#list>
    </#if>
</script>
<script>

    $(function () {

        var gameId = $('select[name="gameId"]').val();
        $('input[name="rate"]').val(gamePaymentOptions[gameId].rate);
        $('input[name="currency"]').val(gamePaymentOptions[gameId].currency);

        $('select[name="gameId"]').change(function () {
            var gameId = $(this).val();
            $('input[name="rate"]').val(gamePaymentOptions[gameId].rate);
            $('input[name="currency"]').val(gamePaymentOptions[gameId].currency);
        });

        $('#changePaymentOption').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                rate: {
                    validators: {
                        notEmpty: {
                            message: '不能为空'
                        },
                        regexp: {
                            regexp: /^([0-9]+:[0-9]+;)+$/,
                            message: '格式不符要求'
                        }
                    }
                }
            }
        });
    });
</script>
<@endHtml/>