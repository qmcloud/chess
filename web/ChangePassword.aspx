<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="GameAdminWeb.ChangePassword" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>犇犇牛</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css" />

    <script src="lib/jquery-1.11.1.min.js"></script>



    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css" />
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css" />
    <link href="lib/bootstrap/css/bootstrapValidator.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/skins/all.css" rel="stylesheet" />
</head>
<body class="theme-blue">
    <form runat="server">
        <div>
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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="" href="../mysell/AccountInfo.aspx?page=sell&type=mysell">
                        <img src="../images/logo1.png" class="img-responsive center-block" /></a>
                </div>

                <div class="navbar-collapse collapse" style="height: 1px;">
                    <ul id="main-menu" class="nav navbar-nav navbar-right">
                        <li class="dropdown hidden-xs">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user padding-right-small" style="position: relative; top: 3px;"></span>
                                <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                                <i class="fa fa-caret-down"></i>
                            </a>

                            <ul class="dropdown-menu">
                                <li><a href="../SystemManagement/LoginUserInfo.aspx">个人资料</a></li>
                                <li class="divider"></li>
                                <li>
                                    <asp:LinkButton ID="close" runat="server" OnClick="close_Click">退出</asp:LinkButton></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </div>


        <div class="sidebar-nav">
            <ul>
                <li id="Li1" runat="server"><a href="TaurusCheat.aspx" name="SystemManagement" data-target=".dashboard-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa fa-caret-right"></i>牛牛作弊授权</a></li>
                <li><a href="ChangePassword.aspx" data-target=".Promoter-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-unlock-alt"></i>修改密码</a></li>

                <%-- <li><a href="#" data-target=".nav-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-legal"></i>系统设置<i class="fa fa-collapse"></i></a></li>
                <li>
                    <ul class="nav-menu nav nav-list collapse">
                        <li><a href="#"><span class="fa fa-caret-right"></span>系统主题设置</a></li>
                    </ul>
                </li>--%>
            </ul>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="content">
            <div class="header">

                <h1 class="page-title">修改密码</h1>
                <ul class="breadcrumb">
                    <li><a href="main.aspx">首页</a> </li>
                    <li class="active">修改密码</li>
                </ul>
            </div>
            <div class="main-content">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="dialog" id="defaultForm">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <input type="password" class="form-control span12" id="cspassword" runat="server" placeholder="请输入您的原密码" />
                                    </div>
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
            <div class="footer">
                <p class="pull-right">至尊牛霸</p>
                <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
            </div>
        </div>
        <script src="lib/bootstrap/js/bootstrap.js"></script>
        <script src="lib/bootstrap/js/bootstrapValidator.js"></script>
        <script src="lib/bootstrap/js/zh_CN.js"></script>


        <script src="lib/bootstrap/js/icheck.js"></script>
        <script src="lib/bootstrap/js/custom.min.js"></script>
    </form>
</body>
</html>

