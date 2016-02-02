<#include "include/header.ftl">
<!-- DataTables CSS -->
<link href="${base}/foradmin/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="${base}/foradmin/plugins/datatables-responsive/css/responsive.dataTables.scss" rel="stylesheet">

<@adminTemplate title="管理用户">

<table class="table table-striped table-bordered table-hover" id="manageUser">
    <thead>
    <tr>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>身份证号</th>
        <th>邮箱</th>
        <th>手机号</th>
        <th>添加日期</th>
        <th>权限</th>
        <th>状态</th>
    </tr>
    </thead>
    <tbody>
        <#list users as user>
        <tr>
            <td>${user.userName}</td>
            <td>${user.realName}</td>
            <td>${user.idCard}</td>
            <td>${user.email}</td>
            <td>${user.tel}</td>
            <td>${user.timeAdded?string("yyyy-MM-dd HH:mm:ss")}</td>
            <td>${user.authority}</td>
            <td>
                <#if user.enabled>
                    可用
                <#else >
                    不可用
                </#if>
            </td>
        </tr>
        </#list>
    </tbody>
</table>
</@adminTemplate>

<#include "include/footer.ftl">
<!-- DataTables JavaScript -->
<script src="${base}/foradmin/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${base}/foradmin/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#manageUser').DataTable({
            responsive: true,
            order: [[5, 'desc']]
        });
    });
</script>
<@endHtml/>