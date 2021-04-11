<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaurusCheat.aspx.cs" Inherits="GameAdminWeb.TaurusCheat" %>

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
                <%--<li id="systemmanagement" runat="server"><a href="UserCheat.aspx" name="SystemManagement" data-target=".dashboard-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa fa-caret-right"></i>十三水作弊授权</a></li>
                --%><li id="Li1" runat="server"><a href="TaurusCheat.aspx" name="SystemManagement" data-target=".dashboard-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa fa-caret-right"></i>牛牛作弊授权</a></li>
                <li><a href="ChangePassword.aspx" data-target=".Promoter-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-unlock-alt"></i>修改密码</a></li>

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
                                            <th>修改</th>
                                            <th>用户id</th>
                                            <th>用户昵称</th>
                                            <th>是否开启作弊功能</th>
                                            <th>作弊牌型</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_Cheat" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                   <td> <asp:LinkButton ID="btnSearch" runat="server" OnCommand="lbtEdit_Command" CommandArgument='<%#Eval("UserID") %>'><i class="fa fa-pencil"  title="授权" ></i></asp:LinkButton></td>
                                                    <td><%#Eval("UserID")%></td>
                                                    <td><%#Eval("NickName")%></td>
                                                    <td><%# Convert.ToBoolean(Eval("Swith")) == true?"开启":"关闭"%></td>
                                                    <td><%#Eval("PaiXingIndex")%></td>
                                                    
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
                    <asp:Label ID="lblmenucode" runat="server" Text="" Visible="false"></asp:Label>
                    <div class="tree well " id="MenuM" runat="server">
                        <div class="form-group">
                            <input id="ckbts" type="checkbox"  name="Swith" value="0" /><strong>是否启用作弊</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd7" type="radio" name="PaiXingIndex" value="7" checked /><strong>牛7</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input id="rd13" type="radio" name="PaiXingIndex" value="13" /><strong>五花牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd8" type="radio" name="PaiXingIndex" value="8" /><strong>牛8</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <input id="rd14" type="radio" name="PaiXingIndex" value="14" /><strong>同花牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd9" type="radio" name="PaiXingIndex" value="9" /><strong>牛9</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <input id="rd15" type="radio" name="PaiXingIndex" value="15" /><strong>葫芦牛</strong>
                        </div>
                         <div class="form-group">
                            <input id="rd10" type="radio" name="PaiXingIndex" value="10" /><strong>牛牛</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <input id="rd16" type="radio" name="PaiXingIndex" value="16" /><strong>炸弹牛</strong>
                        </div>
                         <div class="form-group">
                            <input id="rd11" type="radio" name="PaiXingIndex" value="11" /><strong>五小牛</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <input id="rd17" type="radio" name="PaiXingIndex" value="17" /><strong>同花顺牛</strong>
                        </div>
                         <div class="form-group">
                            <input id="rd12" type="radio" name="PaiXingIndex" value="12" /><strong>顺子牛</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <input id="rd8868" type="radio" name="PaiXingIndex" value="8868" /><strong>最大牌</strong>
                        </div> 
                           <div class="form-group">
                            <input id="rd8867" type="radio" name="PaiXingIndex" value="8867" /><strong>最小牌</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                      <%--              
                         <div class="form-group">
                            <input id="rd13" type="radio" name="PaiXingIndex" value="13" /><strong>五花牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd14" type="radio" name="PaiXingIndex" value="14" /><strong>同花牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd15" type="radio" name="PaiXingIndex" value="15" /><strong>葫芦牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd16" type="radio" name="PaiXingIndex" value="16" /><strong>炸弹牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd17" type="radio" name="PaiXingIndex" value="17" /><strong>同花顺牛</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd8868" type="radio" name="PaiXingIndex" value="8868" /><strong>最大牌</strong>
                        </div>
                        <div class="form-group">
                            <input id="rd8867" type="radio" name="PaiXingIndex" value="8867" /><strong>最小牌</strong>--%>
                        
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
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
                str = $("#txtckts").val();
                if (str == "True") {
                    $("#ckbts").iCheck('check');
                }
                str = $("#txtck").val();
                if (str != "") {
                    var arr = str.split(',');//注split可以用字符或字符串分割
                    for (var i = 0; i < arr.length; i++) {
                        $("#rd" + arr[i]).iCheck('check');
                    }
                }
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
