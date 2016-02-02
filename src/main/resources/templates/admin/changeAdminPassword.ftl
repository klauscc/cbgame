<#include "include/header.ftl">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">
<@adminTemplate title="修改密码">
    <#if flag??>
        <#if flag=="true">
        <div class="alert alert-success">${msg}
        </div>
        <#else >
        <div class="alert alert-success">${msg}
        </div>
        </#if>
    </#if>
<form role="form" id="changePassword" method="post">
    <div class="col-lg-12">
        <div class="form-group">
            <label>原密码</label>
            <input class="form-control" name="oldPassword" type="password">
        </div>
        <div class="form-group">
            <label>新密码</label>
            <input class="form-control" name="newPassword" type="password">
        </div>
        <div class="form-group">
            <label>确认密码</label>
            <input class="form-control" name="newPasswordConfirm" type="password">
        </div>
        <div class="col-lg-12">
            <button type="submit" class="btn btn-default">修改</button>
        </div>
    </div>
</form>
</@adminTemplate>
<#include "include/footer.ftl">
<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>
<script>
    $(function () {
        $('#changePassword')
                .formValidation({
                    framework: 'bootstrap',
                    icon: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        oldPassword: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                }
                            }
                        },
                        newPassword: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 20,
                                    message: '密码长度为6~20之间'
                                }
                            }
                        },
                        newPasswordConfirm: {
                            validators: {
                                callback: {
                                    callback: function (value, validator, $field) {
                                        var password = $("input[name='newPassword']").val();
//                                        console.log(password);
//                                        console.log("confirm" + $field.val());
                                        if ($field.val() == password) {
                                            return {
                                                valid: true,
                                                message: 'ok'
                                            }
                                        } else {
                                            return {
                                                valid: false,
                                                message: '两次输入密码不一致'
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