<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="GameAdminWeb.mysell.AccountInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="content">
        <div class="header">

            <h1 class="page-title">账户信息</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">我的账户</a> </li>
                <li class="active">账户信息</li>
            </ul>

        </div>

        <div class="page-header">
            <h4>
                <small>用户名:<asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
                    我的推荐码:<asp:Label ID="lblrecommend" runat="server" Text=""></asp:Label>
                    余额
                    <asp:Label ID="lbluserBalance" runat="server" Text=""></asp:Label>
                    会员返利:
                  <asp:Label ID="lblRebate" runat="server" Text=""></asp:Label>
                </small>
            </h4>
        </div>


        <div class="main-content">
            <!--nav-pills，nav-tabs，nav-stacked :改变选项卡的样式-->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab">出售</a>
                </li>
                <li><a href="#tab2" data-toggle="tab">出售记录</a>
                </li>
                <li><a href="#tab3" data-toggle="tab">购买记录</a>
                </li>
                <li><a href="#tab4" data-toggle="tab">我的推荐</a>
                </li>
                <li><a href="#tab5" data-toggle="tab">转账</a>
                </li>
                <li><a href="#tab6" data-toggle="tab">转账记录</a>
                </li>
                <li><a href="#tab7" data-toggle="tab">修改密码</a>
                </li>
            </ul>
            <!-- 选项卡相对应的内容 -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <div class="page-header">
                                <div class="row">
                                    <div class="col-xs-12 col-lg-12">
                                        <div class="well well-sm">
                                            <a>输入玩家ID:</a>
                                            <input id="txtuserid" type="text" runat="server" />
                                            <asp:Button ID="btnsearch" runat="server" Text="搜索玩家" class="btn btn-info btn-sm" OnClick="btnsearch_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default" id="information" runat="server" style="display: none;">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                玩家ID:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lblid" runat="server" Text="id"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                玩家昵称:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lblname" runat="server" Text="昵称"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                玩家余额:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lblBalance" runat="server" Text="余额"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                充值房卡:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <input class="well-sm" id="txtRoomCard" type="text" placeholder="请填写房卡" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Button ID="btnRecharge" class="btn btn-primary" runat="server" Text="充值" OnClick="btnRecharge_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="btn-toolbar list-toolbar page-header">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="well well-sm">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">起始时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtRStartDate" runat="server" />
                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">结束时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtREndDate" runat="server" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnRSearch" runat="server" Text="检索" class="btn btn-info btn-sm" OnClick="btnRSearch_Click" />
                                                <input id="ckbRcount" type="checkbox" runat="server" /><small>显示统计信息</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered table-striped" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>充值账户ID</th>
                                            <th>账户名称</th>
                                            <th>被充值ID</th>
                                            <th>被充值账户</th>
                                            <th>房卡</th>
                                            <th>充值时间</th>
                                            <th>功能</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_rechareges" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("a_id") %></td>
                                                    <td><%# Eval("a_name") %></td>
                                                    <td><%# Eval("b_id") %></td>
                                                    <td><%# Eval("b_name") %></td>
                                                    <td><%# Eval("score") %></td>
                                                    <td><%# Eval("createTime") %></td>
                                                    <td><%# Eval("func") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr id="Rcount" visible="false" runat="server">
                                            <td colspan="4">
                                                <asp:Label ID="lblRusersum" runat="server" Text="当前出售用户数：50人"></asp:Label></td>
                                            <td colspan="3">
                                                <asp:Label ID="lblRscoresum" runat="server" Text="当前出售房卡总额：10000"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <nav style="text-align: center">
                                <ul class="pagination">
                                    <li><a class="current">第<asp:Literal ID="ltr_Rcurrent" runat="server"></asp:Literal>页</a></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Rhome" runat="server" OnClick="lbt_Rhome_Click" CssClass="visible-lg">首页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Rprev" runat="server" OnClick="lbt_Rprev_Click">上一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Rnext" runat="server" OnClick="lbt_Rnext_Click">下一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Rlast" runat="server" OnClick="lbt_Rlast_Click" CssClass="visible-lg">尾页</asp:LinkButton></li>
                                    <li><a class="current" >共<asp:Literal ID="ltr_Rsum" runat="server"></asp:Literal>页</a></li>
                                    <li><a class="current" >共<asp:Literal ID="ltr_Rcount" runat="server"></asp:Literal>条</a></li>
                                </ul>
                            </nav>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab3">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="btn-toolbar list-toolbar page-header">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="well well-sm">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">起始时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtGStartDate" runat="server" />
                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">结束时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtGEndDate" runat="server" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnGSearch" runat="server" Text="检索" class="btn btn-info btn-sm" OnClick="btnGSearch_Click" />
                                                <input id="ckbGcount" type="checkbox" runat="server"/><small>显示统计信息</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered table-striped" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>充值账户ID</th>
                                            <th>账户名称</th>
                                            <th>被充值ID</th>
                                            <th>被充值账户</th>
                                            <th>房卡</th>
                                            <th>充值时间</th>
                                            <th>功能</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_Gm" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("a_id") %></td>
                                                    <td><%# Eval("a_name") %></td>
                                                    <td><%# Eval("b_id") %></td>
                                                    <td><%# Eval("b_name") %></td>
                                                    <td><%# Eval("score") %></td>
                                                    <td><%# Eval("createTime") %></td>
                                                    <td><%# Eval("func") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr id="Gcount" runat="server" visible="false">
                                            <td colspan="4">
                                                <asp:Label ID="lblGusersum" runat="server" Text="当前出售用户数：50人"></asp:Label></td>
                                            <td colspan="3">
                                                <asp:Label ID="lblGscoresum" runat="server" Text="当前出售房卡总额：10000"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <nav style="text-align: center">
                                <ul class="pagination">
                                    <li><a class="current">第<asp:Literal ID="ltr_Gcurrent" runat="server"></asp:Literal>页</a></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Ghome" runat="server" OnClick="lbt_Ghome_Click" CssClass="visible-lg">首页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Gprev" runat="server" OnClick="lbt_Gprev_Click">上一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Gnext" runat="server" OnClick="lbt_Gnext_Click">下一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Glast" runat="server" OnClick="lbt_Glast_Click" CssClass="visible-lg">尾页</asp:LinkButton></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Gsum" runat="server"></asp:Literal>页</a></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Gcount" runat="server"></asp:Literal>条</a></li>
                                </ul>
                            </nav>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab4">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered page-header table-striped">
                                    <thead>
                                        <tr>
                                            <th>账户ID</th>
                                            <th>账户</th>
                                            <th>账户昵称</th>
                                            <th>房卡</th>
                                            <th>联系方式</th>
                                            <th>最后登录时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_Tj" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("id") %></td>
                                                    <td><%# Eval("email") %></td>
                                                    <td><%# Eval("user_name") %></td>
                                                    <td><%# Eval("score") %></td>
                                                    <td><%# Eval("phone") %></td>
                                                    <td><%# Eval("last_logintime") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <nav style="text-align: center">
                                <ul class="pagination">
                                    <li><a class="current">第<asp:Literal ID="ltr_Tcurrent" runat="server"></asp:Literal>页</a></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Thome" runat="server" OnClick="lbt_Thome_Click" CssClass="visible-lg">首页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Tprev" runat="server" OnClick="lbt_Tprev_Click">上一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Tnext" runat="server" OnClick="lbt_Tnext_Click">下一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Tlast" runat="server" OnClick="lbt_Tlast_Click" CssClass="visible-lg">尾页</asp:LinkButton></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Tsum" runat="server"></asp:Literal>页</a></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Tcount" runat="server"></asp:Literal>条</a></li>
                                </ul>
                            </nav>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab5">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <div class="page-header">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="well well-sm">
                                            <a>转账账户【登录账户】:</a>
                                            <input id="txtAdmin" type="text" runat="server" />
                                            <asp:Button ID="btn_Search" runat="server" Text="搜索账户" class="btn btn-info btn-sm" OnClick="btn_Search_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default" id="divadmin" runat="server" style="display: none;">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                账户ID:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lbladminid" runat="server" Text="id"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                用户姓名:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lbladminuser" runat="server" Text="昵称"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                剩余房卡:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lblSyparent" runat="server" Text="余额"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                                转账房卡:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <input class="well-sm" id="txtparent" type="text" placeholder="请填写房卡" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Button ID="btnTransfer" class="btn btn-primary" runat="server" Text="转账" OnClick="btnTransfer_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab6">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <div class="btn-toolbar list-toolbar page-header">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="well well-sm">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">起始时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtZStartDate" runat="server" />
                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon">结束时间(充值):</span>
                                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="txtZEndDate" runat="server" />
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnZSearch" runat="server" Text="检索" class="btn btn-info btn-sm" OnClick="btnZSearch_Click" />
                                                <input id="ckbZcount" type="checkbox" runat="server" /><small>显示统计信息</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered table-striped" style="text-align: center;">
                                    <thead>
                                        <tr>
                                            <th>充值账户ID</th>
                                            <th>账户名称</th>
                                            <th>被充值ID</th>
                                            <th>被充值账户</th>
                                            <th>房卡</th>
                                            <th>充值时间</th>
                                            <th>功能</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_Zz" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("a_id") %></td>
                                                    <td><%# Eval("a_name") %></td>
                                                    <td><%# Eval("b_id") %></td>
                                                    <td><%# Eval("b_name") %></td>
                                                    <td><%# Eval("score") %></td>
                                                    <td><%# Eval("createTime") %></td>
                                                    <td><%# Eval("func") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr id="Zcount" runat="server" visible="false">
                                            <td colspan="4">
                                                <asp:Label ID="lblZusersum" runat="server" Text="当前出售用户数：50人"></asp:Label></td>
                                            <td colspan="3">
                                                <asp:Label ID="lblZscoresum" runat="server" Text="当前出售房卡总额：10000"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <nav style="text-align: center">
                                <ul class="pagination">
                                    <li><a class="current">第<asp:Literal ID="ltr_Zcurrent" runat="server"></asp:Literal>页</a></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Zhome" runat="server" OnClick="lbt_Zhome_Click" CssClass="visible-lg">首页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Zprev" runat="server" OnClick="lbt_Zprev_Click">上一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Znext" runat="server" OnClick="lbt_Znext_Click">下一页</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbt_Zlast" runat="server" OnClick="lbt_Zlast_Click" CssClass="visible-lg">尾页</asp:LinkButton></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Zsum" runat="server"></asp:Literal>页</a></li>
                                    <li><a class="current">共<asp:Literal ID="ltr_Zcount" runat="server"></asp:Literal>条</a></li>
                                </ul>
                            </nav>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="tab-pane" id="tab7">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div class="dialog" id="defaultForm">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <input type="password" class="form-control span12" id="password" runat="server" placeholder="请输入您的新密码" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control span12" id="confirmPassword" runat="server" placeholder="请再次输入您的密码" />
                                        </div>
                                    </div>
                                    <div class="form-group text-center">
                                        <asp:Button class="btn btn-primary btn-sm" ID="searchBtn" runat="server" Text="确认修改" OnClick="searchBtn_Click" />
                                        <button class="btn btn-sm" id="resetBtn">重置</button>
                                    </div>
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="footer">
               <%-- <p class="pull-right">粤信游公司</p>--%>
                <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
            </div>
        </div>
    </div>
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    increaseArea: '20%'
                });

                $('#ContentPlaceHolder1_ckbRcount').on('ifChecked', function (event) {
                    $("#ContentPlaceHolder1_Rcount").toggle();
                });
                $('#ContentPlaceHolder1_ckbRcount').on('ifUnchecked', function (event) {
                    $("#ContentPlaceHolder1_Rcount").toggle();
                });

                $('#ContentPlaceHolder1_ckbGcount').on('ifChecked', function (event) {
                    $("#ContentPlaceHolder1_Gcount").toggle();
                });
                $('#ContentPlaceHolder1_ckbGcount').on('ifUnchecked', function (event) {
                    $("#ContentPlaceHolder1_Gcount").toggle();
                });

                $('#ContentPlaceHolder1_ckbZcount').on('ifChecked', function (event) {
                    $("#ContentPlaceHolder1_Zcount").toggle();
                });
                $('#ContentPlaceHolder1_ckbZcount').on('ifUnchecked', function (event) {
                    $("#ContentPlaceHolder1_Zcount").toggle();
                });
            });
        });
    </script>
</asp:Content>
