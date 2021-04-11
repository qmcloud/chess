<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="OnLineOrder.aspx.cs" Inherits="GameAdminWeb.Promoter.OnLineOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">充值订单信息</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">推广管理</a> </li>
                <li class="active">充值订单信息</li>
            </ul>
        </div>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <div class="btn-toolbar list-toolbar">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="well well-sm">
                                <div class="row">
                                     <div class="col-xs-3 col-lg-1 text-center">
                                            日期：
                                        </div>
                                        <div class="col-xs-3 col-lg-1">
                                            <input type="text" class="datepicker form-control" placeholder="起始日期" id="txtRStartDate" runat="server" />
                                        </div>
                                        <div class="col-xs-3 col-lg-1">
                                            <input type="text" class="datepicker form-control" placeholder="结束日期" id="txtEndDate" runat="server" />
                                        </div>
                                     <div class="form-group col-xs-12 col-lg-2 text-center">
                                        <div class="col-xs-4 col-lg-4"><a>用户ID:</a></div>
                                        <div class="col-xs-8">
                                            <input id="txtuserid" class="form-control" type="text" runat="server" placeholder="用户ID" />
                                        </div>
                                    </div>
                                     <div class="form-group col-xs-12 col-lg-2 text-center">
                                        <div class="col-xs-4 col-lg-4"><a>所属代理:</a></div>
                                        <div class="col-xs-8">
                                            <input id="txtDL" class="form-control" type="text" runat="server" placeholder="所属代理" />
                                        </div>
                                    </div>
                                    <div class="form-group col-xs-10 col-lg-4 text-center">
                                        <input id="ckbnow" type="checkbox" runat="server"  /><small>今日充值</small>
                                        <input id="ckbtmr" type="checkbox"  runat="server" /><small>昨日充值</small>
                                        <div id="tgm" style="display:none" runat="server"><input id="ckbnobd" type="checkbox" runat="server"/><small>未绑定充值</small></div>
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
                                <input type="text" name="txt_Sorting" class="form-control" id="txt_Sorting" runat="server" placeholder="排序" style="display: none;" value="0" />
                                <th>用户id</th>
                                <th>昵称</th>
                                <th>所属代理</th>
                                <th>充值金额</th>
                                <th><a href="javascript:;" onclick='sorting("ApplyDate")'>充值时间</a></th>
                                 <th>状态</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpt_Order" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("UserID")%></td>
                                        <td><%#Eval("NickName")%></td>
                                        <td><%#Eval("email")%></td>
                                        <td><%#Eval("OrderAmount")%></td>
                                        <td><%#Eval("ApplyDate")%></td>                                     
                                        <td class='<%#Eval("OrderStatus").ToString()=="2"?"text-success":"text-danger"%>'><%#Eval("OrderStatusName")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                             <tr>
                                <td colspan="8">
                                    <asp:Label ID="lblcount" runat="server" Text="当前查询充值总额："></asp:Label></td>
                                <%-- <asp:Label ID="Lblcountno" runat="server" Text="当前查询失败充值总额："></asp:Label></td>--%>
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <footer>
            <hr />
          
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>
</asp:Content>
<asp:Content ID="Tail" ContentPlaceHolderID="Tail" runat="Server">
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    increaseArea: '20%'
                });
            });

            $('#ckbcount').on('ifChecked', function (event) {
                $("#count").toggle();
            });
            $('#ckbcount').on('ifUnchecked', function (event) {
                $("#count").toggle();
            });
        });
        //时间的排序事件
        function sorting(type) {
            window.location.href = "OnLineOrder.aspx?page=Promoter&type=OnLineOrder&typeName=" + type + "&Sorting=" + $("#ContentPlaceHolder1_txt_Sorting").val() + "";
        }
    </script>
</asp:Content>

