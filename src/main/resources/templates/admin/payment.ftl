<#include "include/header.ftl">

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

            <p class="help-block">1元兑换的虚拟货币数量</p>
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
<script>
    var gamePaymentOptions = {};
    <#if gamePaymentOptions??>
        <#assign keys=gamePaymentOptions?keys>
        <#list keys as key>
        gamePaymentOptions[${key}] = {};
        gamePaymentOptions[${key}].rate =${gamePaymentOptions[key].rate?c};
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

    });
</script>
<@endHtml/>