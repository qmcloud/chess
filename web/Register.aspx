<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GameAdminWeb.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>犇犇牛</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <%--<link href='http://fonts.useso.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>--%>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    <link href="lib/bootstrap/css/skins/all.css" rel="stylesheet" />
    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>



    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
    <link href="lib/bootstrap/css/bootstrap-datepicker3.css" rel="stylesheet" />
    <link href="lib/bootstrap/css/bootstrapValidator.css" rel="stylesheet" />
</head>
<body class="theme-blue">

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
            <a class="" href="mysell/AccountInfo.aspx?page=sell&type=mysell"><img src="images/logo1.png" class="img-responsive center-block" /></a>
        </div>

        <div class="navbar-collapse collapse" style="height: 1px;">
        </div>
    </div>
    </div>
    


        <div class="dialog">
            <div class="panel panel-default">
                <p class="panel-heading no-collapse">新账号注册</p>
                <div class="panel-body">
                    <form id="defaultForm" runat="server">
                        <div class="form-group">
                            <label>账号</label>
                            <input type="text" class="form-control span12" id="username" runat="server">
                        </div>
                        <%--<div class="form-group">
                            <label>性别</label>
                            <div class="form-group">
                            <label>
                                <input type="radio" name="optionsRadios" id="male" runat="server"
                                    value="option1" checked>
                                男
                            </label>
                            <label class="pull-right">
                                <input type="radio" name="optionsRadios" id="Female" runat="server"
                                    value="option2">
                                女
                            </label>
                                </div>
                        </div>--%>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control span12" id="email" runat="server">
                        </div>
                        <%--<div class="form-group">
                            <label>联系电话</label>
                            <input type="text" class="form-control span12" id="phone" runat="server" maxlength="11">
                        </div>
                        <div class="form-group">
                            <label>生日</label>
                            <div class="form-group">
                             <input type="text" class="datepicker" placeholder="请选择日期" id="age" runat="server" />
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control span12" id="password" runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>确认密码</label>
                            <input type="password" class="form-control span12" id="confirmPassword" runat="server"/>
                        </div>
                        <div class="form-group">
                            <label>推荐码</label>
                            <input type="text" class="form-control span12" id="RecommendationCode" runat="server"/>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnRegister" runat="server" Text="注册" class="btn btn-primary pull-right" OnClick="btnRegister_Click"  />
                            <label class="remember-me">
                                <input type="checkbox" id="ckUserAgreement" name="ckUserAgreement" runat="server" checked>
                                我已经阅读并接受 <a href="#">用户协议</a></label>
                        </div>
                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
            <p>已有账号，返回<a href="Login.aspx" style="font-size: .75em; margin-top: .25em;">登录</a></p>
        </div>



    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script src="lib/bootstrap/js/bootstrap-datepicker.js"></script>
    <script src="lib/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="lib/bootstrap/js/bootstrapValidator.js"></script>
    <script src="lib/bootstrap/js/zh_CN.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function () {
            $('.demo-cancel-click').click(function () { return false; });
        });
    </script>
    <script type="text/javascript">
    $(function () {
        $(".datepicker").datepicker({
            language: "zh-CN",
            autoclose: true,//选中之后自动隐藏日期选择框
            clearBtn: true,//清除按钮
            //todayBtn: true,//今日按钮
            format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
        });
    });

    $(document).ready(function() {
        $('#defaultForm').bootstrapValidator({
            message: 'This value is not valid',
            submitHandler: function (valiadtor, loginForm, submitButton) {
                rememberMe($("input[name='rememberMe']").is(":checked"));
                valiadtor.defaultSubmit();
            },

            fields: {
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不可为空'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不可为空'
                        },
                        identical: {
                            field: 'password',
                            message: '两次输入密码不一致'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '账号不可为空'
                        }
                    }
                },
                username: {
                    validators: {
                        notEmpty: {
                            message: '用户名不可为空'
                        }
                    }
                }
            }
        });
    });
</script>
    <script src="lib/bootstrap/js/icheck.js"></script>
        <script src="lib/bootstrap/js/custom.min.js"></script>
        <script type="text/javascript">
            $("[rel=tooltip]").tooltip();
            $(function () {
                $('.demo-cancel-click').click(function () { return false; });
            });
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_flat-red ',
                    radioClass: 'iradio_minimal-blue',
                    increaseArea: '20%'
                });

                $('#ckUserAgreement').on('ifChecked', function (event) {
                    $("#btnRegister").removeAttr("disabled");
                });
                $('#ckUserAgreement').on('ifUnchecked', function (event) {
                    $("#btnRegister").attr("disabled", true);
                });
            });
        </script>
</body>
</html>
