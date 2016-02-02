<#include "include/header.ftl">
<!-- DataTables CSS -->
<link href="${base}/foradmin/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="${base}/foradmin/plugins/datatables-responsive/css/responsive.dataTables.scss" rel="stylesheet">

<@adminTemplate title="管理游戏">
<#if top??>
    <div class="alert alert-success">
        <a href="${base+gameUrl}">${gameName}</a>${top}
    </div>
</#if>
<#if deleteFlag??>
    <#if deleteFlag=="true">
        <div class="alert alert-success">
            ${gameName+msg}
        </div>
    <#else >
    <div class="alert alert-warning">
        ${msg}
    </div>
    </#if>
</#if>

<table class="table table-striped table-bordered table-hover" id="manageGame">
    <thead>
    <tr>
        <th>游戏名称</th>
        <th>修改日期</th>
        <th>置顶</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
        <#list games as game>
            <tr>
                <td>${game.name}</td>
                <td>${game.timeEdit?string("yyyy-MM-dd HH:mm:ss")}</td>
                <td>
                    <#if game.top == 1>
                        是
                        <#else>
                            否
                    </#if>
                </td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            操作
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li>
                                <#if game.top == 0>
                                    <a href="${base}/admin/game/edit/top/${game.gameId}?is=1">置顶</a>
                                    <#else>
                                        <a href="${base}/admin/game/edit/top/${game.gameId}?is=0">取消置顶</a>
                                </#if>
                            </li>
                            <li><a href="${base}/admin/game/edit/${game.gameId}">编辑</a>
                            </li>
                            <li>
                                <a class="" data-toggle="modal" data-target="#deleteModal" data-name="${game.name}" data-deleteurl="${base}/admin/game/delete/${game.gameId}">
                                    删除
                                </a>
                            </li>

                        </ul>
                    </div>
                </td>
            </tr>
        </#list>
    </tbody>
</table>
</@adminTemplate>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <a id="modalDeleteLink"><button type="button" class="btn btn-primary">删除</button></a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<#include "include/footer.ftl">
<!-- DataTables JavaScript -->
<script src="${base}/foradmin/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${base}/foradmin/plugins/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#manageGame').DataTable({
            responsive: true,
            order: [[2,'desc'],[1,'desc']]
        });
        $("#deleteModal").on("show.bs.modal", function (event) {
            var button = $(event.relatedTarget);
            var name = $(button).data("name");
            var deleteUrl = $(button).data("deleteurl");
            var modal = $(this);
            modal.find('.modal-title').text('删除 ' + name);
            modal.find('.modal-body').text('确认删除 '+name+' 吗?');
//            console.log(deleteUrl);
            modal.find('.modal-footer a').attr('href',deleteUrl);
        });
    });
</script>
<@endHtml/>