<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="LoginUserInfo.aspx.cs" Inherits="GameAdminWeb.SystemManagement.LoginUserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">个人信息管理</h1>
            <ul class="breadcrumb">
                <li><a href="../mysell/AccountInfo.aspx?page=mysell&type=AI">首页</a> </li>
                <li class="active">个人信息管理</li>
            </ul>

        </div>
        <div class="container">
            <div class="panel panel-collapse">
                <div class="panel-body">
                    <div class="panel-body">
                        <div class="form-group" style="display:none;">
                            <label>id</label>
                            <input type="email" class="form-control span12" id="id" runat="server" placeholder="id"/>
                        </div>
                        <div class="form-group">
                            <label>账号</label>
                            <input type="text" class="form-control span12" id="username" runat="server" placeholder="账号" />
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlSex" runat="server" class="form-control input-sm">
                                    <asp:ListItem Value="1">男</asp:ListItem>
                                    <asp:ListItem Value="0">女</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control span12" id="email" runat="server" placeholder="姓名" />
                        </div>
                        <div class="form-group">
                            <label>联系电话</label>
                            <input type="text" class="form-control span12" id="phone" runat="server" maxlength="11" placeholder="联系电话" />
                        </div>
                        <div class="form-group">
                            <label>生日</label>
                            <div class="form-group">
                                <input type="text" class="datepicker form-control" placeholder="请选择日期" id="age" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label>金币</label>
                            <input type="text" class="form-control span12" id="score" runat="server" disabled />
                        </div>
                        <div class="form-group">
                            <label>提成</label>
                            <input type="text" class="form-control span12" id="ticeng" runat="server" disabled />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnRegister" runat="server" Text="保存" class="btn btn-primary padding-left" OnClick="lblSave_Click" />
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#defaultForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    <%= email.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: '姓名不可为空'
                            }
                        }
                    },
                    <%= username.UniqueID%>: {
                        validators: {
                            notEmpty: {
                                message: '账号不可为空'
                            }
                        }
                    },
                    <%= phone.UniqueID%>: {
                        validators: {
                            regexp: {
                                regexp: /^1[34578]\d{9}$/,
                                message: '手机号码填写有误'
                            }
                        }
                    }
                }
            });
        });
    </script>
</asp:Content>
