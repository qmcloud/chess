<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="MenuManagement.aspx.cs" Inherits="GameAdminWeb.SystemManagement.MenuManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">菜单管理</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../SystemManagement/AccountManagement.aspx?page=SystemManagement&type=AM">系统管理</a> </li>
                <li class="active">菜单管理</li>
            </ul>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-content">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered page-header table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 3em;"><input  type="checkbox" id="checkall" title="全选"/></th>
                                    <th>id</th>
                                    <th>菜单编号</th>
                                    <th>菜单名称</th>
                                    <th>排序</th>
                                    <th>上级菜单编码</th>
                                    <th style="width: 4.5em;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpt_role" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><input  type="checkbox" value="<%#Eval("menu_code")%>" name="ckbid"/></td>
                                            <td><%#Eval("id")%></td>
                                            <td><%#Eval("menu_code")%></td>
                                            <td><%#Eval("menu_name")%></td>
                                            <td><%#Eval("sequence")%></td>
                                            <td><%#Eval("parent_menucode")%></td>
                                            <td>
                                                <asp:LinkButton ID="lbtPermissions" runat="server" OnCommand="lbtPermissions_Command" CommandArgument='<%#Eval("menu_code") %>' Visible='<%# DataBinder.Eval(Container.DataItem, "parent_menucode").ToString() == "systemmanagement"?true:false %>'><i class="fa fa-wrench" title="授权" ></i></asp:LinkButton>
                                                <asp:LinkButton ID="lbtshow" runat="server" OnCommand="lbtshow_Command" CommandArgument='<%#Eval("id") %>'><i class="fa fa-pencil" title="修改" ></i></asp:LinkButton>
                                                <asp:LinkButton ID="lbtn_delete" runat="server" OnCommand="lbtn_delete_Command" CommandArgument='<%#Eval("menu_code") %>' OnClientClick="return confirm('确定删除？');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr id="ControlsSet" runat="server">
                                    <td colspan="7">
                                        <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lbldelete" runat="server" OnClick="lbtn_delete_Click" OnClientClick="return confirm('确定删除所有选择项？');"><i class="fa fa-trash-o"  title="删除" style="font-size:x-large;"></i></asp:LinkButton>
                                        <asp:LinkButton ID="lblrefresh" runat="server" OnClick="lblrefresh_Click"><i class="fa fa-refresh" title="刷新" style="font-size:x-large;"></i></asp:LinkButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <nav style="text-align: center">
                        <ul class="pagination">
                            <li><a class="current">第<asp:Literal ID="ltr_current" runat="server"></asp:Literal>页</a></li>
                            <li>
                                <asp:LinkButton ID="lbt_home" runat="server" OnClick="lbt_home_Click" CssClass="visible-lg">首页</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lbt_prev" runat="server" OnClick="lbt_prev_Click">上一页</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lbt_next" runat="server" OnClick="lbt_next_Click">下一页</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="lbt_last" runat="server" OnClick="lbt_last_Click" CssClass="visible-lg">尾页</asp:LinkButton></li>
                            <li><a class="current">共<asp:Literal ID="ltr_sum" runat="server"></asp:Literal>页</a></li>
                        </ul>
                    </nav>
                </div>
                <input type="text" name="txt_id" class="form-control" id="txt_id" runat="server" placeholder="id" visible="false">
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="permissionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">授权</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lblmenucode" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="tree well " id="MenuM" runat="server">
                            <%--<div class="form-group">
                                <label class="col-sm-2 control-label">管理员:</label>
                                <input id="Checkbox1" type="checkbox" name="admin" value="add" />添加
                                <input id="Checkbox2" type="checkbox" name="admin" value="edit" />编辑
                                <input id="Checkbox3" type="checkbox" name="admin" value="delete" />删除
                                <input id="Checkbox4" type="checkbox" name="admin" value="view" />查找
                                <input id="Checkbox5" type="checkbox" name="admin" value="search" />查看
                                <input id="Checkbox6" type="checkbox" name="admin" value="export" />导出
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">管理员:</label>
                                <input id="Checkbox1" type="checkbox" name="admin" value="add" />添加
                                <input id="Checkbox2" type="checkbox" name="admin" value="edit" />编辑
                                <input id="Checkbox3" type="checkbox" name="admin" value="delete" />删除
                                <input id="Checkbox4" type="checkbox" name="admin" value="view" />查找
                                <input id="Checkbox5" type="checkbox" name="admin" value="search" />查看
                                <input id="Checkbox6" type="checkbox" name="admin" value="export" />导出
                            </div>--%>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblpermissions" runat="server" OnClick="lblpermissions_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>  
        </div>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改菜单信息</h4>
                    </div>
                    <div class="modal-body">
                        <%--<div class="form-group" style="display: none;">
                            <label>id</label>
                            <input type="text" name="txt_id" class="form-control" id="txt_id" runat="server" placeholder="id">
                        </div>--%>
                        <div class="form-group">
                            <label>菜单编号</label>
                            <input type="text" name="txt_key" class="form-control" id="txt_key" runat="server" placeholder="菜单编号">
                        </div>
                        <div class="form-group">
                            <label>菜单名称</label>
                            <input type="text" name="txt_name" class="form-control" id="txt_name" runat="server" placeholder="菜单名称" />
                        </div>
                        <div class="form-group">
                            <label>排序</label>
                            <input type="text" name="txt_order" class="form-control" id="txt_order" runat="server" placeholder="排序" />
                        </div>
                        <div class="form-group">
                            <label>上级菜单编码</label>
                            <input type="text" name="txt_parent" class="form-control" id="txt_parent" runat="server" placeholder="上级菜单编码" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblSave" runat="server" OnClick="lblSave_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <hr />
            <%--<p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>

    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).ready(function () {
                $('.table-responsive input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    increaseArea: '20%'
                });
                $('#checkall').on('ifChecked', function (event) {
                    $('[name=ckbid]:checkbox').iCheck('check');
                });
                $('#checkall').on('ifUnchecked', function (event) {
                    $('[name=ckbid]:checkbox').iCheck('uncheck');
                });
            });
        });

        $(function () {
            $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '展开');
            $('.tree li.parent_li > span').on('click', function (e) {
                var children = $(this).parent('li.parent_li').find(' > ul');
                if (children.is(":visible")) {
                    children.hide('fast');
                    $(this).attr('title', '展开').find(' > i');
                } else {
                    children.show('fast');
                    $(this).attr('title', '收缩').find(' > i');
                }
                e.stopPropagation();
            });
            $(document).ready(function () {
                $('.modal-content input').iCheck({
                    checkboxClass: 'icheckbox_flat-blue',
                    increaseArea: '50%'
                });
            });
        });
    </script>
</asp:Content>
