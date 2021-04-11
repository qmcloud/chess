<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/NestedMasterPage.master" CodeBehind="withdrawList.aspx.cs" Inherits="GameAdminWeb.Promoter.withdrawList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">取现信息</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">推广管理</a> </li>
                <li class="active">取现信息</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                 <div class="btn-toolbar list-toolbar">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="well well-sm">
                                <div class="row">
                                    <div class="form-group col-xs-12 col-lg-4 text-center">
                                        <div class="col-xs-3 col-lg-2 text-center">
                                            日期：
                                        </div>
                                        <div class="col-xs-4 col-lg-5">
                                            <input type="text" class="datepicker form-control" placeholder="起始日期" id="txtRStartDate" runat="server" />
                                        </div>
                                        <div class="col-xs-4 col-lg-5">
                                            <input type="text" class="datepicker form-control" placeholder="结束日期" id="txtEndDate" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group col-xs-12 col-lg-2 text-center">
                                        <div class="col-xs-4 col-lg-4"><a>推广ID:</a></div>
                                        <div class="col-xs-8">
                                            <input id="txttgid" class="form-control" type="text" runat="server" placeholder="推广ID" />
                                        </div>
                                    </div>                                                                      
                                    <div class="col-xs-2 col-lg-6">
                                        <asp:Button ID="btnSelect" runat="server" Text="查询" class="btn btn-info btn-sm" OnClick="btnSelect_Click" />
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
                                <th></th>
                                <th>状态</th>
                                <th>推广员id</th>
                                <th>推广员账号</th>
                                <th>支付宝账号</th>
                                <th>支付宝名称</th>
                                <th>已取现金额</th>
                                <th>取现时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpt_Account" runat="server">
                                <ItemTemplate>
                                    <tr>
                                       
                                        <td> <asp:LinkButton ID="lblReject" runat="server"  CssClass='<%#Eval("TypeName").ToString()=="已拒接"?"hidden":""%>' OnCommand="lblReject_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('拒接该条打款信息？');" Visible='<%# (Session["username"].ToString() != "admin")?false:true %>'><span style="font-size:20px;" title="拒接打款">×</span>
                                             </asp:LinkButton><asp:LinkButton  ID="lbtClear" runat="server" CssClass='<%#Eval("TypeName").ToString()=="已打款"?"hidden":""%>' OnCommand="lbtClear_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定打款？');" ><i class="fa fa-money" title="打款" ></i></asp:LinkButton></td>
                                        <td class='<%#Eval("TypeName").ToString()=="已打款" ?"text-success":"text-danger" %>''><%#Eval("TypeName")%></td>
                                        <td><%#Eval("UserId")%></td>
                                        <td><%#Eval("email")%></td>
                                         <td>
                                            <%#Eval("phone")%>
                                        </td>
                                        <td>
                                             <%#Eval("user_name")%>
                                        </td>                                       
                                        <td class="text-success"><%#Eval("Money")%></td>
                                        <td>
                                            <%#Eval("ApplyDate")%>
                                        </td>
                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>
                              <tr>
                                <td colspan="8">
                                    <asp:Label ID="lblcount" runat="server" Text="当前查询取现总额："></asp:Label></td>                              
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
            <%--<p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>
</asp:Content>

