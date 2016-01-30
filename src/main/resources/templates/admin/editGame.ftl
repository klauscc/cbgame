<#include "include/header.ftl">
<!-- datetime picker CSS-->
<link href="${base}/common/plugins/dateTimePicker/jquery.datetimepicker.css" rel="stylesheet">
<!-- bootsrap-fileinput CSS-->
<link href="${base}/admin/plugins/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<!-- formvalidation CSS-->
<link href="//cdn.bootcss.com/formvalidation/0.6.1/css/formValidation.min.css" rel="stylesheet">

<@adminTemplate title="编辑游戏">
    <#if editSuccess??>
        <div class="alert alert-success">
            ${editSuccess}
            <a href="${base+gameShowUrl}">查看</a>
        </div>
    </#if>
    <form role="form" id="editGame" method="post" enctype="multipart/form-data">
        <div class="col-lg-6">
            <div class="form-group">
                <label>游戏标题</label>
                <input class="form-control" name="gameId" value="${game.gameId}" type="hidden">
                <input class="form-control" name="name" value="${game.name}">
            </div>
        </div>
        <div style="clear:both;"></div>
        <div class="col-lg-4">
            <div class="form-group">
                <label>游戏类型</label>
                <@select map=gameType selectedOption="${game.typeId}" class="form-control" name="typeId"/>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label>开发者</label>
            <@select map=gameDeveloper selectedOption="${game.developerId}" class="form-control" name="developerId"/>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label>资费</label>
                <input class="form-control" name="price" value="${game.price}">
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group">
                <label>发布时间</label>
                <input class="form-control" id="publishTime" name="publishTime" value="${game.publishTime?string("yyyy-MM-dd HH:mm:ss")}">
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group">
                <label>游戏海报</label>
                <input class="form-control" id="post"  accept="image/png,image/gif,image/jpeg" name="gamePost" type="file">
                <p class="help-block">如果不修改则不选择文件</p>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group">
                <label>置顶</label>
                <@select map={"0":"否","1":"是"} selectedOption="${game.top}" name="top" id="top" class="form-control"></@select>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="form-group">
                <label>游戏平台</label>
                <input class="form-control" name="platform" value="${game.platform}">
            </div>
        </div>
        <div class="col-lg-12">
            <div class="form-group">
                <label>描述</label>
                <textarea id="gameContent" class="form-control" name="content" rows="10" style="height: 400px;">${game.content} </textarea>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="form-group">
                <label>游戏截图</label>
                <input id="images" name="image[]" type="file" accept="image/png,image/gif,image/jpeg" multiple class="file-loading">
            </div>
        </div>
        <div class="col-lg-12">
            <button type="submit" class="btn btn-default">修改</button>
        </div>
    </form>
</@adminTemplate>
<#include "include/footer.ftl">
<!-- dateTimePicker-->
<script src="${base}/common/plugins/dateTimePicker/jquery.datetimepicker.js"></script>
<!-- bootsrap-fileinput JS-->
<script src="${base}/admin/plugins/bootstrap-fileinput/js/fileinput.js"></script>
<script src="${base}/admin/plugins/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
<!--formvalidation JS-->
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/formValidation.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/framework/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/formvalidation/0.6.1/js/language/zh_CN.min.js"></script>
<!--kindEditor -->
<script charset="utf-8" src="${base}/common/plugins/kindEditor/kindeditor.js"></script>
<script charset="utf-8" src="${base}/common/plugins/kindEditor/lang/zh_CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#gameContent',{
            cssPath : base+'/common/plugins/kindEditor/plugins/code/prettify.css',
            uploadJson : base+'/kindEditor/upload',
            fileManagerJson : base+'/kindEditor/fileManager',
            allowFileManager : true
        });
    });
</script>

<script type="text/javascript">
$(function () {
    $("#publishTime").datetimepicker({
        lang: 'ch',
        timepicker: true,
        format: 'Y-m-d H:i:s'
    });
    $("#images").fileinput({
        uploadUrl: "${base}/admin/upload/images", // server upload action
        uploadAsync: true,
        maxFileCount: 10,
        initialPreview:[
                <#list game.images?split("|") as url>
                    <#if (url?length>10) >

                        '<img src="${base+url}" class="file-preview-image">\
                            <div class="file-thumbnail-footer">\
                    <div class="file-thumb-progress"><div class="progress">\
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%;">\
                    100%\
                    </div>\
                    </div></div> <div class="file-actions">\
                    <div class="file-footer-buttons">\
                    <button type="button" class="kv-file-upload btn btn-xs btn-default" title="Upload file" style="display: none;">   <i class="glyphicon glyphicon-upload text-info"></i>\
                    </button>\
                    <input id="${url?substring(url?length -16)}" name="imageUrl" value="${url}" type="hidden">\
                    <button type="button" id="initalRemove" class="kv-file-remove btn btn-xs btn-default" title="${url?substring(url?length -16)}"><i class="glyphicon glyphicon-trash text-danger"></i></button>\
                            </div>\
                            <div class="file-upload-indicator" title="Uploaded"><i class="glyphicon glyphicon-ok-sign text-success"></i></div>\
                            <div class="clearfix"></div>\
                    </div>\
                    </div> \
                        ',
                    </#if>
                </#list>
        ],
        overwriteInitial: false
    });
    $('#images').on('fileuploaded', function(event, data, previewId, index) {
        var response = data.response;
//        console.log(data);
        var input = "<input type='text' name='imageUrl' id='"+previewId+"' value='"+response.url+"' hidden>";
        $('#images').parent().append(input);
    });

    $('#images').on('filesuccessremove', function(event, id) {
//        console.log("id: "+id);
        $("input#"+id).remove();
    });
    $("button[id='initalRemove']").each(function(){
        $(this).bind('click',function(){
            var title = $(this).attr("title");
//            console.log($(this));
//            console.log("deleted id"+title);
            $(this).parent().parent().parent().parent().remove();
        });
    });



    $('#editGame').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: '游戏名称不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称长度为2到30之间'
                    }
                }
            },
            content: {
                validators: {
                    notEmpty: {
                        message: '游戏描述不能为空'
                    },
                stringLength: {
                    min: 30,
                    message: '最短为30字符'
                    }
                }
            }
        }
    });
});

</script>
<@endHtml/>