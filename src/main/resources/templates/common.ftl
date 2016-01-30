<#assign base=request.contextPath>
<#-- 结束文档-->
<#macro endHtml>
</body>
</html>
</#macro>
<#--select 标签-->
<#macro select map selectedOption extra...>
    <select
        <#list extra?keys as attr>
            ${attr}="${extra[attr]?html}"
        </#list>
    >
        <#list map?keys as id>
            <option value="${id}"
                    <#if selectedOption==id>selected="selected"</#if>
            >
                ${map[id]?html}
            </option>
        </#list>
    </select>
</#macro>
<#macro adminTemplate title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">${title}</h1>
        </div>
        <!-- /.col-lg-12 -->
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <#nested>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</#macro>
<script language="JavaScript">
    base = "${base}";
    kindEditorOption = {
        cssPath : base+'/common/plugins/kindEditor/plugins/code/prettify.css',
        uploadJson : base+'/kindEditor/upload',
        fileManagerJson : base+'/kindEditor/fileManager',
        allowFileManager : true,
        height: '500px'
    };
</script>