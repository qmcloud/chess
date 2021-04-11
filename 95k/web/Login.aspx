<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GameAdminWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>游戏后台管理系统</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <%--<link href='http://fonts.useso.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css' />--%>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css" />

    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>


    <link href="lib/bootstrap/css/bootstrapValidator.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css" />
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css" />
    <link href="lib/bootstrap/css/skins/all.css" rel="stylesheet" />
</head>
<body class="theme-blue">
    <form id="defaultForm" runat="server">
        <script type="text/javascript">
            $(function () {
                var match = document.cookie.match(new RegExp('color=([^;]+)'));
                if (match) var color = match[1];
                if (color) {
                    $('body').removeClass(function (index, css) {
                        return (css.match(/\btheme-\S+/g) || []).join(' ')
                    })
                    $('body').addClass('theme-' + color);
                }

                $('[data-popover="true"]').popover({ html: true });

            });
        </script>
        <%--<script type="text/javascript" src="jsencrypt.js"></script>--%>
        <style type="text/css">
            #line-chart {
                height: 300px;
                width: 800px;
                margin: 0px auto;
                margin-top: 1em;
            }

            .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
                color: #fff;
            }
        </style>

        <script type="text/javascript">
            $(function () {
                var uls = $('.sidebar-nav > ul > *').clone();
                uls.addClass('visible-xs');
                $('#main-menu').append(uls.clone());
            });
        </script>

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

        <!-- Le fav and touch icons -->
        <link rel="shortcut icon" href="../assets/ico/favicon.ico" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png" />
        <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png" />


        <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
        <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
        <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
        <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
        <!--[if (gt IE 9)|!(IE)]><!-->

        <!--<![endif]-->

        <div class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="" href="mysell/AccountInfo.aspx?page=sell&type=mysell">
                    <img src="../images/logo1.png" class="img-responsive center-block" /></a><%--<span class="fa fa-paper-plane"></span>Aircraft--%>
            </div>

            <div class="navbar-collapse collapse" style="height: 1px;">
            </div>
        </div>



        <div class="dialog">
            <div class="panel panel-default">
                <p class="panel-heading no-collapse">游戏后台登录</p>
                <div class="panel-body">
                    <%--<form>--%>
                    <div class="form-group">
                        <label>账号或用户名</label>
                        <input type="text" class="form-control span12" id="email" runat="server">
                        <%--<asp:TextBox ID="email" runat="server" class="form-control span12"></asp:TextBox>--%>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="password" class="form-controlspan12 form-control" id="password" runat="server">
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="登录" class="btn btn-primary pull-right" OnClick="btnLogin_Click" />
                    <label class="remember-me">
                        <input type="checkbox" id="ckbpassword" runat="server">
                        记住登录状态</label>
                    <div class="clearfix"></div>
                    <%--</form>--%>
                </div>
            </div>
 <%--           <p class="pull-right" style=""><a href="Register.aspx" target="blank" style="font-size: .75em; margin-top: .25em;">注册新账号</a></p>
            <p><a href="SystemManagement/ResetPassword.aspx">忘记密码?</a></p>--%>
        </div>

        

        <script src="lib/bootstrap/js/bootstrap.js"></script>
        <script src="lib/bootstrap/js/icheck.js"></script>
        <script src="lib/bootstrap/js/custom.min.js"></script>
        <script src="lib/bootstrap/js/bootstrapValidator.js"></script>
        <script src="lib/bootstrap/js/zh_CN.js"></script>
        <script type="text/javascript">
            $("[rel=tooltip]").tooltip();
            $(function () {
                $('.demo-cancel-click').click(function () { return false; });
            });
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-red ',
                    increaseArea: '20%'
                });
            });

            $(document).ready(function () {
                $('#defaultForm').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        password: {
                            validators: {
                                notEmpty: {
                                    message: '密码不可为空'
                                }
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: '账号或用户名不可为空'
                                }
                            }
                        }
                    }
                });
            });
        </script>

    </form>
</body>
</html>
