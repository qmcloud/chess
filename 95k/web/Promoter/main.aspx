<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="GameAdminWeb.Promoter.main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="header">

            <h1 class="page-title">工作台</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../Promoter/main.aspx?page=Promoter&type=main">推广管理</a> </li>
                <li class="active">工作台</li>
            </ul>

        </div>
        <div class="table-responsive">
            <table class="table table-bordered text-center page-title" data-show-refresh="true">
                <tbody>
                    <tr>
                        <td>会员人数：<asp:Label ID="lbluser" runat="server" Text=""></asp:Label></td>
                        <td>下级推广员：<asp:Label ID="lblpromoter" runat="server" Text=""></asp:Label></td>
                        <td>直属推广员总余额：<asp:Label ID="lblPBalance" runat="server" Text=""></asp:Label></td>
                        <%--<td>直属推广员盈亏：<asp:Label ID="lblPsurplus" runat="server" Text=""></asp:Label></td>
                        <td>分成利润总和：<asp:Label ID="lblprofit" runat="server" Text=""></asp:Label></td>--%>
                    </tr>
                    <tr>
                        <td>活跃人数：<asp:Label ID="lblactive" runat="server" Text=""></asp:Label>(在线人数：<asp:Label ID="lblOnline" runat="server" Text=""></asp:Label>)</td>
                        <td>我的余额：<asp:Label ID="lblBalance" runat="server" Text=""></asp:Label></td>
                        <td>直属会员总余额：<asp:Label ID="lblUBalance" runat="server" Text=""></asp:Label></td>
                        <%--<td>直属会员盈亏：<asp:Label ID="lblUsurplus" runat="server" Text=""></asp:Label></td>
                        <td></td>--%>
                    </tr>
                </tbody>
            </table>
        </div>
        <h2 class="page-title">个人收益</h2>
        <div class="btn-toolbar list-toolbar">
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-sm">
                        <div class="row">
                            <div class="form-group col-xs-10 col-lg-2">
                                <div class="col-xs-4 col-lg-4">
                                    日期：
                                </div>
                                <div class="col-xs-5">
                                    <input type="text" class="datepicker" placeholder="请选择日期" id="txtRStartDate" runat="server" />
                                </div>
                            </div>
                            <div class="">
                                <div class="col-xs-3 col-lg-1">
                                    <asp:Button ID="btnSelect" runat="server" Text="查询" class="btn btn-info btn-sm" OnClick="btnSelect_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover text-center" data-show-refresh="true">
                <thead>
                    <tr>
                        <th>账号</th>
                        <th>所属会员充值总额</th>
                        <th>占成比例</th>
                        <th>占成金额</th>
                        <th>时间（<asp:Label ID="lblStart" runat="server" Text=""></asp:Label>)-(<asp:Label ID="lblEnd" runat="server" Text=""></asp:Label>）</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rpt_Account" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("email")%></td>
                                <td><%#Eval("OrderAmount")%></td>
                                <td><%#Eval("ticeng")%></td>
                                <td><%#Eval("lr")%></td>
                                <td><%#Eval("ApplyDate")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <%--<div class="row">
            <div class="col-lg-6 col-xs-12">
                <div class="well well-sm">
                    <i class="fa fa-bar-chart-o"></i>
                    <strong>
                        <asp:Label ID="lblYgold" runat="server" Text=""></asp:Label>赢金币前10名</strong>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover text-center" data-show-refresh="true">
                            <thead>
                                <tr>
                                    <th>排名</th>
                                    <th>id</th>
                                    <th>账号</th>
                                    <th>赢取金币 (统计：<asp:Label ID="lblYcount" runat="server" Text="" CssClass="text-success"></asp:Label>)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>12</td>
                                    <td class="text-success">12</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xs-12">
                <div class="well well-sm">
                    <div>
                        <i class="fa fa-bar-chart-o"></i>
                        <strong>
                            <asp:Label ID="lblSgold" runat="server" Text=""></asp:Label>输金币前10名</strong>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover text-center" data-show-refresh="true">
                            <thead>
                                <tr>
                                    <tr>
                                        <th>排名</th>
                                        <th>id</th>
                                        <th>账号</th>
                                        <th>输掉金币 (统计：<asp:Label ID="lblScount" runat="server" Text="" CssClass="text-danger"></asp:Label>)</th>
                                    </tr>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>12</td>
                                    <td class="text-danger">12</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>--%>
        <footer>
            <hr />
           <%-- <p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>
</asp:Content>
