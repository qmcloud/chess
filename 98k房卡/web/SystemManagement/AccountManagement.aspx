<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="GameAdminWeb.SystemManagement.AccountManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">账户管理</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../SystemManagement/AccountManagement.aspx?page=SystemManagement&type=AM">系统管理</a> </li>
                <li class="active">账户管理</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="btn-toolbar list-toolbar">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="well well-sm">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-lg-3 text-center">
                                        <div class="col-xs-5 col-lg-4"><a>充值账户[id]:</a></div>
                                        <div class="col-xs-4">
                                            <input id="txtemail" type="text" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group col-xs-10 col-lg-3 text-center">
                                        <div class="col-xs-6 col-lg-4"><a>充值房卡:</a></div>
                                        <div class="col-xs-5">
                                            <input id="txtscore" type="text" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-xs-10 col-lg-2 text-center">
                                        <asp:Button ID="btnRecharge" runat="server" Text="充值" class="btn btn-info btn-sm" OnClick="btnRecharge_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" data-show-refresh="true">
                        <thead>
                            <tr>
                                <th id="Set" runat="server">
                                    <input type="checkbox" id="checkall" title="全选" /></th>
                                <th>id</th>
                                <th>姓名</th>
                                <th>金币</th>
                                <th>性别</th>
                                <th>邮箱</th>
                                <th>联系电话</th>
                                <th>生日</th>
                                <th>所属部门</th>
                                <th>角色</th>
                                <th>是否禁用</th>
                                <th>最后登录时间</th>
                                <th style="width: 4.5em;" id="Controls" runat="server"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpt_Account" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td id="Set" runat="server" style="width: 3em;">
                                            <input type="checkbox" value="<%#Eval("id")%>" name="ckbid" /></td>
                                        <td><%#Eval("id")%></td>
                                        <td><%#Eval("user_name")%></td>
                                        <td><%#Eval("score")%></td>
                                        <td><%#Eval("sex")%></td>
                                        <td><%#Eval("email")%></td>
                                        <td><%#Eval("phone")%></td>
                                        <td><%#Eval("birthday")%></td>
                                        <td><%#Eval("department_value")%></td>
                                        <td><%#Eval("role_value")%></td>
                                        <td><%#Eval("status")%></td>
                                        <td><%#Eval("last_logintime")%></td>
                                        <td id="Controls" runat="server">
                                            <%--data-toggle="modal" data-target="#myModal"--%>
                                            <asp:LinkButton ID="lbtshow" runat="server" OnCommand="lbtshow_Command" CommandArgument='<%#Eval("id") %>'><i class="fa fa-pencil" title="修改" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbtn_delete" runat="server" OnCommand="lbtn_delete_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定删除？');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                                            <asp:LinkButton Visible="false" ID="lbtPromoter" runat="server" OnCommand="lbtPromoter_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定赋予该用户为总代理？');"><i class="fa fa-wrench" title="授权" ></i></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr id="ControlsSet" runat="server">
                                <td colspan="13">
                                    <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_delete" runat="server" OnClick="lbtn_delete_Click" OnClientClick="return confirm('确定删除所有选择项？');"><i class="fa fa-trash-o"  title="删除" style="font-size:x-large;"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lblrefresh" runat="server" OnClick="lblrefresh_Click"><i class="fa fa-refresh" title="刷新" style="font-size:x-large;"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <nav style="text-align: center;">
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
                <input type="text" name="txt_id" class="form-control" id="txt_id" runat="server" placeholder="id" visible="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改账户信息</h4>
                    </div>
                    <div class="modal-body">
                        <%--<div class="form-group" style="display:none;">
                                    <label>id</label>
                                    <input type="text" name="txt_id" class="form-control" id="txt_id" runat="server" placeholder="id"/>
                                </div>--%>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" name="txt_username" class="form-control" id="txt_username" runat="server" placeholder="姓名" />
                        </div>
                        <div class="form-group">
                            <label>金币</label>
                            <input type="text" name="txt_gold" class="form-control" id="txt_gold" runat="server" placeholder="金币" />
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                            <asp:DropDownList ID="ddlSex" runat="server" class="form-control input-sm">
                                <asp:ListItem Value="男">男</asp:ListItem>
                                <asp:ListItem Value="女">女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input type="text" name="txt_email" class="form-control" id="txt_email" placeholder="邮箱" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>联系电话</label>
                            <input type="text" name="txt_phone" class="form-control" id="txt_phone" placeholder="联系电话" runat="server" />
                        </div>
                        <div class="form-group">
                            <label">生日</label>
                            <input type="text" class="datepicker form-control" placeholder="请选择日期" id="age" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>所属部门</label>
                            <asp:DropDownList ID="ddldepartment" runat="server" class="form-control input-sm">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>角色</label>
                            <asp:DropDownList ID="ddlrole" runat="server" class="form-control input-sm">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>是否禁用</label>
                            <input id="ckbDisabled" type="checkbox" runat="server" />
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
        <footer>
            <hr />
            <%--<p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>

    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    increaseArea: '20%'
                });
            });
            $('#checkall').on('ifChecked', function (event) {
                $('[name=ckbid]:checkbox').iCheck('check');
            });
            $('#checkall').on('ifUnchecked', function (event) {
                $('[name=ckbid]:checkbox').iCheck('uncheck');
            });
        });

        <%--$(document).ready(function () {
            $('#defaultForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    <%= txt_email.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不可为空'
                            }
                        }
                    },
                    <%= txt_username.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: '用户名不可为空'
                            }
                        }
                    },
                    <%= txt_phone.UniqueID%>: {
                        validators: {
                            regexp: {
                                regexp: /^1[34578]\d{9}$/,
                                message: '手机号码填写有误'
                            }
                        }
                    }
                }
            });
        });--%>

        
    </script>
</asp:Content>
