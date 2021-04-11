<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Gamerecord.aspx.cs" Inherits="GameAdminWeb.GameUser.Gamerecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">战绩记录</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../GameUser/UserManagement.aspx?page=GameUser&type=UM">游戏用户</a> </li>
                <li class="active">战绩记录</li>
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
                                            <div class="form-group col-xs-12 col-lg-3 text-center">
                                                <div class="col-xs-5 col-lg-3"><a>用户ID:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txt_a_name" type="text" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group col-xs-12 col-lg-3 text-center">
                                                <div class="col-xs-5 col-lg-3"><a>用户昵称:</a></div>
                                                <div class="col-xs-4">
                                                    <input id="txt_b_id" type="text" runat="server" />
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
                                        <th>用户ID</th>
                                        <th>用户昵称</th>
                                        <th>总分</th>
                                      <th>战绩记录时间</th>
                                     <th>俱乐部ID</th>
                                         <%--    <th>充值时间</th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_rechareges" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("UserID") %></td>
                                                <td><%# Eval("NickName") %></td>
                                                <td><%#Regex.Unescape(Eval("UserDate").ToString().Replace("X","\\u"))%></td>
                                              <%--  <td><%#zongfen(Eval("RecordID").ToString())%></td>--%>
                                               <td><%# Eval("InsertTime") %></td>
                                               <td><%# Eval("CreateClub") %></td>
                                             <%--   <td><%# Eval("createTime") %></td>--%>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
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
                    <%--<input type="text" name="txt_UserID" class="form-control" id="txt_UserID" runat="server" placeholder="id" visible="false" />--%>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
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
