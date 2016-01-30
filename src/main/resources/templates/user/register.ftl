<#include "include/header.ftl">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">

<!--=== Breadcrumbs ===-->
<div class="breadcrumbs margin-bottom-40">
    <div class="container">
        <h1 class="color-green pull-left">会员注册</h1>
    </div>
    <!--/container-->
</div><!--/breadcrumbs-->
<!--=== End Breadcrumbs ===-->

<!--=== Content Part ===-->
<div class="container">
    <div class="row">
        <form class="reg-page" style="margin-bottom: 15%" method="post" id="regForm" action="${base}/register">
            <h3>会员注册</h3>

            <div class="form-group ">
                <label>用户名</label>
                <input class="form-control" type="text" name="userName"/>
            </div>
            <div class="form-group ">
                <label>真实姓名</label>
                <input class="form-control" type="text" name="realName"/>
            </div>
            <div class="form-group ">
                <label>身份证号</label>
                <input class="form-control" type="text" name="idCard"/>
            </div>
            <div class="form-group ">
                <label>邮箱</label>
                <input class="form-control" type="text" name="email"/>
            </div>
            <div class="form-group ">
                <label>手机号</label>
                <input class="form-control" type="text" name="tel"/>
            </div>
            <div class="form-group ">
                <label>密码</label>
                <input class="form-control" type="password" name="password"/>
            </div>
            <div class="form-group ">
                <label>确认密码</label>
                <input class="form-control" type="password" name="passwordConfirm"/>
            </div>

            <div class="form-group input-group">
                <input type="text" id="token" name="token" class="form-control" placeholder="验证码">
                <span class="input-group-addon" style="padding: 0"><img src="${base}/pcrimg" style="height: 30px"
                                                                        id="checkCodeImg"></span>
            </div>
            <div id="registerMsg" class="col-lg-12" style="padding: 6px;display: none;"></div>
            <button class="btn-u pull-right" type="submit">注册</button>
            <hr/>
        </form>
    </div>
    <!--/row-fluid-->
</div><!--/container-->
<!--=== End Content Part ===-->


<#include "include/footer.ftl">

<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#regForm')
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
                                },
                                stringLength: {
                                    min: 5,
                                    max: 15,
                                    message: '用户名在5~15之间'
                                }
                            }
                        },
                        realName: {
                            validators: {
                                notEmpty: {
                                    message: '用户名不能为空'
                                },
                                stringLength: {
                                    min: 2,
                                    max: 15,
                                    message: '真实姓名长度在2~15之间'
                                }
                            }
                        },
                        idCard: {
                            validators: {
                                notEmpty: {
                                    message: '身份证不能为空'
                                },
                                stringLength: {
                                    min: 18,
                                    max: 18,
                                    message: '身份证号长度不符'
                                },
                                callback:{
                                    callback: function (value, validator, $field) {
                                        if(IdCardValidate(value)) {
                                            return {
                                                valid: true,
                                                message: 'ok'
                                            }
                                        }else{
                                            return {
                                                valid: false,
                                                message: '无效的身份证号'
                                            }
                                        }
                                    }
                                },
                                remote: {
                                    message: '该身份证号已注册',
                                    url: base + '/register/validate',
                                    data: function (validator, $field, value) {
                                        return {
                                            type: 'idCard',
                                            value: validator.getFieldElements('idCard').val()
                                        };
                                    },
                                    delay: 1000,
                                    type: 'POST'
                                }
                            }
                        },
                        password: {
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
                        passwordConfirm: {
                            validators: {
                                callback: {
                                    callback: function (value, validator, $field) {
                                        var password = $("input[name='password']").val();
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
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: '邮箱不能为空'
                                },
                                emailAddress: {
                                    message: '邮箱格式不正确'
                                },
                                remote: {
                                    message: '邮箱已注册',
                                    url: base + '/register/validate',
                                    data: function (validator, $field, value) {
                                        return {
                                            type: 'email',
                                            value: validator.getFieldElements('email').val()
                                        };
                                    },
                                    delay: 1000,
                                    type: 'POST'
                                }
                            }
                        },
                        tel: {
                            validators: {
                                notEmpty: {
                                    message: '手机号不能为空'
                                },
                                stringLength: {
                                    min: 11,
                                    max: 11,
                                    message: '手机号长度不符'
                                },
                                regexp: {
                                    regexp: /^[0-9\-]+$/,
                                    message: '身份证号格式不符'
                                },
                                remote: {
                                    message: '手机号已注册',
                                    url: base + '/register/validate',
                                    data: function (validator, $field, value) {
                                        return {
                                            type: 'tel',
                                            value: validator.getFieldElements('tel').val()
                                        };
                                    },
                                    delay: 1000,
                                    type: 'POST'
                                }
                            }
                        }
                    }
                })
                .on('success.form.fv', function (e) {
                    e.preventDefault();
                    var $form = $(e.target),
                            fv = $form.data('formValidation');
                    // Use Ajax to submit form data
                    $.ajax({
                        url: $form.attr('action'),
                        type: 'POST',
                        data: $form.serialize(),
                        success: function (result) {
                            var data = eval("(" + result + ")");
                            console.log(data);
                            if (data.error != 0) {
                                $('#registerMsg').addClass('alert alert-danger').css('display', 'block').text(data.msg);
                                changeImg();
                            } else {
                                $('#registerMsg').removeClass('alert-danger').addClass('alert-success').css('display', 'block').text(data.msg);
                                alert(data.msg);
                                window.location.href = base + data.to;
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
        if (url.indexOf('?') != -1) {
            url = url.split('?')[0];
        }
        url = url + "?timestamp=" + timestamp;
        return url;
    }
</script>
<script>
    var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // 加权因子
    var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // 身份证验证位值.10代表X
    function IdCardValidate(idCard) {
        idCard = trim(idCard.replace(/ /g, ""));               //去掉字符串头尾空格
        if (idCard.length == 15) {
            return isValidityBrithBy15IdCard(idCard);       //进行15位身份证的验证
        } else if (idCard.length == 18) {
            var a_idCard = idCard.split("");                // 得到身份证数组
            if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   //进行18位身份证的基本验证和第18位的验证
                return true;
            }else {
                return false;
            }
        } else {
            return false;
        }
    }
    /**
     * 判断身份证号码为18位时最后的验证位是否正确
     * @param a_idCard 身份证号码数组
     * @return
     */
    function isTrueValidateCodeBy18IdCard(a_idCard) {
        var sum = 0;                             // 声明加权求和变量
        if (a_idCard[17].toLowerCase() == 'x') {
            a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作
        }
        for ( var i = 0; i < 17; i++) {
            sum += Wi[i] * a_idCard[i];            // 加权求和
        }
        valCodePosition = sum % 11;                // 得到验证码所位置
        if (a_idCard[17] == ValideCode[valCodePosition]) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * 验证18位数身份证号码中的生日是否是有效生日
     * @param idCard 18位书身份证字符串
     * @return
     */
    function isValidityBrithBy18IdCard(idCard18){
        var year =  idCard18.substring(6,10);
        var month = idCard18.substring(10,12);
        var day = idCard18.substring(12,14);
        var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));
        // 这里用getFullYear()获取年份，避免千年虫问题
        if(temp_date.getFullYear()!=parseFloat(year)
                ||temp_date.getMonth()!=parseFloat(month)-1
                ||temp_date.getDate()!=parseFloat(day)){
            return false;
        }else{
            return true;
        }
    }
    /**
     * 验证15位数身份证号码中的生日是否是有效生日
     * @param idCard15 15位书身份证字符串
     * @return
     */
    function isValidityBrithBy15IdCard(idCard15){
        var year =  idCard15.substring(6,8);
        var month = idCard15.substring(8,10);
        var day = idCard15.substring(10,12);
        var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));
        // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法
        if(temp_date.getYear()!=parseFloat(year)
                ||temp_date.getMonth()!=parseFloat(month)-1
                ||temp_date.getDate()!=parseFloat(day)){
            return false;
        }else{
            return true;
        }
    }
    //去掉字符串头尾空格
    function trim(str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
</script>
<@endHtml />