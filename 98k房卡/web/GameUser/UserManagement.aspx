<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="GameAdminWeb.GameUser.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">游戏设置</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../GameUser/UserManagement.aspx?page=GameUser&type=UM">游戏用户</a> </li>
                <li class="active">用户管理</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-content">
                    <div class="main-content">
                        <div class="btn-toolbar list-toolbar">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="well well-sm">
                                        <div class="row">
                                            <div class="form-group col-xs-12 col-lg-2 text-center">
                                                <div class="col-xs-5 col-lg-4"><a>账户:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txtAccounts" type="text" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-lg-2 text-center">
                                                <div class="col-xs-5 col-lg-4"><a>账户id:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txtUserID" type="text" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-lg-2 text-center">
                                                <div class="col-xs-5 col-lg-4"><a>昵称:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txtNickName" type="text" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-lg-3 text-center">
                                                <div class="col-xs-5 col-lg-4"><a>推荐人账户:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txtSpreaderID" type="text" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-xs-10 col-lg-2 text-center">
                                                <asp:Button ID="btnSearch" runat="server" Text="检索" class="btn btn-info btn-sm" OnClick="btnSearch_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered page-header table-striped">
                                <thead>
                                    <tr>
                                        <input type="text" name="txt_Sorting" class="form-control" id="txt_Sorting" runat="server" placeholder="排序" style="display: none;" value="0" />
                                        <th>用户id</th>
                                        <th>推荐人id</th>
                                        <th>账户</th>
                                        <th>昵称</th>
                                        <th>密码</th>
                                        <%--<th>权限</th>--%>
                                        <th><a href="javascript:;" onclick='sorting("Score")'>金币</a></th>
                                        <th><a href="javascript:;" onclick='sorting("InsureScore")'>房卡</a></th>
                                        <th>胜利次数</th>
                                        <th>失败次数</th>
                                        <th>逃跑次数</th>
                                        <th>平局次数</th>
                                        <th><a href="javascript:;" onclick='sorting("LastLogonDate")'>最后登录时间</a></th>
                                        <th><a href="javascript:;" onclick='sorting("RegisterDate")'>注册时间</a></th>
                                        <th style="width: 4.5em;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_Status" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("UserID")%></td>
                                                <td><%#Eval("SpreaderID")%></td>
                                                <td><%#Eval("Accounts")%></td>
                                                <td><%#Eval("NickName")%></td>
                                                <td><%#Eval("LogonPass")%></td>
                                               <%-- <td><%#Eval("UserRight")%></td>--%>
                                                <td><%#Eval("Score")%></td>
                                                <td><%#Eval("InsureScore")%></td>
                                                <td><%#Eval("WinCount")%></td>
                                                <td><%#Eval("LostCount")%></td>
                                                <td><%#Eval("DrawCount")%></td>
                                                <td><%#Eval("FleeCount")%></td>
                                                <td><%#Eval("LastLogonDate")%></td>
                                                <td><%#Eval("RegisterDate")%></td>
                                                <td>
                                                    <%--data-toggle="modal" data-target="#myModal"--%>
                                                    <asp:LinkButton ID="lbtshow" runat="server" OnCommand="lbtshow_Command" CommandArgument='<%#Eval("UserID") %>'><i class="fa fa-pencil" ></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <%--<tr>
                                    <td colspan="12">
                                        <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton></td>
                                </tr>--%>
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
                    <input type="text" name="txt_UserID" class="form-control" id="txt_UserID" runat="server" placeholder="id" visible="false" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>账户</label>
                            <input type="text" name="txt_Accounts" class="form-control" id="txt_Accounts" runat="server" placeholder="账户" />
                        </div>
                        <div class="form-group">
                            <label>昵称</label>
                            <input type="text" name="txt_NickName" class="form-control" id="txt_NickName" runat="server" placeholder="昵称" />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="text" name="txt_LogonPass" class="form-control" id="txt_LogonPass" runat="server" placeholder="密码" />
                        </div>
                        <div class="form-group" style="display:none">
                            <label>权限</label>
                            <input type="text" name="txt_UserRight" class="form-control" id="txt_UserRight" runat="server" placeholder="权限" />
                        </div>
                        <div class="form-group">
                            <label>金币</label>
                            <input type="text" name="txt_Score" class="form-control" id="txt_Score" runat="server" placeholder="金币" />
                        </div>
                        <div class="form-group">
                            <label>房卡</label>
                            <input type="text" name="txt_InsureScore" class="form-control" id="txt_InsureScore" runat="server" placeholder="房卡" />
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
    </script>
</asp:Content>
<asp:Content ID="Tail" ContentPlaceHolderID="Tail" runat="Server">
    <script type="text/javascript">
        //时间的排序事件
        function sorting(type) {
            window.location.href = "UserManagement.aspx?page=GameUser&type=gameuser&typeName=" + type + "&Sorting=" + $("#ContentPlaceHolder1_txt_Sorting").val() + "";
        }
    </script>   
</asp:Content>