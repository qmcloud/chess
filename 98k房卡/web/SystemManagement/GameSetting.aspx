<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="GameSetting.aspx.cs" Inherits="GameAdminWeb.SystemManagement.GameSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">游戏设置</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../SystemManagement/AccountManagement.aspx?page=SystemManagement&type=AM">系统管理</a> </li>
                <li class="active">游戏设置</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-content">
                    <div class="main-content">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered page-header table-striped">
                                <thead>
                                    <tr>
                                        <th id="Set" runat="server" style="width: 3em;"><input  type="checkbox" id="checkall" title="全选"/></th>
                                        <th>参数编码</th>
                                        <th>参数值</th>
                                        <th>参数描述</th>
                                        <th style="width: 4.5em;" id="Controls" runat="server"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_Status" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td id="Set" runat="server"><input  type="checkbox" value="<%#Eval("StatusName")%>" name="ckbid"/></td>
                                                <td><%#Eval("StatusName")%></td>
                                                <td><%#Eval("StatusValue")%></td>
                                                <td><%#Eval("StatusString")%></td>
                                                <td id="Controls" runat="server">
                                                    <%--data-toggle="modal" data-target="#myModal"--%>
                                                    <asp:LinkButton ID="lbtshow" runat="server" OnCommand="lbtshow_Command" CommandArgument='<%#Eval("StatusName") %>'><i class="fa fa-pencil" ></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtn_delete" runat="server" OnCommand="lbtn_delete_Command" CommandArgument='<%#Eval("StatusName") %>' OnClientClick="return confirm('确定删除？');"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <tr id="ControlsSet" runat="server">
                                        <td colspan="5">
                                            <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbtn_delete" runat="server" OnClick="lbtn_delete_Click" OnClientClick="return confirm('确定删除所有选择项？');"><i class="fa fa-trash-o"  title="删除" style="font-size:x-large;"></i></asp:LinkButton>
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
                                    <asp:LinkButton ID="lbt_home" runat="server" CssClass="visible-lg" OnClick="lbt_home_Click">首页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_prev" runat="server" OnClick="lbt_prev_Click">上一页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_next" runat="server" OnClick="lbt_next_Click">下一页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_last" runat="server" CssClass="visible-lg" OnClick="lbt_last_Click">尾页</asp:LinkButton></li>
                                <li><a class="current">共<asp:Literal ID="ltr_sum" runat="server"></asp:Literal>页</a></li>
                            </ul>
                        </nav>
                    </div>
                    <input type="text" name="txt_StatusName" class="form-control" id="txt_StatusName" runat="server" placeholder="id" visible="false" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改游戏设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>参数值</label>
                            <input type="text" name="txt_StatusValue" class="form-control" id="txt_StatusValue" runat="server" placeholder="参数值" />
                        </div>
                        <div class="form-group">
                            <label>参数描述</label>
                            <input type="text" name="txt_StatusString" class="form-control" id="txt_StatusString" runat="server" placeholder="参数描述" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblSave" runat="server" OnClick="lblSave_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal1">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel1">新增游戏设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>参数编号</label>
                            <input type="text" name="txt_StatusName" class="form-control" id="txtStatusName" runat="server" placeholder="参数编号" />
                        </div>
                        <div class="form-group">
                            <label>参数值</label>
                            <input type="text" name="txt_StatusValue" class="form-control" id="txtStatusValue" runat="server" placeholder="参数值" />
                        </div>
                        <div class="form-group">
                            <label>参数描述</label>
                            <input type="text" name="txt_StatusString" class="form-control" id="txtStatusString" runat="server" placeholder="参数描述" />
                        </div>
                        <div class="form-group">
                            <label>键值说明</label>
                            <input type="text" name="txt_StatusTip" class="form-control" id="txtStatusTip" runat="server" placeholder="键值说明" />
                        </div>
                        <div class="form-group">
                            <label>键值</label>
                            <input type="text" name="txt_StatusDescription" class="form-control" id="txtStatusDescription" runat="server" placeholder="键值" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lblSave_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <hr />


           <%-- <p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>

    <script src="../lib/bootstrap/js/bootstrap-datepicker.js"></script>
    <script src="../lib/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="../lib/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker({
                language: "zh-CN",
                autoclose: true,//选中之后自动隐藏日期选择框
                clearBtn: true,//清除按钮
                //todayBtn: true,//今日按钮
                format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
            });
        });
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
    </script>
</asp:Content>
