<#include "include/header.ftl">
<@adminTemplate title=article.title>
    <#if edited??>
    <div class="alert alert-success">修改成功
        <a href="${base+goLink}">查看</a>
    </div>
    </#if>
    <form role="form" id="editArticle" method="post"
          <#if editUrl??>
          action="${base+editUrl}"
          </#if>
            >
        <div class="col-lg-12">
            <div class="form-group">
                <label>内容</label>
                <input hidden name="articleId" value="${article.articleId}">
                <textarea class="form-control" name="content" rows="6" >${article.content}</textarea>
            </div>
            <div class="col-lg-12">
                <button type="submit" class="btn btn-default">添加</button>
            </div>
        </div>
    </form>
</@adminTemplate>
<#include "include/footer.ftl">
<!--kindEditor -->
<script charset="utf-8" src="${base}/common/plugins/kindEditor/kindeditor.js"></script>
<script charset="utf-8" src="${base}/common/plugins/kindEditor/lang/zh_CN.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('textarea[name="content"]',kindEditorOption);
    });
</script>
<@endHtml/>