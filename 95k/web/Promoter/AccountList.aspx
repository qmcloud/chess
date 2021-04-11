<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/NestedMasterPage.master" CodeBehind="AccountList.aspx.cs" Inherits="GameAdminWeb.Promoter.AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">直属会员信息</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">推广管理</a> </li>
                <li class="active">直属会员信息</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="table-responsive">
                    <table class="table table-hover table-bordered page-header table-striped">
                        <thead>
                            <tr>
                                <th>用户id</th>
                                <th>推荐人id</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>账户</th>
                                <th>昵称</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>金币</th>
                                <th>房卡</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>胜利次数</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>逃跑次数</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>平局次数</th>
                                <th class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''>失败次数</th>
                                <th>最后登录时间</th>
                                <th>注册时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpt_Status" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("UserID")%></td>
                                        <td><%#Eval("SpreaderID")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("Accounts")%></td>
                                        <td><%#Eval("NickName")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("Score")%></td>
                                        <td><%#Eval("InsureScore")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("WinCount")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("LostCount")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("DrawCount")%></td>
                                        <td class='<%=Session["username"].ToString() == "admin" ? "" : "hidden" %>''><%#Eval("FleeCount")%></td>
                                        <td><%#Eval("LastLogonDate")%></td>
                                        <td><%#Eval("RegisterDate")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <footer>
            <hr />
            <%--<p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>
</asp:Content>

