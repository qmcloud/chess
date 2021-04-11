<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="AccountFeedback.aspx.cs" Inherits="GameAdminWeb.SystemManagement.AccountFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">账户管理</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li><a href="../SystemManagement/AccountManagement.aspx?page=SystemManagement&type=AM">系统管理</a> </li>
                <li class="active">反馈信息</li>
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
                                        <th>反馈账户</th>
                                        <th>反馈信息</th>
                                        <th>反馈时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_Feedback" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("UserID") %></td>
                                                <td><%# Eval("FeedbackInfo") %></td>
                                                <td><%# Eval("FeedbackTime") %></td>
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
