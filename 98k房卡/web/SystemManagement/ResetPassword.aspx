﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="GameAdminWeb.SystemManagement.ResetPassword" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <title>游戏后台管理系统</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../lib/font-awesome/css/font-awesome.css">

    <script src="../lib/jquery-1.11.1.min.js" type="text/javascript"></script>



    <link rel="stylesheet" type="text/css" href="../stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="../stylesheets/premium.css">
    <link href="../lib/bootstrap/css/bootstrapValidator.css" rel="stylesheet" />
</head>
<body class="theme-blue">
    <form id="defaultForm" runat="server">
        <!-- Demo page code -->

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
        <link rel="shortcut icon" href="../assets/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">


        <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
        <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
        <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
        <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
        <!--[if (gt IE 9)|!(IE)]><!-->

        <!--<![endif]-->

        <div class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="" href="../mysell/AccountInfo.aspx?page=sell&type=mysell">
                    <img src="../images/logo1.png" class="img-responsive center-block" /></a>
            </div>

            <div class="navbar-collapse collapse" style="height: 1px;">
            </div>
        </div>



        <div class="dialog">
            <div class="panel panel-default">
                <p class="panel-heading no-collapse">重置登录密码</p>
                <div class="panel-body">
                        <div class="form-group">
                            <label>邮箱</label>
                            <input type="email" id="txtemail" runat="server" class="form-controlspan12 form-control">
                        </div>
                        <div class="form-group">
                            <label>用户名</label>
                            <input type="text" id="txtusername" runat="server" class="form-controlspan12 form-control">
                        </div>
                        <div class="form-group">
                            <label>联系电话</label>
                            <input type="text" id="txtphone" runat="server" class="form-controlspan12 form-control">
                        </div>
                        <asp:Button ID="btnReset" runat="server" Text="重置密码" class="btn btn-primary pull-right" OnClick="btnReset_Click" />
                        <div class="clearfix"></div>
                </div>
            </div>
            <p>已知密码，返回<a href="../Login.aspx" style="font-size: .75em; margin-top: .25em;">登录</a></p>
        </div>



        <script src="../lib/bootstrap/js/bootstrap.js"></script>
        <script src="../lib/bootstrap/js/bootstrapValidator.js"></script>
        <script src="../lib/bootstrap/js/zh_CN.js"></script>
        <script type="text/javascript">
            $("[rel=tooltip]").tooltip();
            $(function () {
                $('.demo-cancel-click').click(function () { return false; });
            });

            $(document).ready(function () {
                $('#defaultForm').bootstrapValidator({
                    message: 'This value is not valid',
                    submitHandler: function (valiadtor, loginForm, submitButton) {
                        rememberMe($("input[name='rememberMe']").is(":checked"));
                        valiadtor.defaultSubmit();
                    },

                    fields: {
                        txtemail: {
                            validators: {
                                notEmpty: {
                                    message: '邮箱不可为空'
                                }
                            }
                        },
                        txtusername: {
                            validators: {
                                notEmpty: {
                                    message: '用户名不可为空'
                                }
                            }
                        },
                        txtphone: {
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
    </form>

</body>
</html>
