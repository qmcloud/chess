<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="PromoterManagement.aspx.cs" Inherits="GameAdminWeb.Promoter.PromoterManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">推广员管理</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">首页</a> </li>
                <li><a href="../mysell/AccountInfo.aspx?page=sell&type=mysell">推广管理</a> </li>
                <li class="active">推广员管理</li>
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
                                        <div class="col-xs-5 col-lg-5">
                                            <asp:DropDownList ID="ddlAffiliate" runat="server" class="form-control input-sm">
                                                <asp:ListItem Value="Affiliate">所属推广员账号</asp:ListItem>
                                                <asp:ListItem Value="AffiliateId">所属推广员id</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-xs-3">
                                            <input id="txtemail" type="text" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group col-xs-10 col-lg-4 text-center">
                                        <div class="col-xs-6 col-lg-4">
                                            <asp:DropDownList ID="ddlPromoter" runat="server" class="form-control input-sm">
                                                <asp:ListItem Value="email">推广员账号</asp:ListItem>
                                                <asp:ListItem Value="id">推广员id</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-xs-5">
                                            <input id="txtscore" type="text" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group col-xs-10 col-lg-2 text-center">
                                        <input id="ckbstatus" type="checkbox" runat="server" checked /><small>是否可用</small>
                                        <input id="ckbcount" type="checkbox" /><small>显示统计信息</small>
                                    </div>
                                    <div class="col-xs-10 col-lg-2 text-center">
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
                                <input type="text" name="txt_Sorting" class="form-control" id="txt_Sorting" runat="server" placeholder="排序" style="display: none;" value="0" />
                                <th>序号</th>
                                <th>推广员id</th>
                                <th>推广员账号</th>
                                <th>推广员级别</th>
                                <th>充值金币</th>
                                <th>当前余额</th>
                                <th>提成比例</th>
                                <th><a href="javascript:;" onclick='sorting("kqxmoney")'>可取现额度</a></th>
                                <th><a href="javascript:;" onclick='sorting("yqxmoney")'>已取现金额</a></th>
                                <th>直属推广员</th>
                                <th>直属会员</th>
                                <th>所属推广员</th>
                                <th>充值权限</th>
                                <th>注册时间</th>
                                <th>状态</th>
                                <th style="width: 6em;" id="Controls" runat="server"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpt_Account" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("sequ")%></td>
                                        <td><%#Eval("id")%></td>
                                        <td><%#Eval("email")%></td>
                                        <td><%#Eval("PromotionName")%></td>
                                        <td class="text-info"><%#Eval("RechargeScore")%></td>
                                        <td class="text-info"><%#Eval("score")%></td>
                                        <td class="text-info"><%#Eval("ticeng")%></td>
                                        <td class="text-success"><%#OrderAmount(Eval("id").ToString())%></td>
                                        <td class="text-success"><%#TakeNow(Eval("id").ToString())%></td>
                                        <td class="text-info"><%#Eval("parentcount")%></td>
                                        <td class="text-info"><%#Eval("usercount")%></td>
                                        <td><%#Eval("emailname")%></td>
                                        <td class='<%# DataBinder.Eval(Container.DataItem, "Authorityname").ToString() == "有"?"text-success":"text-danger" %>'><%#Eval("Authorityname")%></td>
                                        <td><%#Eval("CreateTime")%></td>
                                        <td class='<%# DataBinder.Eval(Container.DataItem, "statusname").ToString() == "可用"?"text-success":"text-danger" %>'><%#Eval("statusname")%></td>
                                        <td id="Td1" runat="server">
                                            <%--data-toggle="modal" data-target="#myModal"--%>
                                            <asp:LinkButton ID="lbtTakeNow" runat="server" OnCommand="lbtTakeNow_Command" CommandArgument='<%#Eval("id") %>'><i class="fa fa-money" title="取现" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbtClear" runat="server" OnCommand="lbtClear_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定清除已取现的金额？');" Visible="false"><i class="fa fa-trash-o" title="清除取现金额" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbtEdit" runat="server" OnCommand="lbtEdit_Command" CommandArgument='<%#Eval("id") %>'><i class="fa fa-pencil" title="修改" ></i></asp:LinkButton>
                                            <%-- Visible='<%# DataBinder.Eval(Container.DataItem, "sequ").ToString() == "1"?false:true %>'--%>
                                            <asp:LinkButton ID="lbtfreeze" runat="server" OnCommand="lbtfreeze_Command" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定冻结此账号？');"><i class="fa fa-empire" title="冻结" ></i></asp:LinkButton>
                                            <%--  Visible='<%# DataBinder.Eval(Container.DataItem, "sequ").ToString() == "1"?false:true %>'--%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr id="count" style="display: none">
                                <td colspan="7">
                                    <asp:Label ID="lblscoresum" runat="server" Text="当前余额总量：10000"></asp:Label></td>
                                <td colspan="7">
                                    <asp:Label ID="lblusercountsum" runat="server" Text="当前直属会员总量：50"></asp:Label></td>
                            </tr>
                            <tr id="ControlsSet" runat="server" class="text-left">
                                <td colspan="16">
                                    <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lblrefresh" runat="server" OnClick="lblrefresh_Click"><i class="fa fa-refresh" title="刷新" style="font-size:x-large;"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="text" name="txt_id" class="form-control" id="txt_id" runat="server" placeholder="id" visible="false" />
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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">推广员信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>推广员账号</label>
                            <input type="text" name="txt_email" class="form-control" id="txt_email" runat="server" placeholder="推广员账号" />
                        </div>
                        <div class="form-group">
                            <label>账号密码</label>
                            <input type="password" name="txt_password" class="form-control" id="txt_password" runat="server" placeholder="账号密码" />
                        </div>
                        <div class="form-group">
                            <label>真实姓名</label>
                            <input type="text" name="txt_username" class="form-control" id="txt_username" placeholder="真实姓名" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>支付宝账号</label>
                            <input type="text" name="txt_phone" class="form-control" id="txt_phone" placeholder="支付宝账号" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>QQ号码</label>
                            <input type="text" name="txt_qq" class="form-control" id="txt_qq" placeholder="QQ号码" runat="server" />
                        </div>
                        <div class="form-group" id="grade" runat="server">
                            <label>推广员级别(1为总代理，2为一级代理，由此递推):</label>
                            <input type="text" id="lblgrade" runat="server" class="form-control" />
                            <%--<asp:Label ID="lblgrade" runat="server" Text="推广员级别"></asp:Label>--%>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon">占成</span>
                                <input type="text" name="txt_ticeng" class="form-control" id="txt_ticeng" maxlength="3" runat="server" />
                                <span class="input-group-addon">%</span>
                            </div>
                            <div class="form-group text-danger">
                                最高不得超过<asp:Label ID="lblTiCeng" runat="server" Text="100"></asp:Label>%
                            </div>
                        </div>
                        <div class="form-group">
                            <label>充值权限</label>
                            <input id="ckbAuthority" type="checkbox" runat="server" />
                        </div>
                    </div>  
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary " onclick="dj()">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblSave" runat="server" OnClick="lblSave_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="TakeNowModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="TakeNowmodal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="TakeNowModalLabel">取现</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>可取现金额</label>
                            <input type="text" name="txt_kqx" class="form-control" id="txt_kqx" runat="server" placeholder="可取现金额" readonly="readonly" />
                        </div>
                        <div class="form-group">
                            <label>取现金额</label>
                            <input type="text" name="txt_qx" class="form-control" id="txt_qx" runat="server" placeholder="取现金额" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblTakeNowSave" runat="server" OnClick="lblTakeNowSave_Click" data-loading-text="Loading..." Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <hr />
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
            $(function () {
                $(".btn").click(function () {
                    $(this).button('loading').delay(1000).queue(function () {
                    });
                });
            });
            $('#ckbcount').on('ifChecked', function (event) {
                $("#count").toggle();
            });
            $('#ckbcount').on('ifUnchecked', function (event) {
                $("#count").toggle();
            });
        });
        function dj() {
            javascript: __doPostBack('ctl00$ContentPlaceHolder1$lblSave', '');
        }
    </script>
</asp:Content>
<asp:Content ID="Tail" ContentPlaceHolderID="Tail" runat="Server">
    <script type="text/javascript">
        //时间的排序事件
        function sorting(type) {
            window.location.href = "PromoterManagement.aspx?page=GameUser&type=PromoterManagement&typeName=" + type + "&Sorting=" + $("#ContentPlaceHolder1_txt_Sorting").val() + "";
        }
    </script>   
</asp:Content>

