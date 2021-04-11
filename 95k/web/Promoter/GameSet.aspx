<%@ Page Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="GameSet.aspx.cs" Inherits="GameAdminWeb.Promoter.GameSet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content">
        <div class="header">

            <h1 class="page-title">游戏公告设置</h1>
            <ul class="breadcrumb">
                <li><a href="../Promoter/PromoterManagement.aspx?page=Promoter&type=PromoterManagement">首页</a> </li>
                <li><a href="../Promoter/PromoterManagement.aspx?page=Promoter&type=PromoterManagement">推广员管理</a> </li>
                <li class="active">游戏公告设置</li>
            </ul>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-content">
                    <div class="main-content">
                        <div class="table-responsive">
                        <table id="datatable"  
                            class="table table-hover table-bordered page-header table-striped">
                                <thead>
                                    <tr>
                                        <th id="Set" runat="server" style="width: 3em;display:none"><input  type="checkbox" id="checkall" title="全选"/></th>
                                        <th>参数编码</th>
                                        <th>参数值</th>  
                                        <th>参数描述</th>
                                        <th style="width: 4.5em;display:none" id="Controls" runat="server"></th>
                                    </tr>
                                </thead>
                                <tbody id="heihei2" onclick="lbtheihei2()" >
                                    <asp:Repeater ID="rpt_Status" runat="server">
                                        <ItemTemplate>  
                                            <tr id="heihei" onclick="lbtheihei('<%#Eval("StatusName")%>')">
                                                <td id="Set" runat="server" style="display:none"><input  type="checkbox" value="<%#Eval("StatusName")%>" name="ckbid"/></td>
                                                <td id="ckone"><a id="click" href="javascript:void(0);" onclick="qqq()"><%#Eval("StatusName")%></a></td>
                                                <td><a id="click1" href="javascript:void(0);"><%#Eval("StatusValue")%></a></td>
                                                <td><a id="click2" href="javascript:void(0);"><%#Eval("StatusString")%></a></td>
                                                <td id="Controls" runat="server" style="display:none">
                                                    <%--data-toggle="modal" data-target="#myModal"--%>
                                                    <asp:LinkButton ID="lbtshow" runat="server" OnCommand="lbtshow_Command" CommandArgument='<%#Eval("StatusName")%>'><i class="fa fa-pencil" ></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbtn_delete" runat="server" OnCommand="lbtn_delete_Command" CommandArgument='<%#Eval("StatusName") %>' OnClientClick="return confirm('确定删除？');"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <tr id="ControlsSet" runat="server" style="display:none">
                                        <td colspan="5">
                                            <asp:LinkButton ID="lbladd" runat="server" OnClick="lbladd_Click"><i class="fa fa-plus-circle" title="新增" style="font-size:x-large;"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbtn_delete" runat="server" OnClick="lbtn_delete_Click" OnClientClick="return confirm('确定删除所有选择项？');"><i class="fa fa-trash-o"  title="删除" style="font-size:x-large;"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lblrefresh" runat="server" OnClick="lblrefresh_Click"><i class="fa fa-refresh" title="刷新" style="font-size:x-large;"></i></asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <nav style="text-align: center">
                            <ul class="pagination">
                                <li><a class="current">第<asp:Literal ID="ltr_current" runat="server"></asp:Literal>页</a></li>
                                <li>
                                    <asp:LinkButton ID="lbt_home" runat="server" CssClass="visible-lg" OnClick="lbt_home_Click">首页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_prev" runat="server" OnClick="lbt_prev_Click">上一页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_next" runat="server" OnClick="lbt_next_Click">下一页</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbt_last" runat="server" CssClass="visible-lg" OnClick="lbt_last_Click">尾页</asp:LinkButton></li>
                                <li><a class="current">共<asp:Literal ID="ltr_sum" runat="server"></asp:Literal>页</a></li>
                            </ul>
                        </nav>
                    </div>
                    <input type="text" name="txt_StatusName" class="form-control" id="txt_StatusName"  placeholder="id" style="display:none" value="" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改游戏设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>参数值</label>
                            <input type="text" name="txt_StatusValue" class="form-control" id="txt_StatusValue"  placeholder="参数值" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" />
                        </div>
                        <div class="form-group">
                            <label>参数描述</label>
                            <input type="text" name="txt_StatusString" class="form-control" id="txt_StatusString"  placeholder="参数描述" value="" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <%--<asp:LinkButton ID="lblSave" runat="server" onclick="lbtheihei_Click"  Style='color: white;'>保存</asp:LinkButton>--%>
                            <LinkButton id="lblSave"  onclick="lbtheihei_Click()" style='color: white;'>保存</LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="modal1">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="myModalLabel1">新增游戏设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>参数编号</label>
                            <input type="text" name="txt_StatusName" class="form-control" id="txtStatusName" runat="server" placeholder="参数编号" />
                        </div>
                        <div class="form-group">
                            <label>参数值</label>
                            <input type="text" name="txt_StatusValue" class="form-control" id="txtStatusValue" runat="server" placeholder="参数值" />
                        </div>
                        <div class="form-group">
                            <label>参数描述</label>
                            <input type="text" name="txt_StatusString" class="form-control" id="txtStatusString" runat="server" placeholder="参数描述" />
                        </div>
                        <div class="form-group">
                            <label>键值说明</label>
                            <input type="text" name="txt_StatusTip" class="form-control" id="txtStatusTip" runat="server" placeholder="键值说明" />
                        </div>
                        <div class="form-group">
                            <label>键值</label>
                            <input type="text" name="txt_StatusDescription" class="form-control" id="txtStatusDescription" runat="server" placeholder="键值" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"></button>--%>
                        <div class="btn btn-primary ">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            <asp:LinkButton ID="LinkButton1" runat="server"  Style='color: white;'>保存</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <hr />


          <%--  <p class="pull-right">粤信游公司</p>--%>
            <p>© 2017 <a href="#" target="_blank">游戏后台</a></p>
        </footer>
    </div>
 
    <script src="../lib/bootstrap/js/bootstrap-datepicker.js"></script>
    <script src="../lib/bootstrap/js/bootstrap-datepicker.min.js"></script>
    <script src="../lib/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="../lib/jquery-1.11.1.min.js"></script>
    <script src="../lib/jquery.imagesloaded.min.js"></script>
    <script src="../lib/jquery.isotope.min.js"></script>
    <script src="../lib/jquery.masonry.min.js"></script>
    <script src="../lib/jquery.peity.min.js"></script>

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

        function lbtheihei(sname) {
           
            //var s = document.getElementById('ckone').valueOf();
            //alert(s);
            //$('#heihei').on('click', function () {
           //var sname = document.getElementById('datatable').text;
           //alert(sname.rows[id].cells[0].innerHtml);
                //var s = document.getElementById('ckone').text;
                //alert(s);
            $.ajax({
                url: 'gameset.ashx?sname='+sname,
                type: 'GET',
                dataType: 'json',
                timeout: 5000,
                cache: false,
                beforeSend: LoadFunction, //加载执行方法    
                error: erryFunction,  //错误执行方法    
                success: succFunction //成功执行方法    
            })
            function LoadFunction() {
                //加载事件
            }
            function erryFunction() {
            }
            function succFunction(data) {
                if (data.ok) {
                 
                    $("#txt_StatusName").val(data.ds[0].StatusName);
              
                    $("#txt_StatusValue").val(data.ds[0].StatusValue);
                   
                    $("#txt_StatusString").val(data.ds[0].StatusString);
                 
                    $('#myModal').modal('show');
                }
            }
            };
        //};

       function lbtheihei_Click() {
            var sname = $("#txt_StatusName").val();
            var svalue = $("#txt_StatusValue").val();
            var sstring = $("#txt_StatusString").val();
            if(svalue=="")
            {
                alert("参数值不能为空");
                return false;
            }
            if (sstring=="")
            {
                alert("参数描述不能为空");
                return false;
            }
            //alert(sstring);
            $.ajax({
                url: 'GmSet.ashx?sname=' + sname + '&svalue=' + svalue + '&sstring=' + sstring,
                type: 'GET',
                dataType: 'json',
                timeout: 5000,
                cache: false,
                beforeSend: LoadFunction, //加载执行方法    
                error: erryFunction,  //错误执行方法    
                success: succFunction //成功执行方法    
            })
            function erryFunction() {
           
            }
            function LoadFunction() {
                alert("修改成功！");
                location = location;
                //加载事件
            }
           
            function succFunction(data) {
                if (data.ok) {
                    //location = location;
                    //alert("修改成功！");
                }
            }
        }
    </script>

   <%-- <script type="text/javascript">

      
        $(function () {

            $("#click").on("click",function(){
        

                alert('11');
                window.location.href="http://www.baidu.com";
        
            });
            $(".datepicker").datepicker({
                language: "zh-CN",
                autoclose: true,//选中之后自动隐藏日期选择框
                clearBtn: true,//清除按钮
                //todayBtn: true,//今日按钮
                format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
            });
        });
        $("#datatable").on("click-row.bs.table",function(e, row, $element){
            //var  index= $element.data('index');

            $('#myModal').modal('show');
            //view(row.id);
        })
     

        //触发的事件  
        function ti(StatusName) {  
            //查询详细  
            $.ajax({  
                type : "POST",  
                data : {  
                    "StatusName" : StatusName  
                },  
                dataType : "json",  
                url : "GameSet.aspx.cs",  
                success : function(data) {  
           

                    $('#myModal').modal('show'); //模态框  
                }  
            });  
        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
            $(document).ready(function () {
                $('.table-responsive input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    increaseArea: '20%'
                });
                $('#checkall').on('ifChecked', function (event) {
                    $('[name=ckbid]:checkbox').iCheck('check');
                });
                $('#checkall').on('ifUnchecked', function (event) {
                    $('[name=ckbid]:checkbox').iCheck('uncheck');
                });
            });
        });
    </script>--%>
</asp:Content>
