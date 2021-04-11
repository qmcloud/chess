<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="quanxian.aspx.cs" Inherits="GameAdminWeb.Promoter.quanxian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp;&nbsp;&nbsp;
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="content">
        <div class="header">

            <h1 class="page-title">玩家设置</h1>
            <ul class="breadcrumb">
                <li><a href="../Promoter/PromoterManagement.aspx?page=Promoter&type=PromoterManagement">首页</a> </li>
                <li><a href="../Promoter/PromoterManagement.aspx?page=Promoter&type=PromoterManagement">推广管理</a> </li>
                <li class="active">玩家设置</li>
            </ul>

        </div>

 <%--       <div class="page-header">
            <h4>
                <small>用户名:<asp:Label ID="lblusername" runat="server" Text=""></asp:Label>
                    我的推荐码:<asp:Label ID="lblrecommend" runat="server" Text=""></asp:Label>
                    余额
                    <asp:Label ID="lbluserBalance" runat="server" Text=""></asp:Label>
                    会员返利:
                  <asp:Label ID="lblRebate" runat="server" Text=""></asp:Label>
                </small>
            </h4>
        </div>--%>


        <div class="main-content">
            <!--nav-pills，nav-tabs，nav-stacked :改变选项卡的样式-->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab">授予权限</a>
                </li>
            <%--    <li><a href="#tab2" data-toggle="tab">出售记录</a>
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
                </li>--%>
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
                            <div class="panel panel-default" id="information" runat="server" style="display:none" >
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
                                                过期时间:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Label ID="lblBalance" runat="server" Text="权限过期时间"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                            <div class="well well-sm" style="background-color: #edf3f4;">
                                               授权天数:
                                            </div>
                                        </div>
                                        <div class="col-xs-2">
                                           <div class="btn-group" data-toggle="buttons">
	                                    <%--     <input id="shouquan" type="text" runat="server" />天--%>
		                                           <input class="well-sm" id="txtsqdate" type="text" placeholder="请输入天数" runat="server" onkeypress="if(((event.keyCode>=48)&&(event.keyCode <=57))||(event.keyCode==46)) {event.returnValue=true;} else{event.returnValue=false;}"  />
                                           </div>	
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4 col-lg-1 text-center">
                                        </div>
                                        <div class="col-xs-2">
                                            <div class="well-sm">
                                                <asp:Button ID="btnRecharge" class="btn btn-primary" runat="server" Text="授权" OnClick="btnRecharge_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
              
              
            </div>
            <div class="footer">
                <%--<p class="pull-right">粤信游公司</p>--%>
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
