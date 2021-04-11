<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCheat.aspx.cs" Inherits="GameAdminWeb.UserCheat" %>

<!DOCTYPE html>

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
    <form id="defaultForm" runat="server">
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
                <li id="systemmanagement" runat="server"><a href="UserCheat.aspx" name="SystemManagement" data-target=".dashboard-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa fa-caret-right"></i>十三水作弊授权</a></li>
                <li id="Li1" runat="server"><a href="TaurusCheat.aspx" name="SystemManagement" data-target=".dashboard-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa fa-caret-right"></i>牛牛作弊授权</a></li>

                <%-- <li><a href="#" data-target=".nav-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-legal"></i>系统设置<i class="fa fa-collapse"></i></a></li>
                <li>
                    <ul class="nav-menu nav nav-list collapse">
                        <li><a href="#"><span class="fa fa-caret-right"></span>系统主题设置</a></li>
                    </ul>
                </li>--%>
            </ul>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="content">
                    <div class="header">

                        <h1 class="page-title">游戏设置</h1>
                        <ul class="breadcrumb">
                            <li><a href="UserCheat.aspx">首页</a> </li>
                            <li class="active">游戏设置</li>
                        </ul>

                    </div>
                    <div class="main-content">
                        <div class="main-content">
                            <div class="btn-toolbar list-toolbar">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="well well-sm">
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-lg-2 text-center">
                                                    <div class="col-xs-5 col-lg-4"><a>账户id:</a></div>
                                                    <div class="col-xs-7 col-lg-8">
                                                        <input class="form-control" id="txtUserID" type="text" runat="server" />
                                                        <input type="text" value="" id="txtckts" style="display: none;" runat="server" />
                                                        <input type="text" value="" id="txtck" style="display: none;" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-xs-10 col-lg-2 text-center">
                                                    <asp:Button ID="btnSearch" runat="server" Text="授权" class="btn btn-info btn-sm" OnClick="btnSearch_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered page-header table-striped">
                                    <thead>
                                        <tr>
                                            <th>用户id</th>
                                            <%--<th>是否开启透视功能</th>--%>
                                            <th>拥有牌组</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_Cheat" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%#Eval("UserID")%></td>
                                                    <%--<td><%#Eval("Toushi")%></td>--%>
                                                    <td><%#Eval("CardTypes")%></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>



                    <footer>
                        <hr />


                        <p class="pull-right">犇犇牛</p>
                        <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
                    </footer>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="permissionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">授权作弊</h4>
                    </div>
                    <%--<div class="row">
                        <div class="col-lg-12">
                            <div class="modal-body col-lg-6">
                                <h2>作弊功能</h2>--%>
                    <asp:Label ID="lblmenucode" runat="server" Text="" Visible="false"></asp:Label>
                    <div class="tree well " id="MenuM" runat="server">
                        <div class="form-group">
                            <h3><strong>当前选择牌数量:<span id="count">0</span>(必须选择13张牌)</strong></h3>
                        </div>
                        <div class="form-group">
                            <strong>A：</strong>
                            <input id="ck01" type="checkbox" name="CardTypes" value="0x01" /><strong>方块</strong>
                            <input id="ck11" type="checkbox" name="CardTypes" value="0x11" /><strong>梅花</strong>
                            <input id="ck21" type="checkbox" name="CardTypes" value="0x21" /><strong>红桃</strong>
                            <input id="ck31" type="checkbox" name="CardTypes" value="0x31" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>2：</strong>
                            <input id="ck02" type="checkbox" name="CardTypes" value="0x02" /><strong>方块</strong>
                            <input id="ck12" type="checkbox" name="CardTypes" value="0x12" /><strong>梅花</strong>
                            <input id="ck22" type="checkbox" name="CardTypes" value="0x22" /><strong>红桃</strong>
                            <input id="ck32" type="checkbox" name="CardTypes" value="0x32" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>3：</strong>
                            <input id="ck03" type="checkbox" name="CardTypes" value="0x03" /><strong>方块</strong>
                            <input id="ck13" type="checkbox" name="CardTypes" value="0x13" /><strong>梅花</strong>
                            <input id="ck23" type="checkbox" name="CardTypes" value="0x23" /><strong>红桃</strong>
                            <input id="ck33" type="checkbox" name="CardTypes" value="0x33" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>4：</strong>
                            <input id="ck04" type="checkbox" name="CardTypes" value="0x04" /><strong>方块</strong>
                            <input id="ck14" type="checkbox" name="CardTypes" value="0x14" /><strong>梅花</strong>
                            <input id="ck24" type="checkbox" name="CardTypes" value="0x24" /><strong>红桃</strong>
                            <input id="ck34" type="checkbox" name="CardTypes" value="0x34" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>5：</strong>
                            <input id="ck05" type="checkbox" name="CardTypes" value="0x05" /><strong>方块</strong>
                            <input id="ck15" type="checkbox" name="CardTypes" value="0x15" /><strong>梅花</strong>
                            <input id="ck25" type="checkbox" name="CardTypes" value="0x25" /><strong>红桃</strong>
                            <input id="ck35" type="checkbox" name="CardTypes" value="0x35" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>6：</strong>
                            <input id="ck06" type="checkbox" name="CardTypes" value="0x06" /><strong>方块</strong>
                            <input id="ck16" type="checkbox" name="CardTypes" value="0x16" /><strong>梅花</strong>
                            <input id="ck26" type="checkbox" name="CardTypes" value="0x26" /><strong>红桃</strong>
                            <input id="ck36" type="checkbox" name="CardTypes" value="0x36" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>7：</strong>
                            <input id="ck07" type="checkbox" name="CardTypes" value="0x07" /><strong>方块</strong>
                            <input id="ck17" type="checkbox" name="CardTypes" value="0x17" /><strong>梅花</strong>
                            <input id="ck27" type="checkbox" name="CardTypes" value="0x27" /><strong>红桃</strong>
                            <input id="ck37" type="checkbox" name="CardTypes" value="0x37" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>8：</strong>
                            <input id="ck08" type="checkbox" name="CardTypes" value="0x08" /><strong>方块</strong>
                            <input id="ck18" type="checkbox" name="CardTypes" value="0x18" /><strong>梅花</strong>
                            <input id="ck28" type="checkbox" name="CardTypes" value="0x28" /><strong>红桃</strong>
                            <input id="ck38" type="checkbox" name="CardTypes" value="0x38" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>9：</strong>
                            <input id="ck09" type="checkbox" name="CardTypes" value="0x09" /><strong>方块</strong>
                            <input id="ck19" type="checkbox" name="CardTypes" value="0x19" /><strong>梅花</strong>
                            <input id="ck29" type="checkbox" name="CardTypes" value="0x29" /><strong>红桃</strong>
                            <input id="ck39" type="checkbox" name="CardTypes" value="0x39" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>10:</strong>
                            <input id="ck010" type="checkbox" name="CardTypes" value="0x0A" /><strong>方块</strong>
                            <input id="ck110" type="checkbox" name="CardTypes" value="0x1A" /><strong>梅花</strong>
                            <input id="ck210" type="checkbox" name="CardTypes" value="0x2A" /><strong>红桃</strong>
                            <input id="ck310" type="checkbox" name="CardTypes" value="0x3A" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>J：</strong>
                            <input id="ck011" type="checkbox" name="CardTypes" value="0x0B" /><strong>方块</strong>
                            <input id="ck111" type="checkbox" name="CardTypes" value="0x1B" /><strong>梅花</strong>
                            <input id="ck211" type="checkbox" name="CardTypes" value="0x2B" /><strong>红桃</strong>
                            <input id="ck311" type="checkbox" name="CardTypes" value="0x3B" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>Q：</strong>
                            <input id="ck012" type="checkbox" name="CardTypes" value="0x0C" /><strong>方块</strong>
                            <input id="ck112" type="checkbox" name="CardTypes" value="0x1C" /><strong>梅花</strong>
                            <input id="ck212" type="checkbox" name="CardTypes" value="0x2C" /><strong>红桃</strong>
                            <input id="ck312" type="checkbox" name="CardTypes" value="0x3C" /><strong>黑桃</strong>
                        </div>
                        <div class="form-group">
                            <strong>K：</strong>
                            <input id="ck013" type="checkbox" name="CardTypes" value="0x0D" /><strong>方块</strong>
                            <input id="ck113" type="checkbox" name="CardTypes" value="0x1D" /><strong>梅花</strong>
                            <input id="ck213" type="checkbox" name="CardTypes" value="0x2D" /><strong>红桃</strong>
                            <input id="ck313" type="checkbox" name="CardTypes" value="0x3D" /><strong>黑桃</strong>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary " onclick="dj()">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="lblpermissions" runat="server" OnClick="lblpermissions_Click" Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="lib/bootstrap/js/bootstrap-datepicker.js"></script>
        <script src="lib/bootstrap/js/bootstrap-datepicker.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>
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
            $(document).ready(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%'
                });
            });
            function ck() {
                $('[name=CheatType]:checkbox').iCheck('uncheck');
                $("#ckbts").iCheck('uncheck');
                var str = "";
                str = $("#txtck").val();
                if (str != "") {
                    var arr = str.split(',');//注split可以用字符或字符串分割
                    for (var i = 0; i < arr.length; i++) {
                        $("#ck" + arr[i]).iCheck('check');
                    }
                }
            }
            $(document).ready(function () {
                $("input[name='CardTypes']").on('ifChecked', function (event) {
                    $("#count").html($("input[name='CardTypes']:checked").length);
                });
                $("input[name='CardTypes']").on('ifUnchecked', function (event) {
                    $("#count").html($("input[name='CardTypes']:checked").length);
                });
                var count = $("#count").html();
                if(count!=13)
                    $("#lblpermissions").attr('href', '#');
                else
                    $("#lblpermissions").attr('href', "javascript:__doPostBack('lblpermissions','')");
            })
            function dj()
            {
                var count = $("#count").html();
                if (count != 13)
                    window.location.href = "#";
                else
                    window.location.href = "javascript:__doPostBack('lblpermissions','')";
            }
        </script>
        <script src="lib/bootstrap/js/bootstrap.js"></script>
        <script src="lib/bootstrap/js/bootstrapValidator.js"></script>
        <script src="lib/bootstrap/js/zh_CN.js"></script>


        <script src="lib/bootstrap/js/icheck.js"></script>
        <script src="lib/bootstrap/js/custom.min.js"></script>
    </form>
</body>
</html>
